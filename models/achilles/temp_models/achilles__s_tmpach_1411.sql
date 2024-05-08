
MODEL (
  name @temp_schema.achilles__s_tmpach_1411,
  kind FULL,
  cron '@daily'
);

-- 1411	Number of persons by payer plan period start month
--HINT DISTRIBUTE_ON_KEY(stratum_1)
select
  1411 as analysis_id,
  cast(null as varchar(255)) as stratum_2,
  cast(null as varchar(255)) as stratum_3,
  cast(null as varchar(255)) as stratum_4,
  cast(null as varchar(255)) as stratum_5,
  make_date(
    year(payer_plan_period_start_date), month(payer_plan_period_start_date), 1
  ) as stratum_1,
  count(distinct p1.PERSON_ID) as count_value
from
  `@src_omop_schema`.`person` as p1
inner join `@src_omop_schema`.`payer_plan_period` as ppp1
  on p1.person_id = ppp1.person_id
group by
  make_date(
    year(payer_plan_period_start_date), month(payer_plan_period_start_date), 1
  )
