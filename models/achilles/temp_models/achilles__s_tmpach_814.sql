
MODEL (
  name @temp_schema.achilles__s_tmpach_814,
  kind FULL,
  cron '@daily'
);

-- 814	Number of observation records with no value (numeric, string, or concept)
select
  814 as analysis_id,
  cast(null as varchar(255)) as stratum_1,
  cast(null as varchar(255)) as stratum_2,
  cast(null as varchar(255)) as stratum_3,
  cast(null as varchar(255)) as stratum_4,
  cast(null as varchar(255)) as stratum_5,
  count(o1.PERSON_ID)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`observation` as o1
where
  o1.value_as_number is null
  and o1.value_as_string is null
  and o1.value_as_concept_id is null
