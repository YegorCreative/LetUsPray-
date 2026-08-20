-- Optional account sync for authorized local prayer data.
-- Local UserDefaults remains the source of truth while signed out.
-- Rows are strictly owner-scoped: user_id = auth.uid().
-- Apply with `supabase db push` or the Supabase SQL editor — not run automatically.

create table if not exists public.user_prayer_sync (
    user_id uuid primary key references auth.users(id) on delete cascade,
    active_plan_id text not null default '',
    completed_days_by_plan jsonb not null default '{}'::jsonb,
    saved_verse_ids jsonb not null default '[]'::jsonb,
    saved_prayer_records jsonb not null default '[]'::jsonb,
    prayer_journal_entries jsonb not null default '{}'::jsonb,
    current_streak integer not null default 0,
    longest_streak integer not null default 0,
    last_completed_date double precision not null default 0,
    prayer_completion_dates jsonb not null default '[]'::jsonb,
    updated_at timestamptz not null default now()
);

alter table public.user_prayer_sync enable row level security;

drop policy if exists "Users can view their own prayer sync" on public.user_prayer_sync;
create policy "Users can view their own prayer sync"
    on public.user_prayer_sync for select
    using (user_id = auth.uid());

drop policy if exists "Users can insert their own prayer sync" on public.user_prayer_sync;
create policy "Users can insert their own prayer sync"
    on public.user_prayer_sync for insert
    with check (user_id = auth.uid());

drop policy if exists "Users can update their own prayer sync" on public.user_prayer_sync;
create policy "Users can update their own prayer sync"
    on public.user_prayer_sync for update
    using (user_id = auth.uid())
    with check (user_id = auth.uid());

drop policy if exists "Users can delete their own prayer sync" on public.user_prayer_sync;
create policy "Users can delete their own prayer sync"
    on public.user_prayer_sync for delete
    using (user_id = auth.uid());

-- Authenticated users only. The anon role must not read or write private sync data.
grant select, insert, update, delete on table public.user_prayer_sync to authenticated;
revoke all on table public.user_prayer_sync from anon;
revoke all on table public.user_prayer_sync from public;

-- Existing Prayer Wall tables were created without explicit role grants.
-- Public reads should work for signed-out guests; writes remain authenticated-only.
-- RLS policies are unchanged.
grant select on table public.prayer_requests to anon, authenticated;
grant insert, update, delete on table public.prayer_requests to authenticated;
grant select on table public.prayer_supports to anon, authenticated;
grant insert, delete on table public.prayer_supports to authenticated;
