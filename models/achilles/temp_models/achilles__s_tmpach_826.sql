
MODEL (
  name @temp_schema.achilles__s_tmpach_826,
  kind FULL,
  cron '@daily'
);

-- 826	Number of observation records, by value_as_concept_id
select
  826 as analysis_id,
  CAST(o.value_as_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(*)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`observation` as o
inner join
  `@src_database`.`@src_schema_omop`.`observation_period` as op
  on
    o.person_id = op.person_id
    and
    o.observation_date >= op.observation_period_start_date
    and
    o.observation_date <= op.observation_period_end_date
group by
  o.value_as_concept_id
