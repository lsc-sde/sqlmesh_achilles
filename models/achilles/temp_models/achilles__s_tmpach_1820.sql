
MODEL (
  name @temp_schema.achilles__s_tmpach_1820,
  kind FULL,
  cron '@daily'
);

-- 1820	Number of measurement records  by measurement start month
with rawData as (
  select
    YEAR(m.measurement_date) * 100 + MONTH(m.measurement_date) as stratum_1,
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
  group by
    YEAR(m.measurement_date) * 100 + MONTH(m.measurement_date)
)

select
  1820 as analysis_id,
  count_value,
  CAST(stratum_1 as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5
from
  rawData
