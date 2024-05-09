
MODEL (
  name @temp_schema.achilles__s_tmpach_300,
  kind FULL,
  cron '@daily'
);

-- 300	Number of providers
select
  300 as analysis_id,
  cast(null as varchar(255)) as stratum_1,
  cast(null as varchar(255)) as stratum_2,
  cast(null as varchar(255)) as stratum_3,
  cast(null as varchar(255)) as stratum_4,
  cast(null as varchar(255)) as stratum_5,
  count(distinct provider_id)::FLOAT as count_value
from `@src_database`.`@src_schema_omop`.`provider`
