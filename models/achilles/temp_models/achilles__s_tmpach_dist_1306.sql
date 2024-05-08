
MODEL (
  name @temp_schema.achilles__s_tmpach_dist_1306,
  kind FULL,
  cron '@daily'
);

select
  analysis_id,
  stratum1_id as stratum_1,
  stratum2_id as stratum_2,
  count_value,
  min_value,
  max_value,
  avg_value,
  stdev_value,
  median_value,
  p10_value,
  p25_value,
  p75_value,
  p90_value,
  CAST(NULL as VARCHAR(255)) as stratum_3,
  CAST(NULL as VARCHAR(255)) as stratum_4,
  CAST(NULL as VARCHAR(255)) as stratum_5
from
  `@temp_schema`.`achilles__tempResults_1306`
