
MODEL (
  name @temp_schema.achilles__s_tmpach_725,
  kind FULL,
  cron '@daily'
);

-- 725	Number of drug_exposure records, by drug_source_concept_id
select
  725 as analysis_id,
  CAST(de.drug_source_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(*) as count_value
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
  de.drug_source_concept_id
