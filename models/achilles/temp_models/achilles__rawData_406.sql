
MODEL (
  name @temp_schema.achilles__rawData_406,
  kind FULL,
  cron '@daily'
);

-- 406	Distribution of age by condition_concept_id
select
  c.condition_concept_id as subject_id,
  p.gender_concept_id,
  (c.condition_start_year - p.year_of_birth) as count_value
from
  `@src_database`.`@src_schema_omop`.`person` as p
inner join (
  select
    co.person_id,
    co.condition_concept_id,
    MIN(YEAR(co.condition_start_date)) as condition_start_year
  from
    `@src_database`.`@src_schema_omop`.`condition_occurrence` as co
  inner join
    `@src_database`.`@src_schema_omop`.`observation_period` as op
    on
      co.person_id = op.person_id
      and
      co.condition_start_date >= op.observation_period_start_date
      and
      co.condition_start_date <= op.observation_period_end_date
  group by
    co.person_id,
    co.condition_concept_id
) as c
  on
    p.person_id = c.person_id
