
MODEL (
  name @temp_schema.achilles__s_tmpach_791,
  kind FULL,
  cron '@daily'
);

-- 791	Number of total persons that have at least x drug exposures
select
  791 as analysis_id,
  CAST(de.drug_concept_id as VARCHAR(255)) as stratum_1,
  CAST(de.drg_cnt as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  SUM(COUNT(de.person_id))
    over (partition by de.drug_concept_id order by de.drg_cnt desc)
 ::FLOAT as count_value
from (
  select
    de.drug_concept_id,
    de.person_id,
    COUNT(de.drug_exposure_id) as drg_cnt
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
group by
  de.drug_concept_id,
  de.drg_cnt
