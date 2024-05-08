
MODEL (
  name @temp_schema.achilles__s_tmpach_1804,
  kind FULL,
  cron '@daily'
);

-- 1804	Number of persons with at least one measurement occurrence, by measurement_concept_id by calendar year by gender by age decile
with rawData as (
  select
    m.measurement_concept_id as stratum_1,
    p.gender_concept_id as stratum_3,
    YEAR(m.measurement_date) as stratum_2,
    FLOOR((YEAR(m.measurement_date) - p.year_of_birth) / 10) as stratum_4,
    COUNT(distinct p.person_id) as count_value
  from
    `@src_database`.`@src_schema_omop`.`person` as p
  inner join
    `@src_database`.`@src_schema_omop`.`measurement` as m
    on
      p.person_id = m.person_id
  inner join
    `@src_database`.`@src_schema_omop`.`observation_period` as op
    on
      m.person_id = op.person_id
      and
      m.measurement_date >= op.observation_period_start_date
      and
      m.measurement_date <= op.observation_period_end_date
  group by
    m.measurement_concept_id,
    YEAR(m.measurement_date),
    p.gender_concept_id,
    FLOOR((YEAR(m.measurement_date) - p.year_of_birth) / 10)
)

select
  1804 as analysis_id,
  count_value,
  CAST(stratum_1 as VARCHAR(255)) as stratum_1,
  CAST(stratum_2 as VARCHAR(255)) as stratum_2,
  CAST(stratum_3 as VARCHAR(255)) as stratum_3,
  CAST(stratum_4 as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5
from
  rawData
