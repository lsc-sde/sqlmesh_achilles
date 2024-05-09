
MODEL (
  name @temp_schema.achilles__s_tmpach_2105,
  kind FULL,
  cron '@daily'
);

-- 2105	Number of exposure records by device_concept_id by device_type_concept_id
select
  2105 as analysis_id,
  CAST(de.device_concept_id as VARCHAR(255)) as stratum_1,
  CAST(de.device_type_concept_id as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(de.person_id)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`device_exposure` as de
inner join
  `@src_database`.`@src_schema_omop`.`observation_period` as op
  on
    de.person_id = op.person_id
    and
    de.device_exposure_start_date >= op.observation_period_start_date
    and
    de.device_exposure_start_date <= op.observation_period_end_date
group by
  de.device_concept_id,
  de.device_type_concept_id
