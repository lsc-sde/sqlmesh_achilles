
MODEL (
  name @temp_schema.achilles__temp_dates_116,
  kind FULL,
  cron '@daily'
);

-- 116	Number of persons with at least one day of observation in each year by gender and age decile
-- Note: using temp table instead of nested query because this gives vastly improved performance in Oracle
select distinct YEAR(observation_period_start_date)::INT as obs_year
from
  `@src_database`.`@src_schema_omop`.`observation_period`
