
MODEL (
  name @temp_schema.achilles__s_tmpach_420,
  kind FULL,
  cron '@daily'
);

-- 420	Number of condition occurrence records by condition occurrence start month
with rawData as (
  select
    YEAR(co.condition_start_date) * 100
    + MONTH(co.condition_start_date) as stratum_1,
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
    YEAR(co.condition_start_date) * 100 + MONTH(co.condition_start_date)
)

select
  420 as analysis_id,
  count_value,
  CAST(stratum_1 as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5
from
  rawData
