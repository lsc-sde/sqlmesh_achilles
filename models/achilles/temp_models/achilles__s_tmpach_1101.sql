
MODEL (
  name @temp_schema.achilles__s_tmpach_1101,
  kind FULL,
  cron '@daily'
);

-- 1101	Number of persons by location state
--HINT DISTRIBUTE_ON_KEY(stratum_1)
select
  1101 as analysis_id,
  cast(l1.state as VARCHAR(255)) as stratum_1,
  cast(null as VARCHAR(255)) as stratum_2,
  cast(null as VARCHAR(255)) as stratum_3,
  cast(null as VARCHAR(255)) as stratum_4,
  cast(null as VARCHAR(255)) as stratum_5,
  count(distinct person_id) as count_value
from `@src_omop_schema`.`person` as p1
inner join `@src_omop_schema`.`location` as l1
  on p1.location_id = l1.location_id
where
  p1.location_id is not null
  and l1.state is not null
group by l1.state
