# Microsoft Fabric – Retail Sales Data Engineering & Analytics Platform

## 📌 Project Overview

This project demonstrates an end-to-end **Microsoft Fabric data engineering and analytics workflow** using a retail sales dataset.

The primary objective is to practically implement and understand how Fabric components work together across **data ingestion, transformation, analytical processing, SQL validation, semantic modeling, reporting, and deployment across environments**.

The solution is intentionally kept simple and practical, focusing on the Fabric architecture rather than unnecessary complexity.

---

## 🛠️ Technology Stack

![Microsoft Fabric](https://img.shields.io/badge/Microsoft%20Fabric-Data%20Engineering-blue)
![OneLake](https://img.shields.io/badge/Microsoft%20Fabric-OneLake-blue)
![Lakehouse](https://img.shields.io/badge/Fabric-Lakehouse-blue)
![Pipelines](https://img.shields.io/badge/Fabric-Pipelines-blue)
![Dataflow Gen2](https://img.shields.io/badge/Fabric-Dataflow%20Gen2-blue)
![Warehouse](https://img.shields.io/badge/Fabric-Warehouse-blue)
![SQL](https://img.shields.io/badge/Analytics-SQL-orange)
![Semantic Model](https://img.shields.io/badge/Fabric-Semantic%20Model-blue)
![Power BI](https://img.shields.io/badge/Microsoft-Power%20BI-yellow)
![Deployment Pipelines](https://img.shields.io/badge/Fabric-Deployment%20Pipelines-blue)
![CI/CD](https://img.shields.io/badge/CI%2FCD-Deployment%20Pipeline-green)
![GitHub](https://img.shields.io/badge/Portfolio-GitHub-black)

**Key Technologies:** Microsoft Fabric · OneLake · Lakehouse · Pipelines · Dataflow Gen2 · Warehouse · SQL · Semantic Model · Power BI · Deployment Pipelines

---

## 🏗️ Architecture

```text
                    Retail Source Data
                           │
                           ▼
                    Fabric Pipeline
                    (Copy Data)
                           │
                           ▼
                       Lakehouse
                           │
                           ▼
                     Dataflow Gen2
                           │
                           ▼
                  Silver / Analytical Data
                           │
                           ▼
                       Warehouse
                           │
                           ▼
                    Semantic Model
                           │
                           ▼
                       Power BI


              ┌─────────────────────────────┐
              │   Fabric Deployment Pipeline│
              │                             │
              │  Development → Test → Prod  │
              └─────────────────────────────┘
```

### Architecture Components

* **Microsoft Fabric Workspace**
* **OneLake / Lakehouse**
* **Pipeline**
* **Dataflow Gen2**
* **Silver / analytical data layers**
* **Fabric Warehouse**
* **SQL validation**
* **Semantic Model**
* **Power BI**
* **Fabric Deployment Pipeline**

---

## 📊 Dataset

The project uses a controlled retail sales dataset:

| Dataset     | Records |
| ----------- | ------: |
| Customers   |     150 |
| Products    |     100 |
| Stores      |      18 |
| Orders      |   4,200 |
| Order Items |   4,000 |
| Returns     |     620 |

### Why a Controlled Dataset?

The dataset size is intentionally limited.

The purpose of this project is **not to benchmark Microsoft Fabric using millions of records**. The focus is on successfully implementing the complete data engineering and analytics workflow and gaining practical experience with the Fabric architecture.

The same concepts can be applied to significantly larger production datasets.

---

## 🔄 Data Engineering Workflow

### 1. Data Ingestion

A Microsoft Fabric Pipeline was used with a **Copy Data activity** to ingest the source datasets into the Lakehouse.

The pipeline was validated and executed successfully.

### 2. Lakehouse

The Lakehouse acts as the central storage layer for the project.

**Lakehouse:**

```text
Retail_Sales_Lakehouse
```

### 3. Dataflow Gen2

A single Dataflow Gen2 was used for the six retail datasets.

The datasets were organized using Silver-layer query/output names:

```text
Customers_Silver
Products_Silver
Stores_Silver
Orders_Silver
Order_Items_Silver
Returns_Silver
```

The outputs were configured for:

```text
Retail_Sales_Lakehouse → dbo
```

### 4. Analytical Data Processing

The Dataflow Gen2 outputs were prepared as structured datasets for downstream analytical use and Warehouse integration.

### 5. Warehouse & SQL

A Fabric Warehouse was used as the SQL-based analytical serving layer.

SQL validation was performed and saved as a project artifact to verify the processed data.

### 6. Semantic Model

A Semantic Model was created to provide the analytical modeling layer between the processed data and Power BI.

### 7. Power BI

A simple Power BI report was created to demonstrate the final analytical consumption of the processed data.

The report intentionally focuses on demonstrating the data flow rather than advanced dashboard design.

---

## 🔁 CI/CD — Deployment Pipeline

Fabric Deployment Pipelines were implemented to demonstrate promotion of the solution across multiple environments.

### Environment Structure

```text
Development
     │
     │ Deploy
     ▼
   Test
     │
     │ Deploy
     ▼
 Production
```

### Workspaces

| Environment | Workspace                        |
| ----------- | -------------------------------- |
| Development | `Retail_Sales_DE_Analytics`      |
| Test        | `Retail_Sales_DE_Analytics_Test` |
| Production  | `Retail_Sales_DE_Analytics_Prod` |

### Deployment Process

The project was successfully promoted through the following stages:

```text
Development → Test → Production
```

Both deployment transitions were successfully completed and the Production workspace was verified after deployment.

This demonstrates a practical Fabric deployment workflow for moving developed content through separate environments.

> **Note:** Fabric Git integration was not implemented as part of this project. The CI/CD implementation demonstrated here uses **Fabric Deployment Pipelines**.

---

## 🧩 Key Fabric Concepts Demonstrated

| Area                  | Implementation                  |
| --------------------- | ------------------------------- |
| Workspace             | Fabric project workspaces       |
| Data Ingestion        | Fabric Pipeline / Copy Data     |
| Storage               | OneLake / Lakehouse             |
| Transformation        | Dataflow Gen2                   |
| Data Processing       | Silver / analytical datasets    |
| Analytical Serving    | Fabric Warehouse                |
| Validation            | SQL                             |
| Modeling              | Semantic Model                  |
| Visualization         | Power BI                        |
| CI/CD                 | Fabric Deployment Pipelines     |
| Environment Promotion | Development → Test → Production |
| Architecture          | End-to-end Fabric workflow      |

---

## 🧪 Validation

Validation was performed at different stages of the workflow, including:

* Pipeline execution
* Lakehouse data availability
* Dataflow outputs
* Silver-layer datasets
* Warehouse accessibility
* SQL validation
* Semantic Model connectivity
* Power BI data consumption
* Test environment deployment
* Production environment verification

Supporting screenshots and SQL validation files are retained within the project.

---

## 📸 Project Evidence

The project includes evidence covering the major implementation stages, including:

* Fabric Workspace
* Lakehouse
* Data ingestion
* Pipeline configuration
* Successful Pipeline execution
* Dataflow Gen2
* Silver / analytical processing
* Warehouse
* SQL validation
* Semantic Model
* Power BI
* Architecture
* Deployment Pipeline
* Development → Test deployment
* Test → Production deployment
* Production workspace verification

The screenshots provide practical evidence of the Fabric implementation.

---

## 📁 Project Structure

```text
03_Microsoft Fabric — Retail Sales Data Engineering & Analytics Platform
│
├── data/
│
├── pipelines/
│   └── Retail_Sales_Pipeline_Documentation.md
│
├── dataflows/
│   └── Retail_Sales_Dataflow_Gen2_Documentation.md
│
├── warehouse/
│   └── Retail_Sales_Warehouse_Documentation.md
│
├── sql/
│   └── SQL_Validation.sql
│
├── screenshots/
│
├── architecture/
│
└── README.md
```

---

## 🎯 Project Scope

The primary focus of this project is:

> **Microsoft Fabric Data Engineering, ETL/ELT, Data Ingestion, Data Transformation, Lakehouse Processing, Warehouse Integration, SQL Validation, Semantic Modeling, Analytical Consumption, and CI/CD deployment.**

The project deliberately avoids unnecessary complexity and does not use Notebooks/PySpark.

The implementation instead focuses on Fabric's UI-driven capabilities such as:

* Pipelines
* Lakehouse
* Dataflow Gen2
* Warehouse
* Semantic Model
* Power BI
* Deployment Pipelines

---

## 💡 Key Learning Outcomes

This project provided practical experience with:

* Microsoft Fabric workspace architecture
* OneLake / Lakehouse-based data engineering
* Pipeline-based ingestion
* Dataflow Gen2
* Silver / analytical data processing
* Fabric Warehouse
* SQL validation
* Semantic modeling
* Power BI integration
* End-to-end ETL/ELT workflow
* Separation of ingestion, transformation, storage, and analytical serving
* Fabric Deployment Pipelines
* Development, Test, and Production environments
* Environment-to-environment deployment
* Practical CI/CD concepts in Microsoft Fabric

---

## 🚀 Conclusion

The Retail Sales Data Engineering & Analytics Platform demonstrates a practical **end-to-end Microsoft Fabric workflow** from source data ingestion through analytical reporting and multi-environment deployment.

The project focuses on understanding how individual Fabric components work together to build a modern data engineering and analytics solution while keeping the implementation simple, reproducible, and portfolio-ready.

The completed solution demonstrates the progression from **data ingestion → transformation → analytical serving → semantic modeling → reporting → CI/CD deployment** using Microsoft Fabric.
