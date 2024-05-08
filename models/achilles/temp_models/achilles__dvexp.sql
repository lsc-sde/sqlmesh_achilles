
MODEL (
  name @temp_schema.achilles__dvexp,
  kind FULL,
  cron '@daily'
);

select distinct person_id from {{ source("omop", "device_exposure" ) }}
