
MODEL (
  name @temp_schema.achilles__s_tmpach_605,
  kind FULL,
  cron '@daily'
);

-- 605	Number of procedure occurrence records, by procedure_concept_id by procedure_type_concept_id
select
  605 as analysis_id,
  CAST(po.procedure_CONCEPT_ID as VARCHAR(255)) as stratum_1,
  CAST(po.procedure_type_concept_id as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(po.person_id)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`procedure_occurrence` as po
inner join
  `@src_database`.`@src_schema_omop`.`observation_period` as op
  on
    po.person_id = op.person_id
    and
    po.procedure_date >= op.observation_period_start_date
    and
    po.procedure_date <= op.observation_period_end_date
group by
  po.procedure_CONCEPT_ID,
  po.procedure_type_concept_id
