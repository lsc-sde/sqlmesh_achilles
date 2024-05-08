
MODEL (
  name @temp_schema.achilles__rawData_1006,
  kind FULL,
  cron '@daily'
);

-- 1006	Distribution of age by condition_concept_id
select
  ce.condition_concept_id as subject_id,
  p.gender_concept_id,
  ce.condition_start_year - p.year_of_birth as count_value
from
  `@src_database`.`@src_schema_omop`.`person` as p
inner join (
  select
    ce.person_id,
    ce.condition_concept_id,
    MIN(YEAR(ce.condition_era_start_date)) as condition_start_year
  from
    `@src_database`.`@src_schema_omop`.`condition_era` as ce
  inner join
    `@src_database`.`@src_schema_omop`.`observation_period` as op
    on
      ce.person_id = op.person_id
      and
      ce.condition_era_start_date >= op.observation_period_start_date
      and
      ce.condition_era_start_date <= op.observation_period_end_date
  group by
    ce.person_id,
    ce.condition_concept_id
) as ce
  on
    p.person_id = ce.person_id
