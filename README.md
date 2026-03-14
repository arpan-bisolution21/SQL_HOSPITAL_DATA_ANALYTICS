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

To analyze Hospital Admission Data and extract Operational Insights related to Patient Admissions, Hospital Stay Durations, Doctor Workload, and Healthcare Resource Utilization.

The Goal of this Project is to enable:

- Data-Driven Operational Planning for Hospital Administrators  
- Improved Patient Flow and Bed Utilization Strategies  
- Better Monitoring of Treatment Patterns and Readmissions  
- Identification of Diagnoses that consume the Highest Hospital Resources  

---

## Project Brief

This SQL-Based Analytics projeyct explores Hospital Operational Data to generate Insights into Patient Admissions, Treatment Patterns, and Hospital Capacity Usages.

The Analysis focuses on answering Practical Management Questions such as:

- Which Diagnoses lead to the Longest Hospital Stays  
- Which Doctors handle the Highest Number of Admissions  
- Which Patients experience Frequent Readmissions  
- What Diagnoses consume the Most Hospital Bed-Days  
- How Admissions fluctuate over Time  

The Project is structured into Three Analytical Segments:

1. **Operational Efficiency Analysis**
2. **Patient & Treatment Insights**
3. **Hospital Capacity & Resource Utilization**

The SQL Queries transform Raw Hospital Records into Meaningful Insights that can support Effective Healthcare Operations Management.

---

## Data Overview

The Dataset consists of Four Relational Tables representing Hospital Operations.

### Tables Included

| Table | Description |
|------|-------------|
| Admissions | Patient Admissions Records including Diagnosis, Admission Date, Discharge Date, and Attending Doctor |
| Patients | Patient Demographic Information |
| Doctors | Doctor Details and Medical Specialties |
| Province Names | Mapping Table for Province Identification |

### Dataset Coverage

**June 6, 2018 – June 5, 2019**

Because the Dataset spans a Partial Calendar Year, Admission Trends were analyzed using Monthly Patterns instead of Yearly Comparisons.

---

## Tools & Techniques

### Data Preparation

- Multi-Table Relational Dataset Loading
- Data Validation and Quality Checks
- Filtering Inconsistent Records (Invalid Discharge Dates)

### Data Analysis

SQL techniques used include:

- INNER JOIN for Relational Data Analysis  
- Aggregation Functions (`COUNT`, `AVG`, `SUM`)  
- Date Functions (`DATEDIFF`, `DATE_FORMAT`, `TIMESTAMPDIFF`)  
- Conditional Logic using `CASE`  
- Grouping and Filtering using `GROUP BY` and `HAVING`  
- Subqueries for Advanced Analytical Calculations  

### Analytical Focus

The Analysis focuses on:

- Hospital Length of Stays (LOSs) Analysis  
- Doctor Workload Distribution 
- Patient Readmission Patterns 
- Hospital Bed Utilization Metrics
- Admission Trend Analysis

---

## Key Insights

### 1️⃣ Operational Efficiency

- Total Admissions count to 5067.
- Hospital Average Length of Stays - 4.49 Days and Average Admission Figures - 13.88.  
- Dr. Claude Walls manages considerably Higher Admission Volumes (214) than others.  
- 3 Months - October (448), July (448) & August (439); have come with Peak Admissions.  
- 3 Cities - Hamilton (2169), Toronto (363) & Burlington (319) generate Higher Patient Admission Volumes.

---

### 2️⃣ Patient & Treatment Insights

- Patients Emil Owens & Luanne Matthews account for Multiple Admissions (4 Times).
- 5 Diagonosis show Higher Likelihood of Readmissions.  
- Male Patients count to 2740 & Female Patients count to 2327.  
- Missing Allergy Records (2059) highlight Potential Data Quality Issues.

---

### 3️⃣ Hospital Capacity & Resource Utilization

- Congestive Heart Failures consume a large share of Total Hospital Bed-Days (1225).   
- 1685 Patinets have Repeat Visit Records. (>1)  
- Province British Columbia records the Longest Average Length of Stay - 5.36 Days.

---

## Business Recommendations

### For Hospital Administrators

- Monitor Diagnoses associated with Long Hospital Stays to optimize Treatment Workflows.  
- Evaluate Doctor's Workload Distributions to ensure Balanced Patient Management.  
- Implement Discharge Optimization Strategies to improve Bed Availability.

### For Healthcare Operations Teams

- Track Frequent Patient Readmissions for Early Intervention Programs.  
- Improve Patient Record Completeness (e.g., Allergy Information).  
- Use Admission Trends to support Better Staffing and Capacity Planning.

---

## Project Link

🔗 https://github.com/arpan-bisolution21/SQL_HOSPITAL_DATA_ANALYSIS/blob/9d2586fd6550be877c6ab17f1c02e7b0c197a821/05.HOSPITAL_DATA_ANALYSIS_PROJECT.sql 

---

## Acknowledgement

This Project was developed as part of a Structured Business Intelligence Portfolio Initiative focused on applying SQL-Based Data Analysis to Real-World Operational Datasets.

The Project demonstrates how SQL can transform Raw Healthcare Data into Meaningful Insights for Operational Decision-Making.

---

## Future Improvements

- Extend the Dataset to include Multi-Year Hospital Records for Trend Analysis  
- Develop Power BI Dashboards for Interactive Hospital Performance Monitoring  
- Integrate Predictive Models for Patient Readmission Risk  
- Incorporate Cost Analysis Metrics for Hospital Financial Insights  
- Build Automated Healthcare KPI Reporting Frameworks 

---

### 🔎 Project Classification

Healthcare Analytics | SQL Data Analysis | Hospital Operations | Patient Admission Analysis | Business Intelligence | Data Exploration
