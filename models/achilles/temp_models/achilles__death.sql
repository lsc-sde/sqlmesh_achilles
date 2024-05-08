
MODEL (
  name @temp_schema.achilles__death,
  kind FULL,
  cron '@daily'
);

select distinct person_id from `@src_database`.`@src_schema_omop`.`death`
