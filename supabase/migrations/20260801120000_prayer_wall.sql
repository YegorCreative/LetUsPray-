-- Prayer Wall (Community Platform, Version 1)
-- See Docs/CommunityPlatform-Architecture.md for the full architecture this implements.
--
-- Scope: prayer_requests + prayer_supports only. `status` exists on prayer_requests so a
-- future Answered Prayers phase can use it without another migration, but nothing in this
-- migration or the app implements marking a request answered yet.
--
-- This file is a migration, not something to run by hand against production. Apply it with
-- `supabase db push` or the Supabase SQL editor.

create table if not exists public.prayer_requests (
    id uuid primary key default gen_random_uuid(),
    user_id uuid not null references auth.users(id) on delete cascade,
    title text not null,
    description text not null,
    category text not null check (category in (
        'healing', 'family', 'marriage', 'children', 'school', 'work',
        'financial', 'salvation', 'church', 'missions', 'thanksgiving', 'other'
    )),
    visibility text not null default 'public' check (visibility in ('public', 'private')),
    is_anonymous boolean not null default false,
    prayer_count integer not null default 0,
    status text not null default 'open' check (status in ('open', 'answered')),
    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now()
);

create table if not exists public.prayer_supports (
    id uuid primary key default gen_random_uuid(),
    prayer_request_id uuid not null references public.prayer_requests(id) on delete cascade,
    user_id uuid not null references auth.users(id) on delete cascade,
    created_at timestamptz not null default now(),
    unique (prayer_request_id, user_id) -- "I Prayed" once per user per request, enforced here.
);

create index if not exists prayer_requests_visibility_created_at_idx
    on public.prayer_requests (visibility, created_at desc);

create index if not exists prayer_supports_request_idx
    on public.prayer_supports (prayer_request_id);

-- Keep prayer_count in sync with prayer_supports automatically.
create or replace function public.handle_prayer_support_inserted()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
    update public.prayer_requests
    set prayer_count = prayer_count + 1
    where id = new.prayer_request_id;
    return new;
end;
$$;

drop trigger if exists prayer_supports_increment_count on public.prayer_supports;
create trigger prayer_supports_increment_count
    after insert on public.prayer_supports
    for each row execute function public.handle_prayer_support_inserted();

create or replace function public.handle_prayer_request_updated()
returns trigger
language plpgsql
as $$
begin
    new.updated_at = now();
    return new;
end;
$$;

drop trigger if exists prayer_requests_touch_updated_at on public.prayer_requests;
create trigger prayer_requests_touch_updated_at
    before update on public.prayer_requests
    for each row execute function public.handle_prayer_request_updated();

alter table public.prayer_requests enable row level security;
alter table public.prayer_supports enable row level security;

-- Visible: public requests, or your own (including your own private ones).
drop policy if exists "Prayer requests are viewable" on public.prayer_requests;
create policy "Prayer requests are viewable"
    on public.prayer_requests for select
    using (visibility = 'public' or user_id = auth.uid());

drop policy if exists "Users can create their own prayer requests" on public.prayer_requests;
create policy "Users can create their own prayer requests"
    on public.prayer_requests for insert
    with check (user_id = auth.uid());

drop policy if exists "Users can update their own prayer requests" on public.prayer_requests;
create policy "Users can update their own prayer requests"
    on public.prayer_requests for update
    using (user_id = auth.uid())
    with check (user_id = auth.uid());

drop policy if exists "Users can delete their own prayer requests" on public.prayer_requests;
create policy "Users can delete their own prayer requests"
    on public.prayer_requests for delete
    using (user_id = auth.uid());

-- Support rows are visible for any request the viewer can already see — needed for accurate
-- counts and "did I already pray" checks.
drop policy if exists "Prayer supports are viewable for visible requests" on public.prayer_supports;
create policy "Prayer supports are viewable for visible requests"
    on public.prayer_supports for select
    using (
        exists (
            select 1 from public.prayer_requests pr
            where pr.id = prayer_request_id
              and (pr.visibility = 'public' or pr.user_id = auth.uid())
        )
    );

drop policy if exists "Users can record their own prayer support" on public.prayer_supports;
create policy "Users can record their own prayer support"
    on public.prayer_supports for insert
    with check (user_id = auth.uid());

drop policy if exists "Users can remove their own prayer support" on public.prayer_supports;
create policy "Users can remove their own prayer support"
    on public.prayer_supports for delete
    using (user_id = auth.uid());
