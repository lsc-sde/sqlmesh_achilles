
MODEL (
  name @temp_schema.achilles__s_tmpach_209,
  kind FULL,
  cron '@daily'
);

-- 209	Number of visit records with invalid care_site_id
select
  209 as analysis_id,
  cast(null as varchar(255)) as stratum_1,
  cast(null as varchar(255)) as stratum_2,
  cast(null as varchar(255)) as stratum_3,
  cast(null as varchar(255)) as stratum_4,
  cast(null as varchar(255)) as stratum_5,
  count(vo1.PERSON_ID)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`visit_occurrence` as vo1
left join `@src_database`.`@src_schema_omop`.`care_site` as cs1
  on vo1.care_site_id = cs1.care_site_id
where
  vo1.care_site_id is not null
  and cs1.care_site_id is null
