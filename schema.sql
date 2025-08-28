/*
First creating the database:

    sqlite3 Pak_Eco.db

this will create a database called Pak_Eco(if that does not already exit,
also this is just the name that i gave you can name it anything you like)

*/

------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
    "population" INTEGER,
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

--creating simple indexes as data is not that complicated and also because all tables have one to one relation

CREATE INDEX "demographics_year_index" ON "demographics" ("year");
CREATE INDEX "financial_flows_year_index" ON "financial_flows" ("year");
CREATE INDEX "socio_economic_metrics_year_index" ON "socio_economic_metrics" ("year");

-- INDEX CREATION COMPLETED
------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CREATING VIEWS

CREATE VIEW "pakistan_metrics" AS
SELECT "ce"."year" AS "YEAR",
    PRINTF("%,.0f", "ce"."gdp" * 1000000000.0) AS "GDP",
    "ce"."growth" AS "GDP GROWTH",
    PRINTF("%,d", "dg"."population") AS "POPULATION",
    ROUND("dg"."population growth", 2) AS "POPULATION GROWTH",
    "dg"."net migration" AS "NET MIGRATION",
    PRINTF("%,.0f", "ff"."total investments" * 1000000000.0) AS "TOTAL INVESTMENTS",
    PRINTF("%,.0f", "ff"."remittance" * 1000000000.0) AS "REMITTANCE",
    "sem"."per capita" AS "PER CAPITA",
    ROUND("sem"."inflation rate", 2) AS "INFLATION RATE",
    "sem"."unemployed rate" AS "UNEMPLOYMENT RATE",
    "sem"."internet users" AS "INTERNET USERS"
FROM "core_economy" AS "ce"
INNER JOIN "demographics" AS "dg" ON "dg"."year" = "ce"."year"
INNER JOIN "financial_flows" AS "ff" ON "ff"."year" = "ce"."year"
INNER JOIN "socio_economic_metrics" AS "sem" ON "sem"."year" = "ce"."year";


-- VIEWS CREATION COMPLETED
------------------------------------------------------------------------------------------------------------------------------------------------------------------
