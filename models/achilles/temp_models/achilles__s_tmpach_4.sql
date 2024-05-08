
MODEL (
  name @temp_schema.achilles__s_tmpach_4,
  kind FULL,
  cron '@daily'
);

-- 4	Number of persons by race
--HINT DISTRIBUTE_ON_KEY(stratum_1)
select
  4 as analysis_id,
  cast(RACE_CONCEPT_ID as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(distinct person_id) as count_value
from `@src_omop_schema`.`person`
group by RACE_CONCEPT_ID
