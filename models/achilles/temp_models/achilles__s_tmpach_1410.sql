
MODEL (
  name @temp_schema.achilles__s_tmpach_1410,
  kind FULL,
  cron '@daily'
);

select
  1410 as analysis_id,
  cast(obs_month as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(distinct p1.PERSON_ID)::FLOAT as count_value
from
  `@src_database`.`@src_schema_omop`.`person` as p1
inner join
  `@src_database`.`@src_schema_omop`.`payer_plan_period` as ppp1
  on p1.person_id = ppp1.person_id
,
  `@temp_schema`.`achilles__temp_dates_1410`
where
  ppp1.payer_plan_period_START_DATE <= obs_month_start
  and ppp1.payer_plan_period_END_DATE >= obs_month_end
group by obs_month
