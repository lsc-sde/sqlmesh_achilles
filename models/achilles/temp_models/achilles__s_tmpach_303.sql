
MODEL (
  name @temp_schema.achilles__s_tmpach_303,
  kind FULL,
  cron '@daily'
);

-- 303	Number of provider records, by specialty_concept_id, visit_concept_id
select
  303 as analysis_id,
  cast(p.specialty_concept_id as varchar(255)) as stratum_1,
  cast(vo.visit_concept_id as varchar(255)) as stratum_2,
  cast(null as varchar(255)) as stratum_3,
  cast(null as varchar(255)) as stratum_4,
  cast(null as varchar(255)) as stratum_5,
  count(*) as count_value
from `@src_database`.`@src_schema_omop`.`provider` as p
inner join `@src_database`.`@src_schema_omop`.`visit_occurrence` as vo
  on vo.provider_id = p.provider_id
group by p.specialty_concept_id, visit_concept_id
