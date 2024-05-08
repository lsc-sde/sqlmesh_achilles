
MODEL (
  name @temp_schema.achilles__rawData_106,
  kind FULL,
  cron '@daily'
);

-- 106	Length of observation (days) of first observation period by gender
select
  p.gender_concept_id,
  op.count_value
from
  (
    select
      person_id,
      datediff( op.observation_period_end_date,op.observation_period_start_date
      ) as count_value,
      ROW_NUMBER() over (
        partition by op.person_id order by op.observation_period_start_date asc
      ) as rn
    from `@src_database`.`@src_schema_omop`.`observation_period` as op
  ) as op
inner join `@src_database`.`@src_schema_omop`.`person` as p on op.person_id = p.person_id
where op.rn = 1
