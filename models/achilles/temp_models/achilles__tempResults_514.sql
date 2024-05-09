
MODEL (
  name @temp_schema.achilles__tempResults_514,
  kind FULL,
  cron '@daily'
);

-- 514	Distribution of time from death to last procedure
WITH rawData (count_value) AS (
  SELECT datediff( po.max_date,d.death_date)::FLOAT as count_value
  FROM
    `@src_database`.`@src_schema_omop`.`death` AS d
    JOIN (
    SELECT
      po.person_id,
      MAX(po.procedure_date) AS max_date
    FROM
      `@src_database`.`@src_schema_omop`.`procedure_occurrence` AS po
    INNER JOIN
      `@src_database`.`@src_schema_omop`.`observation_period` AS op
      ON
        po.person_id = op.person_id
        AND
        po.procedure_date >= op.observation_period_start_date
        AND
        po.procedure_date <= op.observation_period_end_date
    GROUP BY
      po.person_id
  ) AS po
    ON
      d.person_id = po.person_id
),
overallStats (avg_value, stdev_value, min_value, max_value, total) AS (
  SELECT
    AVG(1.0 * count_value)::FLOAT as avg_value,
    stddev(count_value)::FLOAT as stdev_value,
    MIN(count_value)::FLOAT as min_value,
    MAX(count_value)::FLOAT as max_value,
    count(*) AS total
  FROM rawData
),
statsView (count_value, total, rn) AS (
  SELECT
    count_value,
    count(*) AS total,
    ROW_NUMBER() OVER (ORDER BY count_value) AS rn
  FROM rawData
  GROUP BY count_value
),
priorStats (count_value, total, accumulated) AS (
  SELECT
    s.count_value,
    s.total,
    SUM(p.total) AS accumulated
  FROM statsView AS s
  INNER JOIN statsView AS p ON p.rn <= s.rn
  GROUP BY s.count_value, s.total, s.rn
)
SELECT
  514 AS analysis_id,
  o.total::FLOAT as count_value,
  o.min_value,
  o.max_value,
  o.avg_value,
  o.stdev_value,
  MIN(
    CASE
      WHEN p.accumulated >= .50 * o.total THEN count_value ELSE o.max_value
    END
  )::FLOAT as median_value,
  MIN(
    CASE
      WHEN p.accumulated >= .10 * o.total THEN count_value ELSE o.max_value
    END
  )::FLOAT as p10_value,
  MIN(
    CASE
      WHEN p.accumulated >= .25 * o.total THEN count_value ELSE o.max_value
    END
  )::FLOAT as p25_value,
  MIN(
    CASE
      WHEN p.accumulated >= .75 * o.total THEN count_value ELSE o.max_value
    END
  )::FLOAT as p75_value,
  MIN(
    CASE
      WHEN p.accumulated >= .90 * o.total THEN count_value ELSE o.max_value
    END
  )::FLOAT as p90_value
FROM priorStats AS p
CROSS JOIN overallStats AS o
GROUP BY o.total, o.min_value, o.max_value, o.avg_value, o.stdev_value
