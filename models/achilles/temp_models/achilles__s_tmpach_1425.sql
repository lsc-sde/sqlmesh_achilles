
MODEL (
  name @temp_schema.achilles__s_tmpach_1425,
  kind FULL,
  cron '@daily'
);

-- 1425	Number of payer_plan_period records, by payer_source_concept_id
select
  1425 as analysis_id,
  cast(payer_source_concept_id as varchar(255)) as stratum_1,
  cast(null as varchar(255)) as stratum_2,
  cast(null as varchar(255)) as stratum_3,
  cast(null as varchar(255)) as stratum_4,
  cast(null as varchar(255)) as stratum_5,
  count(*)::FLOAT as count_value
from `@src_database`.`@src_schema_omop`.`payer_plan_period`
group by payer_source_concept_id
