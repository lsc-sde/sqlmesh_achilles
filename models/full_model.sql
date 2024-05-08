MODEL (
  name sqlmesh_achilles.test_model,
  kind FULL,
  cron '@daily',
  grain person_id
);

SELECT DISTINCT
  person_id::BIGINT
FROM `@src_db`.`@src_schema_omop`.visit_occurrence