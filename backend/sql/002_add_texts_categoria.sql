-- ============================================================
-- Add categoria to texts for future editorial filtering
-- Manual execution in Supabase SQL Editor
-- ============================================================
--
-- Product decision:
-- - topic remains the visible editorial label
-- - categoria becomes the stable filtering slug
-- - one categoria per text in this first version
--
-- Suggested execution flow:
-- 1. Run the preflight query and review current topics
-- 2. Run the schema + backfill
-- 3. Inspect unmatched rows (categoria is null)
-- 4. Extend the CASE mapping if needed
-- 5. Re-run the NOT NULL block once everything is classified

-- ------------------------------------------------------------------
-- 0. Preflight: inspect current text ids, titles and topics
-- ------------------------------------------------------------------
select id, title, topic
from texts
order by published_at desc nulls last, id desc;

-- ------------------------------------------------------------------
-- 1. Schema: add categoria
-- ------------------------------------------------------------------
alter table if exists texts
add column if not exists categoria text;

-- ------------------------------------------------------------------
-- 2. Backfill categoria from current editorial topics
-- ------------------------------------------------------------------
--
-- Extend this mapping if production contains more topic variants.
-- We intentionally leave unmatched rows as null so they are easy to detect.
update texts
set categoria = case
  when topic is null or btrim(topic) = '' then null

  when lower(btrim(topic)) in ('technologie', 'technik', 'ki', 'digitalisierung')
    then 'tecnologia'
  when lower(btrim(topic)) in ('gesellschaft', 'gesellschaft & kultur', 'soziales')
    then 'sociedad'
  when lower(btrim(topic)) in ('umwelt', 'klima', 'nachhaltigkeit')
    then 'medioambiente'
  when lower(btrim(topic)) in ('politik', 'deutschland', 'wahlen', 'regierung')
    then 'politica'
  when lower(btrim(topic)) in ('wirtschaft', 'finanzen', 'arbeitswelt')
    then 'economia'
  when lower(btrim(topic)) in ('sport')
    then 'deporte'
  when lower(btrim(topic)) in ('bildung', 'ausbildung', 'schule', 'universitat', 'universität')
    then 'educacion'
  when lower(btrim(topic)) in ('gesundheit', 'medizin')
    then 'salud'
  when lower(btrim(topic)) in ('wissenschaft', 'forschung')
    then 'ciencia'
  when lower(btrim(topic)) in ('kultur')
    then 'cultura'
  when lower(btrim(topic)) in ('internationales', 'welt', 'ausland')
    then 'internacional'
  when lower(btrim(topic)) in ('mobilitat', 'mobilität', 'verkehr')
    then 'movilidad'
  else null
end
where categoria is distinct from case
  when topic is null or btrim(topic) = '' then null

  when lower(btrim(topic)) in ('technologie', 'technik', 'ki', 'digitalisierung')
    then 'tecnologia'
  when lower(btrim(topic)) in ('gesellschaft', 'gesellschaft & kultur', 'soziales')
    then 'sociedad'
  when lower(btrim(topic)) in ('umwelt', 'klima', 'nachhaltigkeit')
    then 'medioambiente'
  when lower(btrim(topic)) in ('politik', 'deutschland', 'wahlen', 'regierung')
    then 'politica'
  when lower(btrim(topic)) in ('wirtschaft', 'finanzen', 'arbeitswelt')
    then 'economia'
  when lower(btrim(topic)) in ('sport')
    then 'deporte'
  when lower(btrim(topic)) in ('bildung', 'ausbildung', 'schule', 'universitat', 'universität')
    then 'educacion'
  when lower(btrim(topic)) in ('gesundheit', 'medizin')
    then 'salud'
  when lower(btrim(topic)) in ('wissenschaft', 'forschung')
    then 'ciencia'
  when lower(btrim(topic)) in ('kultur')
    then 'cultura'
  when lower(btrim(topic)) in ('internationales', 'welt', 'ausland')
    then 'internacional'
  when lower(btrim(topic)) in ('mobilitat', 'mobilität', 'verkehr')
    then 'movilidad'
  else null
end;

-- ------------------------------------------------------------------
-- 3. Index for future filtering
-- ------------------------------------------------------------------
create index if not exists texts_categoria_idx on texts (categoria);

-- ------------------------------------------------------------------
-- 4. Verification queries
-- ------------------------------------------------------------------
select id, title, topic, categoria
from texts
order by published_at desc nulls last, id desc;

select categoria, count(*)
from texts
group by categoria
order by categoria;

select id, title, topic
from texts
where categoria is null
order by published_at desc nulls last, id desc;

-- ------------------------------------------------------------------
-- 5. Optional hardening: enforce NOT NULL only if nothing is unmatched
-- ------------------------------------------------------------------
do $$
begin
  if exists (select 1 from texts where categoria is null) then
    raise notice 'texts.categoria still has null values. Review the unmatched topics before enforcing NOT NULL.';
  else
    alter table texts
    alter column categoria set not null;
  end if;
end
$$;
