
MODEL (
  name @temp_schema.achilles__drexp,
  kind FULL,
  cron '@daily'
);

select distinct person_id from {{ source("omop", "drug_exposure" ) }}
