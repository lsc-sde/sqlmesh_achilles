
MODEL (
  name @temp_schema.achilles__s_tmpach_901,
  kind FULL,
  cron '@daily'
);

-- 901	Number of drug occurrence records, by drug_concept_id
select
  901 as analysis_id,
  CAST(de.drug_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(de.person_id)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`drug_era` as de
inner join
  `@src_database`.`@src_schema_omop`.`observation_period` as op
  on
    de.person_id = op.person_id
    and
    de.drug_era_start_date >= op.observation_period_start_date
    and
    de.drug_era_start_date <= op.observation_period_end_date
group by
  de.drug_concept_id
