
--@block
select
    avg(ct.region_mean_precip)
from regional_weather_summary ct
join location_dimension lt on lt.location_key = ct.location_key
group by ct.location_key
ORDER BY avg(ct.region_mean_precip) desc
;

--@block
select
    lt.province, 
    dt.yearmo,
    ct.region_mean_temp,
    ct.region_max_temp,
    ct.region_min_temp
from facttable ft
join location_dimension lt on lt.location_key = ft.location_key
join date_dimension dt on dt.date_key = ft.date_key
join regional_weather_summary ct on ct.region_summ_key = ft.region_summ_key
where lt.province = 'BC'
and dt.year >= 2018
;

