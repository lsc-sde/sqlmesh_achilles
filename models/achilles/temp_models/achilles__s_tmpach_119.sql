
MODEL (
  name @temp_schema.achilles__s_tmpach_119,
  kind FULL,
  cron '@daily'
);

-- 119  Number of observation period records by period_type_concept_id
select
  119 as analysis_id,
  cast(op1.period_type_concept_id as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(*)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`observation_period` as op1
group by op1.period_type_concept_id
