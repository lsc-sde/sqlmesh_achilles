
MODEL (
  name @temp_schema.achilles__s_tmpach_1202,
  kind FULL,
  cron '@daily'
);

-- 1202	Number of care sites by place of service
select
  1202 as analysis_id,
  cast(cs1.place_of_service_concept_id as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(cs1.care_site_id)::FLOAT as count_value
from `@src_database`.`@src_schema_omop`.`care_site` as cs1
where cs1.place_of_service_concept_id is not null
group by cs1.place_of_service_concept_id
