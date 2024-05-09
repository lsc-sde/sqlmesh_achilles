
MODEL (
  name @temp_schema.achilles__s_tmpach_720,
  kind FULL,
  cron '@daily'
);

-- 720	Number of drug exposure records by condition occurrence start month
with rawData as (
  select
    YEAR(de.drug_exposure_start_date) * 100
    + MONTH(de.drug_exposure_start_date) as stratum_1,
    COUNT(de.person_id)::FLOAT as count_value
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
    YEAR(de.drug_exposure_start_date) * 100 + MONTH(de.drug_exposure_start_date)
)

select
  720 as analysis_id,
  count_value,
  CAST(stratum_1 as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5
from
  rawData
