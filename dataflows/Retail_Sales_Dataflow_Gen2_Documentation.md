\# Retail Sales Data Engineering \& Analytics Platform



\## Dataflow Gen2 Documentation



\### 1. Overview



\*\*Dataflow Gen2\*\* is used as the visual data preparation and transformation component of the Microsoft Fabric solution.



It sits after initial data ingestion and prepares the retail datasets for downstream processing.



```text

Source Data

&#x20;   ↓

Pipeline

&#x20;   ↓

Lakehouse

&#x20;   ↓

Dataflow Gen2

&#x20;   ↓

Silver Outputs

&#x20;   ↓

Gold / Warehouse

&#x20;   ↓

Semantic Model

&#x20;   ↓

Power BI

```



The project uses Dataflow Gen2 instead of Notebooks/PySpark to demonstrate a practical low-code data transformation workflow.



\---



\## 2. Role in the Architecture



The responsibilities are separated across Fabric components:



| Component      | Responsibility                    |

| -------------- | --------------------------------- |

| Pipeline       | Source data ingestion             |

| Lakehouse      | Data storage                      |

| Dataflow Gen2  | Data preparation / transformation |

| Silver         | Prepared datasets                 |

| Gold           | Analytical-ready data             |

| Warehouse      | SQL-based analytical serving      |

| Semantic Model | Analytical modeling               |

| Power BI       | Reporting                         |



Dataflow Gen2 is a \*\*separate Fabric component\*\*, not an activity inside the original Copy Data pipeline.



\---



\## 3. Dataset Scope



The project uses a controlled retail dataset:



| Dataset     | Records |

| ----------- | ------: |

| Customers   |     150 |

| Products    |     100 |

| Stores      |      18 |

| Orders      |   4,200 |

| Order Items |   4,000 |

| Returns     |     620 |



The dataset is intentionally limited. The purpose is to understand and implement the complete Fabric architecture rather than benchmark Fabric with millions of records.



The same architecture and transformation concepts can be applied to larger production datasets.



\---



\## 4. Dataflow Gen2 Configuration



A \*\*single Dataflow Gen2\*\* was used for the six retail datasets.



The queries were organized using Silver-layer names:



| Source Dataset | Dataflow Query       |

| -------------- | -------------------- |

| Customers      | `Customers\_Silver`   |

| Products       | `Products\_Silver`    |

| Stores         | `Stores\_Silver`      |

| Orders         | `Orders\_Silver`      |

| Order Items    | `Order\_Items\_Silver` |

| Returns        | `Returns\_Silver`     |



The outputs were configured for:



```text

Lakehouse: Retail\_Sales\_Lakehouse

Schema:    dbo

```



\---



\## 5. Silver-Layer Outputs



The Dataflow Gen2 outputs are:



```text

Customers\_Silver

Products\_Silver

Stores\_Silver

Orders\_Silver

Order\_Items\_Silver

Returns\_Silver

```



The naming convention clearly separates the original datasets from their prepared Silver-layer outputs.



Example:



```text

Customers

&#x20;   ↓

Dataflow Gen2

&#x20;   ↓

Customers\_Silver

```



\---



\## 6. Customer Data Output



The documented `Customers\_Silver` output contains:



| Column       |

| ------------ |

| CustomerID   |

| CustomerName |

| Gender       |

| City         |

| State        |

| Country      |

| SignupDate   |



`CustomerID` was retained as \*\*Text\*\* because values follow an identifier pattern such as:



```text

CUST0001

CUST0002

CUST0003

```



Blank `City` values were retained where present in the source data.



No duplicate Customer IDs were identified in the reviewed dataset.



\---



\## 7. Actual Transformation Scope



This documentation records only the work that was actually performed and evidenced.



The confirmed Dataflow Gen2 implementation includes:



\* Adding the six retail datasets to one Dataflow Gen2.

\* Maintaining separate queries for each dataset.

\* Renaming the queries using Silver-layer names.

\* Configuring Lakehouse destinations.

\* Using the `dbo` schema.

\* Configuring `Customers\_Silver` as the Customer output.

\* Reviewing the resulting Customer structure and data.



The project does \*\*not\*\* claim unsupported transformations such as:



\* Complex filtering

\* Joins / merges

\* Calculated columns

\* Aggregations

\* Business-rule transformations

\* Advanced data-quality rules

\* Deduplication across the datasets



This keeps the documentation aligned with the actual implementation.



\---



\## 8. Execution and Validation



The Dataflow Gen2 implementation was executed as part of the project workflow.



Validation focused on:



\* Output availability

\* Dataset structure

\* Customer columns

\* CustomerID handling

\* Lakehouse outputs

\* Consistency with the source data



Relevant Dataflow Gen2 configuration, execution, and output screenshots are retained as project evidence.



\---



\## 9. Production Considerations



This implementation is designed for learning and portfolio demonstration.



In a larger production environment, Dataflow Gen2 solutions may additionally use:



\* Incremental processing

\* Parameterization

\* Data-quality rules

\* Error handling

\* Monitoring

\* Performance optimization

\* Environment-specific configuration

\* CI/CD



These are outside the primary scope of this project.



\---



\## 10. Conclusion



Dataflow Gen2 provides the visual data preparation layer in the Retail Sales Data Engineering \& Analytics Platform.



The implementation uses one Dataflow Gen2 with six Silver-layer outputs:



```text

Customers\_Silver

Products\_Silver

Stores\_Silver

Orders\_Silver

Order\_Items\_Silver

Returns\_Silver

```



The outputs are configured for:



```text

Retail\_Sales\_Lakehouse → dbo

```



The project intentionally focuses on \*\*practical Microsoft Fabric architecture, data processing, ETL/ELT concepts, and implementation\*\* rather than unnecessary complexity.



\### Project Focus



> \*\*Primary Focus:\*\* Dataflow Gen2, Data Transformation, Lakehouse Processing, Silver-Layer Preparation, and Microsoft Fabric Data Engineering.



> \*\*Secondary Focus:\*\* Warehouse, Semantic Model, and Power BI analytical consumption.



