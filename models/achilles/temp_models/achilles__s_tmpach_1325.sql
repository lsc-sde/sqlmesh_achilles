
MODEL (
  name @temp_schema.achilles__s_tmpach_1325,
  kind FULL,
  cron '@daily'
);

-- 1325	Number of visit_detail records, by visit_detail_source_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
select
  1325 as analysis_id,
  CAST(vd.visit_detail_source_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(*) as count_value
from
  `@src_omop_schema`.`visit_detail` as vd
inner join
  `@src_omop_schema`.`observation_period` as op
  on
    vd.person_id = op.person_id
    and
    vd.visit_detail_start_date >= op.observation_period_start_date
    and
    vd.visit_detail_start_date <= op.observation_period_end_date
group by
  visit_detail_source_concept_id
