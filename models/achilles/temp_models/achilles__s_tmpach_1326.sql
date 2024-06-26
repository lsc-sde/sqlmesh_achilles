
MODEL (
  name @temp_schema.achilles__s_tmpach_1326,
  kind FULL,
  cron '@daily'
);

-- 1326	Number of records by domain by visit detail concept id
select
  1326 as analysis_id,
  v.cdm_table as stratum_2,
  v.record_count::FLOAT as count_value,
  CAST(v.visit_detail_concept_id as VARCHAR(255)) as stratum_1,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5
from (
  select
    'drug_exposure' as cdm_table,
    COALESCE(vd.visit_detail_concept_id, 0) as visit_detail_concept_id,
    COUNT(*) as record_count
  from
    `@src_database`.`@src_schema_omop`.`drug_exposure` as de
  left join
    `@src_database`.`@src_schema_omop`.`visit_detail` as vd
    on
      de.visit_occurrence_id = vd.visit_occurrence_id
  group by
    vd.visit_detail_concept_id
  union
  select
    'condition_occurrence' as cdm_table,
    COALESCE(vd.visit_detail_concept_id, 0) as visit_detail_concept_id,
    COUNT(*) as record_count
  from
    `@src_database`.`@src_schema_omop`.`condition_occurrence` as co
  left join
    `@src_database`.`@src_schema_omop`.`visit_detail` as vd
    on
      co.visit_occurrence_id = vd.visit_occurrence_id
  group by
    vd.visit_detail_concept_id
  union
  select
    'device_exposure' as cdm_table,
    COALESCE(visit_detail_concept_id, 0) as visit_detail_concept_id,
    COUNT(*) as record_count
  from
    `@src_database`.`@src_schema_omop`.`device_exposure` as de
  left join
    `@src_database`.`@src_schema_omop`.`visit_detail` as vd
    on
      de.visit_occurrence_id = vd.visit_occurrence_id
  group by
    vd.visit_detail_concept_id
  union
  select
    'procedure_occurrence' as cdm_table,
    COALESCE(vd.visit_detail_concept_id, 0) as visit_detail_concept_id,
    COUNT(*) as record_count
  from
    `@src_database`.`@src_schema_omop`.`procedure_occurrence` as po
  left join
    `@src_database`.`@src_schema_omop`.`visit_detail` as vd
    on
      po.visit_occurrence_id = vd.visit_occurrence_id
  group by
    vd.visit_detail_concept_id
  union
  select
    'measurement' as cdm_table,
    COALESCE(vd.visit_detail_concept_id, 0) as visit_detail_concept_id,
    COUNT(*) as record_count
  from
    `@src_database`.`@src_schema_omop`.`measurement` as m
  left join
    `@src_database`.`@src_schema_omop`.`visit_detail` as vd
    on
      m.visit_occurrence_id = vd.visit_occurrence_id
  group by
    vd.visit_detail_concept_id
  union
  select
    'observation' as cdm_table,
    COALESCE(vd.visit_detail_concept_id, 0) as visit_detail_concept_id,
    COUNT(*) as record_count
  from
    `@src_database`.`@src_schema_omop`.`observation` as o
  left join
    `@src_database`.`@src_schema_omop`.`visit_detail` as vd
    on
      o.visit_occurrence_id = vd.visit_occurrence_id
  group by
    vd.visit_detail_concept_id
) as v
