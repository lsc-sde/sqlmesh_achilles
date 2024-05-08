
MODEL (
  name @temp_schema.achilles__s_tmpach_226,
  kind FULL,
  cron '@daily'
);

-- 226	Number of records by domain by visit concept id
select
  226 as analysis_id,
  cast(v.visit_concept_id as VARCHAR(255)) as stratum_1,
  v.cdm_table as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  v.record_count as count_value
from (
  select
    'drug_exposure' as cdm_table,
    coalesce(visit_concept_id, 0) as visit_concept_id,
    count(*) as record_count
  from `@src_database`.`@src_schema_omop`.`drug_exposure` as t
  left join
    `@src_database`.`@src_schema_omop`.`visit_occurrence` as v
    on t.visit_occurrence_id = v.visit_occurrence_id
  group by visit_concept_id
  union
  select
    'condition_occurrence' as cdm_table,
    coalesce(visit_concept_id, 0) as visit_concept_id,
    count(*) as record_count
  from `@src_database`.`@src_schema_omop`.`condition_occurrence` as t
  left join
    `@src_database`.`@src_schema_omop`.`visit_occurrence` as v
    on t.visit_occurrence_id = v.visit_occurrence_id
  group by visit_concept_id
  union
  select
    'device_exposure' as cdm_table,
    coalesce(visit_concept_id, 0) as visit_concept_id,
    count(*) as record_count
  from `@src_database`.`@src_schema_omop`.`device_exposure` as t
  left join
    `@src_database`.`@src_schema_omop`.`visit_occurrence` as v
    on t.visit_occurrence_id = v.visit_occurrence_id
  group by visit_concept_id
  union
  select
    'procedure_occurrence' as cdm_table,
    coalesce(visit_concept_id, 0) as visit_concept_id,
    count(*) as record_count
  from `@src_database`.`@src_schema_omop`.`procedure_occurrence` as t
  left join
    `@src_database`.`@src_schema_omop`.`visit_occurrence` as v
    on t.visit_occurrence_id = v.visit_occurrence_id
  group by visit_concept_id
  union
  select
    'measurement' as cdm_table,
    coalesce(visit_concept_id, 0) as visit_concept_id,
    count(*) as record_count
  from `@src_database`.`@src_schema_omop`.`measurement` as t
  left join
    `@src_database`.`@src_schema_omop`.`visit_occurrence` as v
    on t.visit_occurrence_id = v.visit_occurrence_id
  group by visit_concept_id
  union
  select
    'observation' as cdm_table,
    coalesce(visit_concept_id, 0) as visit_concept_id,
    count(*) as record_count
  from `@src_database`.`@src_schema_omop`.`observation` as t
  left join
    `@src_database`.`@src_schema_omop`.`visit_occurrence` as v
    on t.visit_occurrence_id = v.visit_occurrence_id
  group by visit_concept_id
) as v
