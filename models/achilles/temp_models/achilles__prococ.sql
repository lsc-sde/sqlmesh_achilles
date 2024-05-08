
MODEL (
  name @temp_schema.achilles__prococ,
  kind FULL,
  cron '@daily'
);

select distinct person_id from `@src_omop_schema`.`procedure_occurrence`
