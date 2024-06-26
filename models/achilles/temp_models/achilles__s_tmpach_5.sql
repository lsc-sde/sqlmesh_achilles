
MODEL (
  name @temp_schema.achilles__s_tmpach_5,
  kind FULL,
  cron '@daily'
);

-- 5	Number of persons by ethnicity
select
  5 as analysis_id,
  cast(ETHNICITY_CONCEPT_ID as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(distinct person_id)::FLOAT as count_value
from `@src_database`.`@src_schema_omop`.`person`
group by ETHNICITY_CONCEPT_ID
