
MODEL (
  name @temp_schema.achilles__s_tmpach_1811,
  kind FULL,
  cron '@daily'
);

-- 1811	Number of measurement records with a value (with a mapped, non-null value_as_number)
select
  1811 as analysis_id,
  CAST(NULL as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(m.person_id)::FLOAT as count_value
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
where
  m.value_as_number is not NULL
  or
  m.value_as_concept_id != 0
