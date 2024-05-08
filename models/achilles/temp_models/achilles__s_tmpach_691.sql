
MODEL (
  name @temp_schema.achilles__s_tmpach_691,
  kind FULL,
  cron '@daily'
);

-- 691	Number of persons that have at least x procedures
select
  691 as analysis_id,
  CAST(po.procedure_concept_id as VARCHAR(255)) as stratum_1,
  CAST(po.prc_cnt as VARCHAR(255)) as stratum_2,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5,
  SUM(COUNT(po.person_id))
    over (partition by po.procedure_concept_id order by po.prc_cnt desc)
  as count_value
from (
  select
    po.procedure_concept_id,
    po.person_id,
    COUNT(po.procedure_occurrence_id) as prc_cnt
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
    po.person_id,
    po.procedure_concept_id
) as po
group by
  po.procedure_concept_id,
  po.prc_cnt
