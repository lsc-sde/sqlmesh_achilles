
MODEL (
  name @temp_schema.achilles__s_tmpach_113,
  kind FULL,
  cron '@daily'
);

-- 113	Number of persons by number of observation periods
select
  113 as analysis_id,
  cast(op1.num_periods as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(distinct op1.PERSON_ID) as count_value
from
  (
    select
      person_id,
      count(OBSERVATION_period_start_date) as num_periods
    from `@src_database`.`@src_schema_omop`.`observation_period` group by PERSON_ID
  ) as op1
group by op1.num_periods
