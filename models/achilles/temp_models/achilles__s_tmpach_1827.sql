
MODEL (
  name @temp_schema.achilles__s_tmpach_1827,
  kind FULL,
  cron '@daily'
);

-- 1827	Number of measurement records, by unit_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
select
  1827 as analysis_id,
  CAST(m.unit_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(*) as count_value
from
  `@src_omop_schema`.`measurement` as m
inner join
  `@src_omop_schema`.`observation_period` as op
  on
    m.person_id = op.person_id
    and
    m.measurement_date >= op.observation_period_start_date
    and
    m.measurement_date <= op.observation_period_end_date
group by
  m.unit_concept_id
