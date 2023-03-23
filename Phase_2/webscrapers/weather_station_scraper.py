import requests
import json, sys, os
import pandas as pd
from datetime import datetime, date
from io import StringIO
from dateutil.rrule import rrule, MONTHLY\
    

def transform_data(res, year, mo):
    d = StringIO(res.text)
    data = pd.read_csv(filepath_or_buffer=d)
    data['yearmo'] = int(f"{year}{mo}")
    return data

def bulk_extract(startDate=datetime.now().date(), endDate=datetime.now().date()):
    for dt in rrule(MONTHLY, dtstart=startDate, until=endDate):
        refDateYr, refDateMo = dt.strftime("%Y-%m").split("-")
            
        link = f"https://climate.weather.gc.ca/prods_servs/cdn_climate_summary_report_e.html?intYear={refDateYr}&intMonth={int(refDateMo)}&prov=&dataFormat=csv&btnSubmit=Download+data"
        res = requests.get(link)
        
        df = transform_data(res, refDateYr, refDateMo)
        load_data(df)
    return True

def extract(year, month):
        
    link = f"https://climate.weather.gc.ca/prods_servs/cdn_climate_summary_report_e.html?intYear={year}&intMonth={int(month)}&prov=&dataFormat=csv&btnSubmit=Download+data"
    res = requests.get(link)

    df = transform_data(res, year, month)
    load_data(df)
    

def load_data(df, filename="weather_stations.csv"):
    if not os.path.exists(filename):
        df.to_csv(filename, mode='w', index=False, header=True)
            
    else:
        df.to_csv(filename, mode='a', index=False, header=False)



