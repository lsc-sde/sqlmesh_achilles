
MODEL (
  name @temp_schema.achilles__s_tmpach_1,
  kind FULL,
  cron '@daily'
);

-- 1	Number of persons
select
  1 as analysis_id,
  cast(null as varchar(255)) as stratum_1,
  cast(null as varchar(255)) as stratum_2,
  cast(null as varchar(255)) as stratum_3,
  cast(null as varchar(255)) as stratum_4,
  cast(null as varchar(255)) as stratum_5,
  count(distinct person_id) as count_value
from `@src_omop_schema`.`person`
