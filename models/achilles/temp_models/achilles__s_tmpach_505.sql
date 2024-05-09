
MODEL (
  name @temp_schema.achilles__s_tmpach_505,
  kind FULL,
  cron '@daily'
);

-- 505	Number of death records, by death_type_concept_id
select
  505 as analysis_id,
  CAST(d.death_type_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(d.person_id)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`death` as d
inner join
  `@src_database`.`@src_schema_omop`.`observation_period` as op
  on
    d.person_id = op.person_id
    and
    d.death_date >= op.observation_period_start_date
    and
    d.death_date <= op.observation_period_end_date
group by
  d.death_type_concept_id
