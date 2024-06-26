
MODEL (
  name @temp_schema.achilles__s_tmpach_201,
  kind FULL,
  cron '@daily'
);

-- 201	Number of visit occurrence records, by visit_concept_id
-- restricted to visits overlapping with observation period
select
  201 as analysis_id,
  CAST(vo.visit_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  COUNT(vo.person_id)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`visit_occurrence` as vo
inner join
  `@src_database`.`@src_schema_omop`.`observation_period` as op
  on
    vo.person_id = op.person_id
    and
    vo.visit_start_date >= op.observation_period_start_date
    and
    vo.visit_start_date <= op.observation_period_end_date
group by
  vo.visit_concept_id
