
MODEL (
  name @temp_schema.achilles__s_tmpach_112,
  kind FULL,
  cron '@daily'
);

-- 112	Number of persons by observation period end month
with rawData as (
  select
    YEAR(op1.observation_period_end_date) * 100
    + MONTH(op1.observation_period_end_date) as stratum_1,
    COUNT(distinct op1.PERSON_ID)::FLOAT as count_value
  from
    `@src_database`.`@src_schema_omop`.`observation_period` as op1
  group by
    YEAR(op1.observation_period_end_date) * 100
    + MONTH(op1.observation_period_end_date)
)

select
  112 as analysis_id,
  count_value,
  CAST(stratum_1 as VARCHAR(255)) as stratum_1,
  CAST(null as VARCHAR(255)) as stratum_2,
  CAST(null as VARCHAR(255)) as stratum_3,
  CAST(null as VARCHAR(255)) as stratum_4,
  CAST(null as VARCHAR(255)) as stratum_5
from rawData
