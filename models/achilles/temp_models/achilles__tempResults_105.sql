
MODEL (
  name @temp_schema.achilles__tempResults_105,
  kind FULL,
  cron '@daily'
);

with overallStats (avg_value, stdev_value, min_value, max_value, total) as (
  select
    avg(1.0 * count_value)::FLOAT as avg_value,
    stddev(count_value)::FLOAT as stdev_value,
    min(count_value)::FLOAT as min_value,
    max(count_value)::FLOAT as max_value,
    count(*) as total
  from `@temp_schema`.`achilles__tempObs_105`
),

priorStats (count_value, total, accumulated) as (
  select
    s.count_value,
    s.total,
    sum(p.total) as accumulated
  from `@temp_schema`.`achilles__statsView_105` as s
  inner join `@temp_schema`.`achilles__statsView_105` as p on s.rn >= p.rn
  group by s.count_value, s.total, s.rn
)

select
  105 as analysis_id,
  o.total::FLOAT as count_value,
  o.min_value,
  o.max_value,
  o.avg_value,
  o.stdev_value,
  min(case when p.accumulated >= .50 * o.total then count_value end)
 ::FLOAT as median_value,
  min(case when p.accumulated >= .10 * o.total then count_value end)
 ::FLOAT as p10_value,
  min(case when p.accumulated >= .25 * o.total then count_value end)
 ::FLOAT as p25_value,
  min(case when p.accumulated >= .75 * o.total then count_value end)
 ::FLOAT as p75_value,
  min(case when p.accumulated >= .90 * o.total then count_value end)
 ::FLOAT as p90_value
from priorStats as p
cross join overallStats as o
group by o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
