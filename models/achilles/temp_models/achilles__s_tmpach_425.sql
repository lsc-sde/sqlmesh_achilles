
MODEL (
  name @temp_schema.achilles__s_tmpach_425,
  kind FULL,
  cron '@daily'
);

-- 425	Number of condition_occurrence records, by condition_source_concept_id
select
  425 as analysis_id,
  CAST(co.condition_source_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(*) as count_value
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
  co.condition_source_concept_id
