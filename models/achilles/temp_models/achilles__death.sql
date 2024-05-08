
MODEL (
  name @temp_schema.achilles__death,
  kind FULL,
  cron '@daily'
);

select distinct person_id from {{ source("omop", "death" ) }}
