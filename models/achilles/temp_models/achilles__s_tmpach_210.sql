
MODEL (
  name @temp_schema.achilles__s_tmpach_210,
  kind FULL,
  cron '@daily'
);

-- 210 Number of visit_occurrence records outside a valid observation period
select
  210 as analysis_id,
  CAST(NULL as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(*)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`visit_occurrence` as vo
left join
  `@src_database`.`@src_schema_omop`.`observation_period` as op
  on
    vo.person_id = op.person_id
    and
    vo.visit_start_date >= op.observation_period_start_date
    and
    vo.visit_start_date <= op.observation_period_end_date
where
  op.person_id is NULL
