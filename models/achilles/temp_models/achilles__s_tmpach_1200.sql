
MODEL (
  name @temp_schema.achilles__s_tmpach_1200,
  kind FULL,
  cron '@daily'
);

-- 1200	Number of persons by place of service
select
  1200 as analysis_id,
  cast(cs1.place_of_service_concept_id as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(person_id)::FLOAT as count_value
from `@src_database`.`@src_schema_omop`.`person` as p1
inner join `@src_database`.`@src_schema_omop`.`care_site` as cs1
  on p1.care_site_id = cs1.care_site_id
where
  p1.care_site_id is not null
  and cs1.place_of_service_concept_id is not null
group by cs1.place_of_service_concept_id
