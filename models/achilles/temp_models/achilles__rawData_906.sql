
MODEL (
  name @temp_schema.achilles__rawData_906,
  kind FULL,
  cron '@daily'
);

-- 906	Distribution of age by drug_concept_id
--HINT DISTRIBUTE_ON_KEY(subject_id)
select
  de.drug_concept_id as subject_id,
  p.gender_concept_id,
  de.drug_start_year - p.year_of_birth as count_value
from
  `@src_omop_schema`.`person` as p
inner join (
  select
    de.person_id,
    de.drug_concept_id,
    MIN(YEAR(de.drug_era_start_date)) as drug_start_year
  from
    `@src_omop_schema`.`drug_era` as de
  inner join
    `@src_omop_schema`.`observation_period` as op
    on
      de.person_id = op.person_id
      and
      de.drug_era_start_date >= op.observation_period_start_date
      and
      de.drug_era_start_date <= op.observation_period_end_date
  group by
    de.person_id,
    de.drug_concept_id
) as de
  on
    p.person_id = de.person_id
