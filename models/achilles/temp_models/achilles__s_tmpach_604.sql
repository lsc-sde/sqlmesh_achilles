
MODEL (
  name @temp_schema.achilles__s_tmpach_604,
  kind FULL,
  cron '@daily'
);

-- 604	Number of persons with at least one procedure occurrence, by procedure_concept_id by calendar year by gender by age decile
with rawData as (
  select
    po.procedure_concept_id as stratum_1,
    p.gender_concept_id as stratum_3,
    YEAR(po.procedure_date) as stratum_2,
    FLOOR((YEAR(po.procedure_date) - p.year_of_birth) / 10) as stratum_4,
    COUNT(distinct p.person_id)::FLOAT as count_value
  from
    `@src_database`.`@src_schema_omop`.`person` as p
  inner join
    `@src_database`.`@src_schema_omop`.`procedure_occurrence` as po
    on
      p.person_id = po.person_id
  inner join
    `@src_database`.`@src_schema_omop`.`observation_period` as op
    on
      po.person_id = op.person_id
      and
      po.procedure_date >= op.observation_period_start_date
      and
      po.procedure_date <= op.observation_period_end_date
  group by
    po.procedure_concept_id,
    YEAR(po.procedure_date),
    p.gender_concept_id,
    FLOOR((YEAR(po.procedure_date) - p.year_of_birth) / 10)
)

select
  604 as analysis_id,
  count_value,
  CAST(stratum_1 as VARCHAR(255)) as stratum_1,
  CAST(stratum_2 as VARCHAR(255)) as stratum_2,
  CAST(stratum_3 as VARCHAR(255)) as stratum_3,
  CAST(stratum_4 as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5
from
  rawData
