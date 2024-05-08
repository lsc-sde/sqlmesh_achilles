
MODEL (
  name @temp_schema.achilles__tempObs_105,
  kind FULL,
  cron '@daily'
);

-- 105	Length of observation (days) of first observation period
select
  count_value,
  rn
from
  (
    select
      datediff( op.observation_period_end_date,op.observation_period_start_date
      ) as count_value,
      ROW_NUMBER() over (
        partition by op.person_id order by op.observation_period_start_date asc
      ) as rn
    from `@src_database`.`@src_schema_omop`.`observation_period` as op
  ) as A
where rn = 1
