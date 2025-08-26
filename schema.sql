/*
First creating the database:

    sqlite3 Pak_Eco.db

this will create a database called Pak_Eco(if that does not already exit,
also this is just the name that i gave you can name it anything you like)

*/

-- CREATING TABLES

--main table core_economy
CREATE TABLE "core_economy"
(
    "year" INTEGER,
    "gdp" REAL,
    "growth" REAL,

    PRIMARY KEY("year")
);

--all other tables which have one-one relationship with core_economy
--ie: they use foreign column year to ref the primary key year of core_economy
CREATE TABLE "demographics"
(
    "year" INTEGER,
    "population" REAL,
    "population growth" REAL,
    "net migration" REAL,

    FOREIGN KEY("year") REFERENCES core_economy("year")
);

CREATE TABLE "financial_flows"
(
    "year" INTEGER,
    "total investments" REAL,
    "remittance" REAL,

    FOREIGN KEY("year") REFERENCES core_economy("year")
);

CREATE TABLE "socio_economic_metrics"
(
    "year" INTEGER,
    "per capita" REAL,
    "inflation rate" REAL,
    "unemployed rate" REAL,
    "internet users" REAL,

    FOREIGN KEY("year") REFERENCES core_economy("year")
);

--TABLE CREATION COMPLETED
------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATING INDEXES


-- INDEX CREATION COMPLETED
------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATING VIEWS




-- VIEWS CREATION COMPLETED
------------------------------------------------------------------------------------------------------------------------------------------------------------------
