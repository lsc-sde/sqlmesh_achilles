
MODEL (
  name @temp_schema.achilles__temp_dates_1409,
  kind FULL,
  cron '@daily'
);

-- 1409	Number of persons with continuous payer plan in each year
-- Note: using temp table instead of nested query because this gives vastly improved
select distinct YEAR(payer_plan_period_start_date)::INT as obs_year
from
  `@src_database`.`@src_schema_omop`.`payer_plan_period`
