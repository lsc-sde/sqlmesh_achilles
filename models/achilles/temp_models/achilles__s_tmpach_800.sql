
MODEL (
  name @temp_schema.achilles__s_tmpach_800,
  kind FULL,
  cron '@daily'
);

-- 800	Number of persons with at least one observation occurrence, by observation_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
select
  800 as analysis_id,
  CAST(o.observation_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(distinct o.person_id) as count_value
from
  `@src_omop_schema`.`observation` as o
inner join
  `@src_omop_schema`.`observation_period` as op
  on
    o.person_id = op.person_id
    and
    o.observation_date >= op.observation_period_start_date
    and
    o.observation_date <= op.observation_period_end_date
group by
  o.observation_concept_id
