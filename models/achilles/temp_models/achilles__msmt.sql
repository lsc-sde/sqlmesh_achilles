
MODEL (
  name @temp_schema.achilles__msmt,
  kind FULL,
  cron '@daily'
);

select distinct person_id from {{ source("omop", "measurement" ) }}
