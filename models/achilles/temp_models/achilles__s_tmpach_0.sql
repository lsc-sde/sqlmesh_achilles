
MODEL (
  name @temp_schema.achilles__s_tmpach_0,
  kind FULL,
  cron '@daily'
);

-- 0	cdm name, version of Achilles and date when pre-computations were executed
select
  0 as analysis_id,
  cast('' as VARCHAR(255)) as stratum_1,
  cast('1.7.2' as VARCHAR(255)) as stratum_2,
  cast(getdate() as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(distinct person_id)::FLOAT as count_value
from `@src_database`.`@src_schema_omop`.`person`
