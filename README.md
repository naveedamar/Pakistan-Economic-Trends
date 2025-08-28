# Pakistan's Economic Trends (1970-2020)

Video overview: https://youtu.be/bBVIK4Yr1B4

**Dataset**
The data used for this project, "GDP of Pakistan (1961-2020)," was obtained from Kaggle. The dataset was compiled and provided by Sadia Saeed.

    https://www.kaggle.com/datasets/sadiahs/pakistan-gdp-dataset

***

## Scope

This database serves as my **CS50 SQL** final project. Its purpose is to analyze Pakistan's macroeconomic and demographic trends from 1970 to 2020 (even though dataset has some data from 60s but i excluded that because most of it is unusable), providing a structured way to store time-series data for a data-driven analysis of economic development over five decades.

* **In Scope:**
    The database includes core economic indicators (GDP, growth, inflation, investments), financial flows (remittance), labor market data (unemployed rate), population metrics (population, population growth, net migration), and social indicators (internet users). The primary entities are the data points for each year, spanning from 1970 to 2020.

* **Out of Scope:**
    The database does not include real-time data, granular data (e.g., monthly or quarterly), provincial or city-level data, or any qualitative data. It is a simplified model of a country's economy, not a comprehensive economic database.

***

## Functional Requirements

* **In Scope:**
    A user should be able to query and retrieve data for specific years or ranges of years. They should be able to perform aggregations (e.g., average inflation over a decade), calculate derived metrics (e.g., per capita GDP), and join different data sets to analyze relationships (e.g., the relationship between GDP growth and total investments).

* **Out of Scope:**
    Users cannot add, delete, or modify data. The database is read-only, as the data is a historical record. Users also cannot perform complex forecasting or run machine learning models directly within the database.

***

## Representation

### Entities

* **Entities:** The database is designed with four entities to represent the data in a normalized structure: `core_economy`, `demographics`, `financial_flows`, and `socio_economic_metrics`.
* **Attributes:**

    **1. `core_economy`**
    This is the central table, which contains the main economic indicators and serves as the primary key for all other tables.

    * `year`: The specific year the data represents (e.g., 1970, 2020). This column is the **primary key** for your entire database.
    * `gdp`: The **Gross Domestic Product** in **billion US dollars ($)**. This is the total value of goods and services produced.
    * `growth`: The **annual GDP growth rate** in **percentage (%)**. This shows how much the economy grew or shrank compared to the previous year.

    **2. `demographics`**

    This table contains information about population and migration, linked to `core_economy` by the `year` column.

    * `year`: The year of the data, which is a **foreign key** referencing `core_economy`.
    * `population`: The total **population** of the country.
    * `population growth`: The **annual population growth rate** in **percentage (%)**.
    * `net migration`: The net number of people migrating into or out of the country in a given year.

    **3. `financial_flows`**

    This table tracks money moving into the country, linked to `core_economy` by the `year` column.

    * `year`: The year of the data, which is a **foreign key** referencing `core_economy`.
    * `total investments`: The **total amount of investments** in **billion US dollars ($)**.
    * `remittance`: The total amount of money sent home by people living abroad in **billion US dollars ($)**.

    **4. `socio_economic_metrics`**

    This table contains a mix of social and economic indicators, linked to `core_economy` by the `year` column.

    * `year`: The year of the data, which is a **foreign key** referencing `core_economy`.
    * `per capita`: The **per capita income** in **US dollars ($)**.
    * `inflation rate`: The **annual inflation rate** in **percentage (%)**. This measures how quickly prices for goods and services are rising.
    * `unemployed rate`: The **unemployment rate** in **percentage (%)**.
    * `internet users`: The **percentage of the population** using the internet in **percentage (%)**.

All columns are set to a numerical data type (e.g., **`INTEGER`** or **`REAL`**) to support mathematical operations like addition, division, and averaging. The **`Year`** column is an **`INTEGER`**, as it represents a whole number. Other metrics that can have decimal values (like GDP or growth rates) are **`REAL`** to ensure precision.

The **`Year`** column is a **`PRIMARY KEY`** in the `core_economy` table to guarantee that each year is unique and can serve as a central identifier. It is a **`FOREIGN KEY`** in the other three tables to enforce a **one-to-one relationship** and maintain data integrity, ensuring that a record in a satellite table always corresponds to a valid year in the main `core_economy` table.

***

## Relationships
<p align="center">
  <img src="images/er diagram.png" alt="ER Diagram" width="600">
</p>

All entities are linked by a **one-to-one relationship** with the `core_economy` table. The **`Year`** column serves as the primary key in `core_economy` and a foreign key in the other three tables. This design ensures data consistency and allows users to join all the data together on the **`Year`** to get a complete picture for any given year.

***

## Optimizations

* **Indexes:** An **index** on the **`Year`** column in the `core_economy` table is automatically created because it is the primary key. This is a crucial optimization because **`Year`** is the most common column for lookups and joins. Indexes on the **`Year` foreign keys** in the other tables would also be beneficial to speed up joins.
* **Views:** A **`VIEW`** can be created to simplify complex queries that join all four tables. For example, a view called `pakistan_economic_data` would join all tables on the **`Year`** column, allowing users to query it as if all the data were in a single table, without having to write multiple **`JOINS`**.

***

## Limitations

* **Simplicity:** The design is a simplified model of a complex economy. It does not account for regional variations, different economic sectors, or the impact of global events, all of which are crucial for a complete analysis.
* **Data Representation:** The database cannot represent non-numerical, qualitative data, such as a description of a major policy change in a given year. The design is purely quantitative and may lack context.
* **Scalability:** While this design is suitable for this specific dataset, it would not scale well for real-time or high-volume data, such as per-quarter or per-month economic data. For a larger, more granular data set, a more sophisticated design would be necessary.

***

## Sample Queries

### Average GDP Per Decade

* This table shows the average GDP for each decade, highlighting long-term economic trends.
<p align="center">
    <img src="images/AVERAGE_GDP.png" width="500" height="300" alt="Average GDP Per Decade">
</p>

### Total And Avg Remittances Through Out 5 Decades

* This table shows the total and average remittances over five decades, highlighting financial flows into the country.
<p align="center">
    <img src="images/TOTAL AND AVG REMITTANCE.png" width="500" height="300" alt="Total And Avg Remittances Through Out 5 Decades">
</p>

### Year, Per Capital When Unemployement Was Min And Max

* This table shows the year and per capita income for the periods when the unemployment rate was at its lowest and highest.
<p align="center">
    <img src="images/YEAR, CAPITAL WHEN M&M EMPLOYMENT.png" width="500" height="300" alt="Year, Per Capital When Unemployement Was Min And Max">
</p>


***

## Future Work

This project's foundation is built on SQL, but I plan to expand its capabilities to include more advanced analysis and visualization. The next phase will involve using **Python** to connect to the database, retrieve the prepared data, and perform a deeper statistical analysis.

Specific future goals for this project include:

* **Dataset Expansion:** Sourcing and integrating additional datasets to enrich the analysis with more comprehensive data points from other relevant sources.
* **Data Visualization:** Utilizing Python libraries such as `matplotlib` or `seaborn` to create compelling charts and graphs that visualize key trends, correlations, and relationships within the data.
* **Interactive Dashboard:** Building a web-based dashboard using tools like `Plotly` or `Dash` to allow for interactive exploration of the data.
* **Statistical Analysis:** Performing more advanced statistical analysis to identify significant correlations and potential causal relationships between different economic indicators.
