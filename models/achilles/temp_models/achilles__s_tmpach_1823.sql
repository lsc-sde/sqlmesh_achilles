
MODEL (
  name @temp_schema.achilles__s_tmpach_1823,
  kind FULL,
  cron '@daily'
);

-- 1823	Number of measurement records, by measurement_concept_id and operator_concept_id
select
  1823 as analysis_id,
  CAST(m.measurement_concept_id as VARCHAR(255)) as stratum_1,
  CAST(m.operator_concept_id as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(*) as count_value
from
  `@src_database`.`@src_schema_omop`.`measurement` as m
inner join
  `@src_database`.`@src_schema_omop`.`observation_period` as op
  on
    m.person_id = op.person_id
    and
    m.measurement_date >= op.observation_period_start_date
    and
    m.measurement_date <= op.observation_period_end_date
group by
  m.measurement_concept_id,
  m.operator_concept_id
