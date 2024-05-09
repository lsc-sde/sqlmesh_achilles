
MODEL (
  name @temp_schema.achilles__rawData_706,
  kind FULL,
  cron '@daily'
);

-- 706	Distribution of age by drug_concept_id
select
  de.drug_concept_id as subject_id,
  p.gender_concept_id,
  de.drug_start_year - p.year_of_birth::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`person` as p
inner join (
  select
    de.person_id,
    de.drug_concept_id,
    MIN(YEAR(de.drug_exposure_start_date)) as drug_start_year
  from
    `@src_database`.`@src_schema_omop`.`drug_exposure` as de
  inner join
    `@src_database`.`@src_schema_omop`.`observation_period` as op
    on
      de.person_id = op.person_id
      and
      de.drug_exposure_start_date >= op.observation_period_start_date
      and
      de.drug_exposure_start_date <= op.observation_period_end_date
  group by
    de.person_id,
    de.drug_concept_id
) as de
  on
    p.person_id = de.person_id
