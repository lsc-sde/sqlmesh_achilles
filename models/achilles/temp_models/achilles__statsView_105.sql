
MODEL (
  name @temp_schema.achilles__statsView_105,
  kind FULL,
  cron '@daily'
);

select
  count_value,
  count(*) as total,
  row_number() over (order by count_value) as rn
from `@temp_schema`.`achilles__tempObs_105`
group by count_value
