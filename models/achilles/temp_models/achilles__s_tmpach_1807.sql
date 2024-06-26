
MODEL (
  name @temp_schema.achilles__s_tmpach_1807,
  kind FULL,
  cron '@daily'
);

-- 1807	Number of measurement occurrence records, by measurement_concept_id and unit_concept_id
select
  1807 as analysis_id,
  CAST(m.measurement_concept_id as VARCHAR(255)) as stratum_1,
  CAST(m.unit_concept_id as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(m.person_id)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`measurement` as m
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
  m.unit_concept_id
