
MODEL (
  name @temp_schema.achilles__rawData_2106,
  kind FULL,
  cron '@daily'
);

-- 2106	Distribution of age by device_concept_id
select
  o.device_concept_id as subject_id,
  p.gender_concept_id,
  o.device_exposure_start_year - p.year_of_birth::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`person` as p
inner join (
  select
    d.person_id,
    d.device_concept_id,
    MIN(YEAR(d.device_exposure_start_date)) as device_exposure_start_year
  from
    `@src_database`.`@src_schema_omop`.`device_exposure` as d
  inner join
    `@src_database`.`@src_schema_omop`.`observation_period` as op
    on
      d.person_id = op.person_id
      and
      d.device_exposure_start_date >= op.observation_period_start_date
      and
      d.device_exposure_start_date <= op.observation_period_end_date
  group by
    d.person_id,
    d.device_concept_id
) as o
  on
    p.person_id = o.person_id
