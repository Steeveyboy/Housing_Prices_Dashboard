
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
    region_max_temp real NOT NULL,
    region_min_temp real NOT NULL,
    region_mean_temp real NOT NULL,
    region_mean_precip real NOT NULL,
    mean_snow_grnd_last_day real NOT NULL,
    region_mean_snow real NOT NULL
);

DROP TABLE IF EXISTS Station_Summary;
CREATE TABLE Station_Summary(
    station_name text NOT NULL,
    date_key int NOT NULL,
    location_key int NOT NULL,
    max_temp FLOAT NOT NULL,
    min_temp FLOAT NOT NULL,
    mean_temp FLOAT NOT NULL,
    total_precip FLOAT NOT NULL,
    snow_grnd_last_day FLOAT NOT NULL,
    total_snowfall FLOAT NOT NULL,
    date_added DATE NOT NULL
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
    location_key int not null,
    pct_change float
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

