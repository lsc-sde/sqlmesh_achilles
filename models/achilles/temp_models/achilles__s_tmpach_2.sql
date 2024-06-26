
MODEL (
  name @temp_schema.achilles__s_tmpach_2,
  kind FULL,
  cron '@daily'
);

-- 2	Number of persons by gender
select
  2 as analysis_id,
  cast(gender_concept_id as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(distinct person_id)::FLOAT as count_value
from `@src_database`.`@src_schema_omop`.`person`
group by GENDER_CONCEPT_ID
