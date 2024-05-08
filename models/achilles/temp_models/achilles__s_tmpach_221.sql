
MODEL (
  name @temp_schema.achilles__s_tmpach_221,
  kind FULL,
  cron '@daily'
);

-- 221	Number of persons by visit start year
with rawData as (
  select
    YEAR(vo.visit_start_date) as stratum_1,
    COUNT(distinct vo.person_id) as count_value
  from
    `@src_database`.`@src_schema_omop`.`visit_occurrence` as vo
  inner join
    `@src_database`.`@src_schema_omop`.`observation_period` as op
    on
      vo.person_id = op.person_id
      and
      vo.visit_start_date >= op.observation_period_start_date
      and
      vo.visit_start_date <= op.observation_period_end_date
  group by
    YEAR(vo.visit_start_date)
)

select
  221 as analysis_id,
  count_value,
  CAST(stratum_1 as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5
from
  rawData
