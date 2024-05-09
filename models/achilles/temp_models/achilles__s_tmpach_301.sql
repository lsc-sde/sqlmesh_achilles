
MODEL (
  name @temp_schema.achilles__s_tmpach_301,
  kind FULL,
  cron '@daily'
);

-- 301	Number of providers by specialty concept_id
select
  301 as analysis_id,
  cast(specialty_concept_id as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(distinct provider_id)::FLOAT as count_value
from `@src_database`.`@src_schema_omop`.`provider`
group by specialty_CONCEPT_ID
