#   Hospital Data Analytics Project
### SQL-Based Healthcare Operations Analysis

---

## 📌 Table of Contents

- [Business Objective](#business-objective)
- [Project Brief](#project-brief)
- [Data Overview](#data-overview)
- [Tools & Techniques](#tools--techniques)
- [Key Insights](#key-insights)
- [Business Recommendations](#business-recommendations)
- [Project Link](#project-link)
- [Acknowledgement](#acknowledgement)
- [Future Improvements](#future-improvements)

---

## Business Objective

To analyze hospital admission data and extract operational insights related to patient admissions, hospital stay durations, doctor workload, and healthcare resource utilization.

The goal of this project is to enable:

- Data-driven operational planning for hospital administrators  
- Improved patient flow and bed utilization strategies  
- Better monitoring of treatment patterns and readmissions  
- Identification of diagnoses that consume the highest hospital resources  

---

## Project Brief

This SQL-based analytics project explores hospital operational data to generate insights into patient admissions, treatment patterns, and hospital capacity usage.

The analysis focuses on answering practical management questions such as:

- Which diagnoses lead to the longest hospital stays  
- Which doctors handle the highest number of admissions  
- Which patients experience frequent readmissions  
- What diagnoses consume the most hospital bed-days  
- How admissions fluctuate over time  

The project is structured into three analytical segments:

1. **Operational Efficiency Analysis**
2. **Patient & Treatment Insights**
3. **Hospital Capacity & Resource Utilization**

The SQL queries transform raw hospital records into meaningful insights that can support **better healthcare operations management**.

---

## Data Overview

The dataset consists of **four relational tables** representing hospital operations.

### Tables Included

| Table | Description |
|------|-------------|
| Admissions | Patient admission records including diagnosis, admission date, discharge date, and attending doctor |
| Patients | Patient demographic information |
| Doctors | Doctor details and medical specialties |
| Province Names | Mapping table for province identification |

### Dataset Coverage

**June 6, 2018 – June 5, 2019**

Because the dataset spans a partial calendar year, admission trends were analyzed using **monthly patterns instead of yearly comparisons**.

---

## Tools & Techniques

### Data Preparation

- Multi-table relational dataset loading
- Data validation and quality checks
- Filtering inconsistent records (invalid discharge dates)

### Data Analysis

SQL techniques used include:

- INNER JOIN for relational data analysis  
- Aggregation functions (`COUNT`, `AVG`, `SUM`)  
- Date functions (`DATEDIFF`, `DATE_FORMAT`, `TIMESTAMPDIFF`)  
- Conditional logic using `CASE`  
- Grouping and filtering using `GROUP BY` and `HAVING`  
- Subqueries for advanced analytical calculations  

### Analytical Focus

The analysis focuses on:

- Hospital **Length of Stay (LOS)** analysis  
- **Doctor workload distribution**  
- **Patient readmission patterns**  
- **Hospital bed utilization metrics**  
- **Admission trend analysis**

---

## Key Insights

### 1️⃣ Operational Efficiency

- Hospital length of stay varies significantly across diagnoses.  
- Some doctors manage considerably higher admission volumes than others.  
- Long hospital stays contribute to increased bed utilization pressure.  
- Certain cities and provinces generate higher patient admission volumes.

---

### 2️⃣ Patient & Treatment Insights

- A small group of patients accounts for multiple hospital admissions.  
- Certain diagnoses show higher likelihood of readmissions.  
- Patient demographic patterns influence admission frequency.  
- Missing allergy records highlight potential data quality issues.

---

### 3️⃣ Hospital Capacity & Resource Utilization

- A limited number of diagnoses consume a large share of total hospital bed-days.  
- Long-stay admissions significantly affect hospital capacity.  
- Monthly admission patterns reveal fluctuating hospital demand.  
- Some treatment categories require longer resource allocation.

---

## Business Recommendations

### For Hospital Administrators

- Monitor diagnoses associated with **long hospital stays** to optimize treatment workflows.  
- Evaluate doctor workload distribution to ensure balanced patient management.  
- Implement discharge optimization strategies to improve bed availability.

### For Healthcare Operations Teams

- Track frequent patient readmissions for early intervention programs.  
- Improve patient record completeness (e.g., allergy information).  
- Use admission trends to support better staffing and capacity planning.

---

## Project Link

🔗 **[View the SQL Project Repository](https://github.com/arpan-bisolution21/HOSPITAL_DATA_ANALYTICS_SQL)**

---

## Acknowledgement

This project was developed as part of a structured Business Intelligence portfolio initiative focused on applying SQL-based data analysis to real-world operational datasets.

The project demonstrates how SQL can transform raw healthcare data into meaningful insights for operational decision-making.

---

## Future Improvements

- Extend the dataset to include multi-year hospital records for trend analysis  
- Develop Power BI dashboards for interactive hospital performance monitoring  
- Integrate predictive models for patient readmission risk  
- Incorporate cost analysis metrics for hospital financial insights  
- Build automated healthcare KPI reporting frameworks  

---

### 🔎 Project Classification

Healthcare Analytics | SQL Data Analysis | Hospital Operations | Patient Admission Analysis | Business Intelligence | Data Exploration
