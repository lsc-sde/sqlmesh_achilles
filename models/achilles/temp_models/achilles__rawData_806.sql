
MODEL (
  name @temp_schema.achilles__rawData_806,
  kind FULL,
  cron '@daily'
);

-- 806	Distribution of age by observation_concept_id
select
  o.observation_concept_id as subject_id,
  p.gender_concept_id,
  o.observation_start_year - p.year_of_birth::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`person` as p
inner join (
  select
    o.person_id,
    o.observation_concept_id,
    MIN(YEAR(o.observation_date)) as observation_start_year
  from
    `@src_database`.`@src_schema_omop`.`observation` as o
  inner join
    `@src_database`.`@src_schema_omop`.`observation_period` as op
    on
      o.person_id = op.person_id
      and
      o.observation_date >= op.observation_period_start_date
      and
      o.observation_date <= op.observation_period_end_date
  group by
    o.person_id,
    o.observation_concept_id
) as o
  on
    p.person_id = o.person_id
