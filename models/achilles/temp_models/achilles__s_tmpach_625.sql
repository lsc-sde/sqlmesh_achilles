
MODEL (
  name @temp_schema.achilles__s_tmpach_625,
  kind FULL,
  cron '@daily'
);

-- 625	Number of procedure_occurrence records, by procedure_source_concept_id
select
  625 as analysis_id,
  CAST(po.procedure_source_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(*)::FLOAT as count_value
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
  po.procedure_source_concept_id
