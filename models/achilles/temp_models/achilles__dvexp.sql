
MODEL (
  name @temp_schema.achilles__dvexp,
  kind FULL,
  cron '@daily'
);

select distinct person_id from `@src_omop_schema`.`device_exposure`
