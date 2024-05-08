
MODEL (
  name @temp_schema.achilles__prococ,
  kind FULL,
  cron '@daily'
);

select distinct person_id from {{ source("omop", "procedure_occurrence" ) }}
