
MODEL (
  name @temp_schema.achilles__s_tmpach_501,
  kind FULL,
  cron '@daily'
);

-- 501	Number of records of death, by cause_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
select
  501 as analysis_id,
  CAST(d.cause_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(d.person_id) as count_value
from
  `@src_omop_schema`.`death` as d
inner join
  `@src_omop_schema`.`observation_period` as op
  on
    d.person_id = op.person_id
    and
    d.death_date >= op.observation_period_start_date
    and
    d.death_date <= op.observation_period_end_date
group by
  d.cause_concept_id
