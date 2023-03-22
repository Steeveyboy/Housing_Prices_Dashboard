--@block
drop TABLE if EXISTS Location_Dimension;

CREATE TABLE Location_Dimension(
    id INTEGER UNIQUE NOT NULL,
    Province TEXT NOT NULL
);

--@block
drop table if EXISTS Regional_Weather_Summary;

CREATE TABLE Regional_Weather_Summary(
    id INTEGER UNIQUE NOT NULL,
    Location_ID INTEGER NOT NULL,
    Date_ID INTEGER NOT NULL,
    Region_Max_Temp DOUBLE PRECISION NOT NULL,
    Region_Min_Temp DOUBLE PRECISION NOT NULL,
    Region_Mean_Temp DOUBLE PRECISION NOT NULL,
    Region_Mean_Precip DOUBLE PRECISION NOT NULL,
    Region_Mean_Snow DOUBLE PRECISION NOT NULL
);

--@block
drop table if exists Station_Summary;

CREATE TABLE Station_Summary(
    id INTEGER UNIQUE NOT NULL,
    Date_ID INTEGER NOT NULL,
    Location_ID INTEGER NOT NULL,
    Max_Temp DOUBLE PRECISION NOT NULL,
    Min_Temp DOUBLE PRECISION NOT NULL,
    Mean_Temp DOUBLE PRECISION NOT NULL,
    Total_Precip DOUBLE PRECISION NOT NULL,
    Snow_Grnd_Last_Day DOUBLE PRECISION NOT NULL,
    Date_Added DATE NOT NULL
);

--@block
drop table if exists Date_Dimension;

CREATE TABLE Date_Dimension(
    id INTEGER UNIQUE NOT NULL,
    month INTEGER NOT NULL,
    year INTEGER NOT NULL,
    month_alpha TEXT NOT NULL
);

--@block
drop table if exists Real_Estate_Dimension;

CREATE TABLE Real_Estate_Dimension(
    id INTEGER UNIQUE NOT NULL,
    Housing_Type TEXT NOT NULL
);

--@block
drop table if exists FactTable;

CREATE TABLE FactTable(
    House_ID INTEGER NOT NULL,
    Date_ID INTEGER NOT NULL,
    Location_ID INTEGER NOT NULL,
    Climate_ID INTEGER NOT NULL,
    Price_Index DOUBLE PRECISION NOT NULL,
    Pct_Change DOUBLE PRECISION NOT NULL,
    Hist_Pct_Change DOUBLE PRECISION NOT NULL
);

