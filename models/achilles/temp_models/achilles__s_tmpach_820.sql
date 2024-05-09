
MODEL (
  name @temp_schema.achilles__s_tmpach_820,
  kind FULL,
  cron '@daily'
);

-- 820	Number of observation records by condition occurrence start month
with rawData as (
  select
    YEAR(o.observation_date) * 100 + MONTH(o.observation_date) as stratum_1,
    COUNT(o.person_id)::FLOAT as count_value
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
    YEAR(o.observation_date) * 100 + MONTH(o.observation_date)
)

select
  820 as analysis_id,
  count_value,
  CAST(stratum_1 as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5
from
  rawData
