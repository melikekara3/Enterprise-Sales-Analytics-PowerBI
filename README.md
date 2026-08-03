# Enterprise Sales & Performance Analytics

A comprehensive Business Intelligence project developed using **SQL Server** and **Microsoft Power BI** to analyze enterprise sales performance, customer behavior, regional sales distribution, and sales representative performance.

The project covers the complete BI workflow, including data cleaning, data modeling, SQL transformations, DAX calculations, and interactive dashboard development.

---

# Project Overview

This project was developed using an enterprise sales dataset and consists of four main stages:

- Data preprocessing using SQL Server
- Data modeling with Star Schema
- KPI creation using DAX
- Interactive dashboard development in Power BI

---

# Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Microsoft Power BI
- Power Query
- DAX (Data Analysis Expressions)

---

# Project Structure

```
Enterprise-Sales-Analytics
│
├── Dataset
│
├── SQL
│   ├── 01_CreateDatabase.sql
│   ├── 02_DimensionTables.sql
│   ├── 03_DataCleaning.sql
│   └── 04_Validation.sql
│
├── PowerBI
│   ├── Enterprise-Sales-Analytics.pbix
│   └── Enterprise-Sales-Analytics.pdf
│
└── README.md
```

---

# Data Preparation

The raw sales dataset required several preprocessing steps before visualization.

The SQL phase included:

- Creating dimension tables
- Cleaning missing and inconsistent values
- Creating a customer dimension view to eliminate duplicate records
- Standardizing regional information
- Fixing decimal separator issues caused during CSV import
- Validating data consistency before visualization

---

# Data Model

A Star Schema data model was designed to improve reporting performance.

Fact Table

- Sales

Dimension Tables

- DimCustomer
- DimRegion
- DimDate
- Cities
- Item Master
- Sales Rep

---

# DAX Measures

The dashboard includes several analytical measures such as:

- Total Sales
- Total Cost
- Total Margin
- Margin %
- Sales YTD
- Sales LY
- Sales YoY %
- Customer Count
- Order Count
- Average Sales per Customer
- Team Average Sales
- Sales Representative Ranking

---

# Dashboard Pages

## Overview

<img width="1370" height="789" alt="Overview" src="https://github.com/user-attachments/assets/091fabed-c25e-48b0-a68c-c3ea62061ab7" />


Provides a high-level summary of core business performance and key metrics, including:

- **Key Performance Indicators (KPIs):** Total Sales ($104.85 M), Total Margin ($43.25 M), Margin % (41.25%), and Customer Count (683).
- **Monthly Sales Trend:** A dual-line chart comparing monthly performance between *Total Sales* and *Sales LY* (Last Year) across the months (Ocak - Aralık).
- **Regional Breakdown:** A column chart displaying *Total Sales* distribution by geographical markets (NORDIC, USA, JAPAN, UK, SPAIN, GERMANY).
- **Navigation:** Integrated dynamic buttons at the bottom for seamless transitions to specific analysis pages (*Region, Product, Customer, SalesRep, Detail*).

---

## Regional Sales & Performance Analysis

<img width="1368" height="790" alt="Region" src="https://github.com/user-attachments/assets/e3c289eb-f3ca-4ceb-b492-5e290580401a" />


Focuses on the geographical distribution and time-series performance across different global markets:

- **Key Metrics:** Summary boxes tracking Total Sales, Margin %, and Customer Count.
- **Regional Sales Share:** A donut chart showing the percentage and monetary share of sales per market, highlighting NORDIC as the leading region (45.48%).
- **Monthly Trend by Region:** A multi-line chart illustrating monthly sales trajectories mapped individually for Germany, Japan, Nordic, Spain, UK, and USA.
- **Interactive Slicers:** Dynamic regional filtering panel at the bottom along with standard year-based selection.

---

## Product Analysis

<img width="1367" height="789" alt="Product" src="https://github.com/user-attachments/assets/104b2975-61b1-444c-b46b-51a72e73da89" />


Evaluates product category contributions, volume, and profitability structures:

- **Key Metrics:** Dynamic cards for Total Sales ($104.85 M), Total Margin ($43.25 M), and Order Count (38.314 B).
- **Top 10 Products:** A bar chart sorting the most successful individual items based on sales volume (e.g., *Better Large Canned Shrimp*, *High Top Dried Mushrooms*).
- **Profitability Breakdown:** A stacked column chart visualizing *Margin %* performance and structural segments across different product categories (Seafood, Baked Goods, Snacks, Dairy, etc.).

---

## Customer Analysis

<img width="1383" height="801" alt="Customer" src="https://github.com/user-attachments/assets/7856cb52-29cf-465d-acbe-68079c083ad4" />


Explores customer profiles, purchasing volume, and behavioral segments:

- **Customer KPIs:** Summarized performance highlighting Customer Count (683), Average Sales per Customer ($153.52 B), and Total Sales.
- **Regional Market Concentration:** A Tree Map visualization sizing up regional customer clusters, emphasizing NORDIC and USA dominance.
- **Top 5 Customers:** A vertical bar chart identifying the highest-grossing corporate clients (*Paracel*, *PageWave*, *Deak-Perera Group*, *Talarian*, *Userland*).
- **Detailed Customer Directory:** A comprehensive matrix table listing individual customers, their home region, accumulated total sales, and individual order counts.

---

## Sales Representative Performance

<img width="1383" height="797" alt="SalesRep" src="https://github.com/user-attachments/assets/782d5c86-d678-45cf-8066-bfe0e3671453" />


Assesses internal sales team effectiveness, manager pipelines, and individual rankings:

- **Team Financials:** Highlights Total Sales alongside the Team Average Sales metric ($1.66 M).
- **Manager Pipeline:** A descending column chart detailing *Total Sales by Manager* to track supervisory performance (led by *Dennis Johnson* and *Stewart Wind*).
- **Regional Matrix:** A cross-tabulation table breaking down exact sales generated by each representative across specific countries (Germany, Japan, Nordic, Spain, UK, USA).
- **Performance Rankings:** A dedicated leaderboard ranking agents by metrics including Total Sales, individual *Rep Rank*, Margin %, and total Order Count.

---

## Details

<img width="1385" height="803" alt="Detail" src="https://github.com/user-attachments/assets/636b152a-b9e9-4d21-82a7-c43a061b33e5" />


A granular, transaction-level data grid optimized for operational auditing and deep filtering:

- **Granular Reporting:** Tabular breakdown displaying invoice numbers, exact dates, gross sales values, specific item descriptions (*Item_Desc*), calculated product costs, and resulting margins.
- **Total Aggregations:** Bottom row highlighting cumulative metrics across all filtered records (e.g., Gross Sales, Total Cost, Total Margin).
- **Time Intelligence Slicers:** Quick-filter sidebar panel allowing instant data isolation by calendar year (2012, 2013, 2014) or across the full dataset timeline.

## 🚀 How to Run This Project

### Prerequisites

Before running the project, make sure the following software is installed:

- Microsoft SQL Server Express
- SQL Server Management Studio (SSMS)
- Microsoft Power BI Desktop

---

### Installation

1. Clone this repository.

2. Import the CSV files located in the **Dataset** folder into your SQL Server database.

3. Execute the SQL scripts in the following order:

```
01_CreateDatabase.sql
02_DimensionTables.sql
03_DataCleaning.sql
04_Validation.sql
```

These scripts create the required dimension tables, clean the data, standardize regional information, and validate the final dataset.

4. Open the Power BI file located in the **PowerBI** folder.

5. Go to:

```
Home → Transform Data → Data Source Settings
```

Update the SQL Server connection to match your local SQL Server instance (e.g., `.\SQLEXPRESS`).

6. Click **Refresh** to load the data into Power BI.

The dashboard is now ready to use.
