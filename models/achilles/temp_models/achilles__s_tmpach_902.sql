
MODEL (
  name @temp_schema.achilles__s_tmpach_902,
  kind FULL,
  cron '@daily'
);

-- 902	Number of persons by drug occurrence start month, by drug_concept_id
with rawData as (
  select
    de.drug_concept_id as stratum_1,
    YEAR(de.drug_era_start_date) * 100
    + MONTH(de.drug_era_start_date) as stratum_2,
    COUNT(distinct de.person_id)::FLOAT as count_value
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
    de.drug_concept_id,
    YEAR(de.drug_era_start_date) * 100 + MONTH(de.drug_era_start_date)
)

select
  902 as analysis_id,
  count_value,
  CAST(stratum_1 as VARCHAR(255)) as stratum_1,
  CAST(stratum_2 as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5
from
  rawData
