
MODEL (
  name @temp_schema.achilles__s_tmpach_1802,
  kind FULL,
  cron '@daily'
);

-- 1802	Number of persons by measurement occurrence start month, by measurement_concept_id
with rawData as (
  select
    m.measurement_concept_id as stratum_1,
    YEAR(m.measurement_date) * 100 + MONTH(m.measurement_date) as stratum_2,
    COUNT(distinct m.person_id)::FLOAT as count_value
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
    YEAR(m.measurement_date) * 100 + MONTH(m.measurement_date)
)

select
  1802 as analysis_id,
  count_value,
  CAST(stratum_1 as VARCHAR(255)) as stratum_1,
  CAST(stratum_2 as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5
from
  rawData
