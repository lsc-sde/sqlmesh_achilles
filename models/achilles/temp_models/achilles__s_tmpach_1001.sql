
MODEL (
  name @temp_schema.achilles__s_tmpach_1001,
  kind FULL,
  cron '@daily'
);

-- 1001	Number of condition occurrence records, by condition_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
select
  1001 as analysis_id,
  CAST(ce.condition_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(ce.person_id) as count_value
from
  `@src_omop_schema`.`condition_era` as ce
inner join
  `@src_omop_schema`.`observation_period` as op
  on
    ce.person_id = op.person_id
    and
    ce.condition_era_start_date >= op.observation_period_start_date
    and
    ce.condition_era_start_date <= op.observation_period_end_date
group by
  ce.condition_concept_id
