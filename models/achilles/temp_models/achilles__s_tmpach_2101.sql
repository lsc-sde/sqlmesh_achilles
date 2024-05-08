
MODEL (
  name @temp_schema.achilles__s_tmpach_2101,
  kind FULL,
  cron '@daily'
);

-- 2101	Number of device exposure  records, by device_concept_id
--HINT DISTRIBUTE_ON_KEY(stratum_1)
select
  2101 as analysis_id,
  CAST(de.device_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(de.person_id) as count_value
from
  `@src_omop_schema`.`device_exposure` as de
inner join
  `@src_omop_schema`.`observation_period` as op
  on
    de.person_id = op.person_id
    and
    de.device_exposure_start_date >= op.observation_period_start_date
    and
    de.device_exposure_start_date <= op.observation_period_end_date
group by
  de.device_concept_id
