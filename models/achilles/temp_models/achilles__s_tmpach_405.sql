
MODEL (
  name @temp_schema.achilles__s_tmpach_405,
  kind FULL,
  cron '@daily'
);

-- 405	Number of condition occurrence records, by condition_concept_id by condition_type_concept_id
select
  405 as analysis_id,
  CAST(co.condition_concept_id as VARCHAR(255)) as stratum_1,
  CAST(co.condition_type_concept_id as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(co.person_id)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`condition_occurrence` as co
inner join
  `@src_database`.`@src_schema_omop`.`observation_period` as op
  on
    co.person_id = op.person_id
    and
    co.condition_start_date >= op.observation_period_start_date
    and
    co.condition_start_date <= op.observation_period_end_date
group by
  co.condition_CONCEPT_ID,
  co.condition_type_concept_id
