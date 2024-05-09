
MODEL (
  name @temp_schema.achilles__s_tmpach_525,
  kind FULL,
  cron '@daily'
);

-- 525	Number of death records, by cause_source_concept_id
select
  525 as analysis_id,
  cast(cause_source_concept_id as varchar(255)) as stratum_1,
  cast(null as varchar(255)) as stratum_2,
  cast(null as varchar(255)) as stratum_3,
  cast(null as varchar(255)) as stratum_4,
  cast(null as varchar(255)) as stratum_5,
  count(*)::FLOAT as count_value
from `@src_database`.`@src_schema_omop`.`death`
group by cause_source_concept_id
