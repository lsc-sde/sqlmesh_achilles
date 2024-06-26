
MODEL (
  name @temp_schema.achilles__rawData_606,
  kind FULL,
  cron '@daily'
);

-- 606	Distribution of age by procedure_concept_id
select
  po.procedure_concept_id as subject_id,
  p.gender_concept_id,
  po.procedure_start_year - p.year_of_birth::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`person` as p
inner join (
  select
    po.person_id,
    po.procedure_concept_id,
    MIN(YEAR(po.procedure_date)) as procedure_start_year
  from
    `@src_database`.`@src_schema_omop`.`procedure_occurrence` as po
  inner join
    `@src_database`.`@src_schema_omop`.`observation_period` as op
    on
      po.person_id = op.person_id
      and
      po.procedure_date >= op.observation_period_start_date
      and
      po.procedure_date <= op.observation_period_end_date
  group by
    po.person_id,
    po.procedure_concept_id
) as po
  on
    p.person_id = po.person_id
