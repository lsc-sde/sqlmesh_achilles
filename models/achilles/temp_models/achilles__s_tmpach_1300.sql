
MODEL (
  name @temp_schema.achilles__s_tmpach_1300,
  kind FULL,
  cron '@daily'
);

-- 1300	Number of persons with at least one visit detail, by visit_detail_concept_id
-- restricted to visits overlapping with observation period
select
  1300 as analysis_id,
  CAST(vd.visit_detail_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(distinct vd.person_id)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`visit_detail` as vd
inner join
  `@src_database`.`@src_schema_omop`.`observation_period` as op
  on
    vd.person_id = op.person_id
    and
    vd.visit_detail_start_date >= op.observation_period_start_date
    and
    vd.visit_detail_start_date <= op.observation_period_end_date
group by
  vd.visit_detail_concept_id
