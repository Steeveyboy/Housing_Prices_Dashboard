
DROP TABLE IF EXISTS Location_Dimension;
CREATE TABLE Location_Dimension(
    location_key int UNIQUE NOT NULL,
    province TEXT NOT NULL,
    province_fullname TEXT
);


DROP TABLE IF EXISTS Regional_Weather_Summary;
CREATE TABLE Regional_Weather_Summary(
    region_summ_key int UNIQUE NOT NULL,
    location_key int NOT NULL,
    date_key int NOT NULL,
    Region_Max_Temp real NOT NULL,
    Region_Min_Temp real NOT NULL,
    Region_Mean_Temp real NOT NULL,
    Region_Mean_Precip real NOT NULL,
    Mean_Snow_Grnd_Last_Day real NOT NULL,
    Region_Mean_Snow real NOT NULL
);

DROP TABLE IF EXISTS Station_Summary;
CREATE TABLE Station_Summary(
    station_name text NOT NULL,
    date_key int NOT NULL,
    location_key int NOT NULL,
    Max_Temp FLOAT NOT NULL,
    Min_Temp FLOAT NOT NULL,
    Mean_Temp FLOAT NOT NULL,
    Total_Precip FLOAT NOT NULL,
    Snow_Grnd_Last_Day FLOAT NOT NULL,
    total_snowfall FLOAT NOT NULL,
    Date_Added DATE NOT NULL
);

DROP TABLE IF EXISTS Date_Dimension;
CREATE TABLE Date_Dimension(
    date_key int UNIQUE NOT NULL,
    yearmo int not null,
    date date not null,
    month int,
    year int,
    month_alpha TEXT
);

DROP TABLE IF EXISTS Real_Estate_Dimension;

CREATE TABLE Real_Estate_Dimension(
    real_estate_key int UNIQUE NOT NULL,
    total_price_index float not null,
    house_price_index float not null,
    land_price_index float not null,
    date_key int not null,
    location_key int not null
);

DROP TABLE IF EXISTS FactTable;
CREATE TABLE FactTable(
    real_estate_key int NOT NULL,
    date_key int NOT NULL,
    location_key int NOT NULL,
    region_summ_key int NOT NULL,
    Price_Index FLOAT NOT NULL,
    Pct_Change FLOAT,
    Hist_Pct_Change FLOAT
);

