
MODEL (
  name @temp_schema.achilles__s_tmpach_1304,
  kind FULL,
  cron '@daily'
);

-- 1304	Number of persons with at least one visit detail, by visit_detail_concept_id by calendar year by gender by age decile
--HINT DISTRIBUTE_ON_KEY(stratum_1)
with rawData as (
  select
    vd.visit_detail_concept_id as stratum_1,
    p.gender_concept_id as stratum_3,
    YEAR(vd.visit_detail_start_date) as stratum_2,
    FLOOR((YEAR(vd.visit_detail_start_date) - p.year_of_birth) / 10)
    as stratum_4,
    COUNT(distinct p.person_id) as count_value
  from
    `@src_omop_schema`.`person` as p
  inner join
    `@src_omop_schema`.`visit_detail` as vd
    on
      p.person_id = vd.person_id
  inner join
    `@src_omop_schema`.`observation_period` as op
    on
      vd.person_id = op.person_id
      and
      vd.visit_detail_start_date >= op.observation_period_start_date
      and
      vd.visit_detail_start_date <= op.observation_period_end_date
  group by
    vd.visit_detail_concept_id,
    YEAR(vd.visit_detail_start_date),
    p.gender_concept_id,
    FLOOR((YEAR(vd.visit_detail_start_date) - p.year_of_birth) / 10)
)

select
  1304 as analysis_id,
  count_value,
  CAST(stratum_1 as VARCHAR(255)) as stratum_1,
  CAST(stratum_2 as VARCHAR(255)) as stratum_2,
  CAST(stratum_3 as VARCHAR(255)) as stratum_3,
  CAST(stratum_4 as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5
from
  rawData
