
MODEL (
  name @temp_schema.achilles__s_tmpach_1891,
  kind FULL,
  cron '@daily'
);

-- 1891	Number of total persons that have at least x measurements
select
  1891 as analysis_id,
  CAST(m.measurement_concept_id as VARCHAR(255)) as stratum_1,
  CAST(m.meas_cnt as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  SUM(COUNT(m.person_id))
    over (partition by m.measurement_concept_id order by m.meas_cnt desc)
 ::FLOAT as count_value
from (
  select
    m.measurement_concept_id,
    m.person_id,
    COUNT(m.measurement_id) as meas_cnt
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
    m.person_id,
    m.measurement_concept_id
) as m
group by
  m.measurement_concept_id,
  m.meas_cnt
