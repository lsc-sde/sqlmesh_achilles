
MODEL (
  name @temp_schema.achilles__s_tmpach_11,
  kind FULL,
  cron '@daily'
);

-- 11	Number of non-deceased persons by year of birth and by gender
select
  11 as analysis_id,
  cast(P.year_of_birth as VARCHAR(255)) as stratum_1,
  cast(P.gender_concept_id as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(distinct P.person_id)::FLOAT as count_value
from `@src_database`.`@src_schema_omop`.`person` as P
where
  not exists
  (
    select 1
    from `@src_database`.`@src_schema_omop`.`death` as D
    where P.person_id = D.person_id
  )
group by P.YEAR_OF_BIRTH, P.gender_concept_id
