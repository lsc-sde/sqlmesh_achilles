
MODEL (
  name @temp_schema.achilles__overallStats_815,
  kind FULL,
  cron '@daily'
);

select
  o.subject_id as stratum1_id,
  o.unit_concept_id as stratum2_id,
  AVG(1.0 * o.count_value)::FLOAT as avg_value,
  STDDEV(o.count_value)::FLOAT as stdev_value,
  MIN(o.count_value)::FLOAT as min_value,
  MAX(o.count_value)::FLOAT as max_value,
  COUNT(*) as total
from (
  select
    o.observation_concept_id as subject_id,
    o.unit_concept_id,
    o.value_as_number::FLOAT as count_value
  from
    `@src_database`.`@src_schema_omop`.`observation` as o
  inner join
    `@src_database`.`@src_schema_omop`.`observation_period` as op
    on
      o.person_id = op.person_id
      and
      o.observation_date >= op.observation_period_start_date
      and
      o.observation_date <= op.observation_period_end_date
  where
    o.unit_concept_id is not NULL
    and
    o.value_as_number is not NULL
) as o
group by
  o.subject_id,
  o.unit_concept_id
