
MODEL (
  name @temp_schema.achilles__s_tmpach_1201,
  kind FULL,
  cron '@daily'
);

-- 1201	Number of visits by place of service
select
  1201 as analysis_id,
  cast(cs1.place_of_service_concept_id as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(visit_occurrence_id) as count_value
from `@src_database`.`@src_schema_omop`.`visit_occurrence` as vo1
inner join `@src_database`.`@src_schema_omop`.`care_site` as cs1
  on vo1.care_site_id = cs1.care_site_id
where
  vo1.care_site_id is not null
  and cs1.place_of_service_concept_id is not null
group by cs1.place_of_service_concept_id
