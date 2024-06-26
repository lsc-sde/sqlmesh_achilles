
MODEL (
  name @temp_schema.achilles__tempResults_1306,
  kind FULL,
  cron '@daily'
);

-- 1306	Distribution of age by visit_detail_concept_id
with rawData (stratum1_id, stratum2_id, count_value) as (
  select
    vd.visit_detail_concept_id as stratum1_id,
    p.gender_concept_id as stratum2_id,
    vd.visit_detail_start_year - p.year_of_birth::FLOAT as count_value
  from
    `@src_database`.`@src_schema_omop`.`person` as p
  inner join (
    select
      vd.person_id,
      vd.visit_detail_concept_id,
      MIN(YEAR(vd.visit_detail_start_date)) as visit_detail_start_year
    from
      `@src_database`.`@src_schema_omop`.`visit_detail` as vd
    inner join
      `@src_database`.`@src_schema_omop`.`observation_period` as op
      on
        vd.person_id = op.person_id
        and
        vd.visit_detail_start_date >= op.observation_period_start_date
        and
        vd.visit_detail_start_date <= op.observation_period_end_date
    group by
      vd.person_id,
      vd.visit_detail_concept_id
  ) as vd
    on
      p.person_id = vd.person_id
),

overallStats (
  stratum1_id, stratum2_id, avg_value, stdev_value, min_value, max_value, total
) as (
  select
    stratum1_id,
    stratum2_id,
    AVG(1.0 * count_value)::FLOAT as avg_value,
    STDDEV(count_value)::FLOAT as stdev_value,
    MIN(count_value)::FLOAT as min_value,
    MAX(count_value)::FLOAT as max_value,
    COUNT(*) as total
  from
    rawData
  group by
    stratum1_id,
    stratum2_id
),

statsView (stratum1_id, stratum2_id, count_value, total, rn) as (
  select
    stratum1_id,
    stratum2_id,
    count_value,
    COUNT(*) as total,
    ROW_NUMBER() over (
      partition by stratum1_id, stratum2_id order by count_value
    ) as rn
  from
    rawData
  group by
    stratum1_id,
    stratum2_id,
    count_value
),

priorStats (stratum1_id, stratum2_id, count_value, total, accumulated) as (
  select
    s.stratum1_id,
    s.stratum2_id,
    s.count_value,
    s.total,
    SUM(p.total) as accumulated
  from
    statsView as s
  inner join
    statsView as p
    on
      s.stratum1_id = p.stratum1_id
      and s.stratum2_id = p.stratum2_id
      and s.rn >= p.rn
  group by
    s.stratum1_id,
    s.stratum2_id,
    s.count_value,
    s.total,
    s.rn
)

select
  1306 as analysis_id,
  o.total::FLOAT as count_value,
  o.min_value,
  o.max_value,
  o.avg_value,
  o.stdev_value,
  CAST(o.stratum1_id as VARCHAR(255)) as stratum1_id,
  CAST(o.stratum2_id as VARCHAR(255)) as stratum2_id,
  MIN(
    case
      when p.accumulated >= .50 * o.total then count_value else o.max_value
    end
  )::FLOAT as median_value,
  MIN(
    case
      when p.accumulated >= .10 * o.total then count_value else o.max_value
    end
  )::FLOAT as p10_value,
  MIN(
    case
      when p.accumulated >= .25 * o.total then count_value else o.max_value
    end
  )::FLOAT as p25_value,
  MIN(
    case
      when p.accumulated >= .75 * o.total then count_value else o.max_value
    end
  )::FLOAT as p75_value,
  MIN(
    case
      when p.accumulated >= .90 * o.total then count_value else o.max_value
    end
  )::FLOAT as p90_value
from
  priorStats as p
inner join
  overallStats as o
  on p.stratum1_id = o.stratum1_id and p.stratum2_id = o.stratum2_id
group by
  o.stratum1_id,
  o.stratum2_id,
  o.total,
  o.min_value,
  o.max_value,
  o.avg_value,
  o.stdev_value
