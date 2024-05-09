
MODEL (
  name @temp_schema.achilles__s_tmpach_101,
  kind FULL,
  cron '@daily'
);

-- 101	Number of persons by age, with age at first observation period
with rawData as (
  select
    year(op1.index_date) - p1.YEAR_OF_BIRTH as stratum_1,
    count(p1.person_id)::FLOAT as count_value
  from `@src_database`.`@src_schema_omop`.`person` as p1
  inner join
    (select
      person_id,
      min(observation_period_start_date) as index_date
    from `@src_database`.`@src_schema_omop`.`observation_period` group by PERSON_ID) as op1
    on p1.PERSON_ID = op1.PERSON_ID
  group by year(op1.index_date) - p1.YEAR_OF_BIRTH
)

select
  101 as analysis_id,
  count_value,
  cast(stratum_1 as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5
from rawData
