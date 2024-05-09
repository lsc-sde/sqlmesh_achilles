
MODEL (
  name @temp_schema.achilles__s_tmpach_2200,
  kind FULL,
  cron '@daily'
);

-- 2200	Number of persons with at least one note , by note_type_concept_id
select
  2200 as analysis_id,
  cast(m.note_type_CONCEPT_ID as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(distinct m.PERSON_ID)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`note` as m
group by m.note_type_CONCEPT_ID
