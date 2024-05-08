
MODEL (
  name @temp_schema.achilles__s_tmpach_1822,
  kind FULL,
  cron '@daily'
);

-- 1822	Number of measurement records, by measurement_concept_id and value_as_concept_id
select
  1822 as analysis_id,
  CAST(m.measurement_concept_id as VARCHAR(255)) as stratum_1,
  CAST(m.value_as_concept_id as VARCHAR(255)) as stratum_2,
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
  m.value_as_concept_id
