# 🛒 Walmart Sales Data Analysis Project
This project focuses on analyzing Walmart sales data using SQL and Python. The data was cleaned and preprocessed using Python, stored in a PostgreSQL database, and analyzed through SQL queries to solve 9 key business problems.

--- 

##  Project Overview

- **Objective**: To derive actionable insights from Walmart sales data.
- **Tools Used**: Python (for data cleaning), PostgreSQL (for database management), SQL (for analysis).
- **Scope**: Solving 9 real-world business problems related to sales performance, customer behavior, and operational efficiency.
 
---
 
## Set Up the Environment
- **Tools Used**: Visual Studio Code (VS Code), Python, SQL (MySQL and PostgreSQL)
- **Goal**: Create a structured workspace within VS Code and organize project folders for smooth development and data handling.



## Set Up Kaggle API
 - **API Setup**: Obtain your Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to your profile settings and downloading the JSON file.
   - **Configure Kaggle**: 
      - Place the downloaded `kaggle.json` file in your local `.kaggle` folder.
      - Use the command `kaggle datasets download -d <dataset-path>` to pull datasets directly into your project.


### Download Walmart Sales Data
   - **Data Source**: Use the Kaggle API to download the Walmart sales datasets from Kaggle.
   -  **Storage**: Save the data in the `data/` folder for easy reference and access.



- ##  Tech Stack

- **Python** – Data Cleaning (Pandas, NumPy)
- **PostgreSQL** – Relational Database
- **SQL** – Querying and Analysis
- **VS Code / Script** – For data preprocessing
- **pgAdmin / psycopg2** – For database connectivity



##  Data Cleaning (Python)

- Removed duplicates and null values
- Converted data types (e.g., date/time formats)
- Standardized text formatting
- Extracted additional features: Month, Hour, Day of the Week, etc.
- Loaded the cleaned data into a PostgreSQL database



## Feature Engineering
- Create New Columns: Calculate the Total Amount for each transaction by multiplying unit_price by quantity and adding this as a new column.
- Enhance Dataset: Adding this calculated field will streamline further SQL analysis and aggregation tasks.



## Load Data into MySQL and PostgreSQL
- Set Up Connections: Connect to  PostgreSQL using sqlalchemy and load the cleaned data into each database.
- Table Creation: Set up tables in PostgreSQL using Python SQLAlchemy to automate table creation and data insertion.
- Verification: Run initial SQL queries to confirm that the data has been loaded accurately.



### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
   - Revenue trends across branches and categories.
   - Identifying best-selling product categories.
   - Sales performance by time, city, and payment method.
   - Analyzing peak sales periods and customer buying patterns.
   - Profit margin analysis by branch and category.
   - **Documentation**: Keep clear notes of each query's objective, approach, and results.

---

## Requirements

- **Python 3.8+**
- **SQL Databases**: MySQL, PostgreSQL
- **Python Libraries**:
  - `pandas`, `numpy`, `sqlalchemy`, `mysql-connector-python`, `psycopg2`
- **Kaggle API Key** (for data downloading)

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repo-url>
   ```
2. Install Python libraries:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up your Kaggle API, download the data, and follow the steps to load and analyze.

---

## Project Structure

```plaintext
|-- walmart             # Transformed data
|-- walmart_sales.sql         # SQL scripts for analysis and queries
|-- README.md                 # Project documentation
|-- requirements.txt          # List of required Python libraries
|-- main.py                   # Main script for loading, cleaning, and processing data
```
---

## Results and Insights

This section will include your analysis findings:
- **Sales Insights**: Key categories, branches with highest sales, and preferred payment methods.
- **Profitability**: Insights into the most profitable product categories and locations.
- **Customer Behavior**: Trends in ratings, payment preferences, and peak shopping hours.

---

## Acknowledgments

- **Data Source**: Kaggle’s Walmart Sales Dataset
- **Inspiration**: Walmart’s business case studies on sales and supply chain optimization.

---
