import requests, json, datetime
import pandas as pd

# For bulkload
# periodStart = 20120101
# periodEnd = 20230201

# For current month
periodStart = datetime.datetime.now().strftime("%Y%m01")
periodEnd = datetime.datetime.now().strftime("%Y%m01")


link = f"https://www150.statcan.gc.ca/t1/tbl1/jta!ajaxApply?pid=1810020501&selectedNodeIds=1D3,1D5,1D7,1D9,1D11,1D17,1D29,1D31,1D34,1D37&checkedLevels=0D1,1D1,1D2&jsTreeLocale=en&refPeriods={periodStart},{periodEnd}&dimensionLayouts=layout3,layout2,layout3&vectorDisplay=false"

def main():
    res = requests.post(link)
    data = json.loads(res.json()['jsonTable'])
    
    ls = []
    for row in data["rows"]:
        ls.append({
            "location": row['values'][0]['value'], 
            "date": row['values'][1]['value'],
            "total": row['values'][2]['value'],
            "house": row['values'][3]['value'],
            "land": row['values'][4]['value']
        })
        
    df = pd.DataFrame.from_records(ls, columns = ['location', 'date', 'total', 'house', 'land'])

    filename = f'monthly_housing_data_{datetime.datetime.now().strftime("%d-%h-%y_%I-%M%p")}.csv'
    df.to_csv(filename, index=False)

if __name__ == "__main__":
    main()
    