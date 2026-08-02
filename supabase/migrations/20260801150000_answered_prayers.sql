-- Answered Prayers (Community Platform)
-- Extends prayer_requests only — no new table. A Prayer Request becomes an Answered Prayer
-- in place by setting status = 'answered' plus the three columns below; the original request
-- (title/description) is untouched and stays visible. This is not Testimonies — no new
-- entity, no separate post.
--
-- Ownership is already enforced by the existing "Users can update their own prayer requests"
-- RLS policy from 20260801120000_prayer_wall.sql (user_id = auth.uid()), which covers these
-- new columns automatically since they live on the same row. No new policy needed.
--
-- Apply with `supabase db push` or the Supabase SQL editor — not run automatically.

alter table public.prayer_requests
    add column if not exists answer_summary text,
    add column if not exists answer_details text,
    add column if not exists answered_at timestamptz;

-- A request is either answered with a timestamp, or not — keep the two consistent.
alter table public.prayer_requests
    drop constraint if exists prayer_requests_answered_consistency;
alter table public.prayer_requests
    add constraint prayer_requests_answered_consistency
    check (
        (status = 'answered' and answered_at is not null)
        or (status = 'open' and answered_at is null)
    );
