
MODEL (
  name @temp_schema.achilles__s_tmpach_1409,
  kind FULL,
  cron '@daily'
);

select
  1409 as analysis_id,
  cast(t1.obs_year as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(distinct p1.PERSON_ID) as count_value
from
  `@src_database`.`@src_schema_omop`.`person` as p1
inner join
  `@src_database`.`@src_schema_omop`.`payer_plan_period` as ppp1
  on p1.person_id = ppp1.person_id
,
  `@temp_schema`.`achilles__temp_dates_1409` as t1
where
  year(ppp1.payer_plan_period_START_DATE) <= t1.obs_year
  and year(ppp1.payer_plan_period_END_DATE) >= t1.obs_year
group by t1.obs_year
