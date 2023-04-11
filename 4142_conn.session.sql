
--@block
SELECT
    lt.province,
    dt.yearmo,
    dt.month_alpha,
    dt.year,
    rt.total_price_index,
    rt.house_price_index,
    rt.land_price_index,
    ct.Region_Mean_Temp,
    ct.Region_Max_Temp,
    ct.Region_Min_Temp,
    ct.Region_Mean_Precip,
    ct.Region_Mean_Snow,
    ct.Mean_Snow_Grnd_Last_Day
from facttable ft
join date_dimension dt on dt.date_key = ft.date_key
join location_dimension lt on lt.location_key = ft.location_key
join regional_weather_summary ct on ct.region_summ_key = ft.region_summ_key
join real_estate_dimension rt on rt.real_estate_key = ft.real_estate_key
;

--@block
SELECT 
    rt.Region_Mean_Temp
from regional_weather_summary as rt
limit 40
;
