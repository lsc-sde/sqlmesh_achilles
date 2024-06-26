
MODEL (
  name @temp_schema.achilles__s_tmpach_dist_0,
  kind FULL,
  cron '@daily'
);

select
  0 as analysis_id,
  cast('' as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  null::FLOAT as min_value,
  null::FLOAT as max_value,
  null::FLOAT as avg_value,
  null::FLOAT as stdev_value,
  null::FLOAT as median_value,
  null::FLOAT as p10_value,
  null::FLOAT as p25_value,
  null::FLOAT as p75_value,
  null::FLOAT as p90_value,
  count(distinct person_id)::FLOAT as count_value
from `@src_database`.`@src_schema_omop`.`person`
