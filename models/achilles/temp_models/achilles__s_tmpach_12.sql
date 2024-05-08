
MODEL (
  name @temp_schema.achilles__s_tmpach_12,
  kind FULL,
  cron '@daily'
);

-- 12	Number of persons by race and ethnicity
select
  12 as analysis_id,
  cast(RACE_CONCEPT_ID as VARCHAR(255)) as stratum_1,
  cast(ETHNICITY_CONCEPT_ID as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(distinct person_id) as count_value
from `@src_database`.`@src_schema_omop`.`person`
group by RACE_CONCEPT_ID, ETHNICITY_CONCEPT_ID
