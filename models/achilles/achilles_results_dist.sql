
MODEL (
  name sqlmesh_achilles.achilles_results_dist,
  kind FULL,
  cron '@daily'
);


select
  analysis_id,
  stratum_1,
  stratum_2,
  stratum_3,
  stratum_4,
  stratum_5,
  count_value,
  min_value,
  max_value,
  avg_value,
  stdev_value,
  median_value,
  p10_value,
  p25_value,
  p75_value,
  p90_value

from
  (
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_0`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_103`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_104`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_105`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_106`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_107`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_203`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_206`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_213`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_403`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_406`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_506`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_511`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_512`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_513`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_514`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_515`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_603`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_606`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_703`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_706`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_715`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_716`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_717`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_803`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_806`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_815`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_903`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_906`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_907`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_1003`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_1006`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_1007`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_1303`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_1306`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_1313`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_1406`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_1407`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_1803`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_1806`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_1815`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_1816`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_1817`
    union all
    select
      cast(analysis_id as int) as analysis_id,
      cast(stratum_1 as varchar(255)) as stratum_1,
      cast(stratum_2 as varchar(255)) as stratum_2,
      cast(stratum_3 as varchar(255)) as stratum_3,
      cast(stratum_4 as varchar(255)) as stratum_4,
      cast(stratum_5 as varchar(255)) as stratum_5,
      count_value::FLOAT as count_value,
      min_value::FLOAT as min_value,
      max_value::FLOAT as max_value,
      avg_value::FLOAT as avg_value,
      stdev_value::FLOAT as stdev_value,
      median_value::FLOAT as median_value,
      p10_value::FLOAT as p10_value,
      p25_value::FLOAT as p25_value,
      p75_value::FLOAT as p75_value,
      p90_value::FLOAT as p90_value
    from
      `@temp_schema`.`achilles__s_tmpach_dist_2106`
  ) as q

where count_value > 5
