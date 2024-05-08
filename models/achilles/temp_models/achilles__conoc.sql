
MODEL (
  name @temp_schema.achilles__conoc,
  kind FULL,
  cron '@daily'
);

-- Analysis 2004: Number of distinct patients that overlap between specific domains
-- Bit String Breakdown:   1) Condition Occurrence 2) Drug Exposure 3) Device Exposure 4) Measurement 5) Death 6) Procedure Occurrence 7) Observation
select distinct person_id from`@src_database`.`@src_schema_omop`.condition_occurrence
