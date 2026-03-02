USE project_medical_data_history;

SELECT * FROM admissions;       # 5067 records
SELECT * FROM doctors;          # 27 records
SELECT * FROM patients;         # 4530 records
SELECT * FROM province_names;   # 13 records


# OPERATIONAL EFFICIENCY (Q1-Q10)

# Q1. What is the average length of stay (LOS) for patients?

	 SELECT 
            ROUND(
					AVG(DATEDIFF(discharge_date, admission_date)), 
				    2
				 )  AS avg_length_of_stay_days
	 FROM admissions
     WHERE discharge_date IS NOT NULL
          AND discharge_date >= admission_date;
     
# Q2. Which diagnoses have the longest average hospital stay?

     SELECT 
            diagnosis,
	        ROUND(
                    AVG(DATEDIFF(discharge_date, admission_date)), 
                    2
				 )  AS avg_longest_stay_days
	 FROM admissions
     GROUP BY diagnosis
	 ORDER BY avg_longest_stay_days DESC
     LIMIT 10;
     
# Q3. Which doctors handle the highest number of admissions?

     SELECT 
            CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
			COUNT(*) AS total_admissions
     FROM admissions a
     JOIN doctors d 
		 ON a.attending_doctor_id = d.doctor_id
     GROUP BY doctor_name
     ORDER BY total_admissions DESC;
     
# Q4. What is the average length of stay (LOS) per doctor?

     SELECT 
            CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
			COUNT(*) AS total_admissions,
			ROUND(
                   AVG(DATEDIFF(a.discharge_date, a.admission_date)),
                   2
				 ) AS avg_length_of_stay_days
     FROM admissions a
     JOIN doctors d 
		 ON a.attending_doctor_id = d.doctor_id
     WHERE a.discharge_date IS NOT NULL
		  AND a.discharge_date >= a.admission_date
     GROUP BY doctor_name
	 ORDER BY avg_length_of_stay_days;
     
# Q5. Which months experience peak admissions?
     
     SELECT 
            MONTHNAME(admission_date) AS `month`,
	        COUNT(*) AS total_admissions
	 FROM admissions
	 GROUP BY `month`
	 ORDER BY total_admissions DESC;
     
# Q6. How many patients are currently admitted?

     SELECT 
            COUNT(*) AS current_inpatients
     FROM admissions
     WHERE admission_date IS NOT NULL;
     
# Q7. What is the average daily inpatient load?

	 SELECT 
            ROUND(
				   COUNT(*) / COUNT(DISTINCT admission_date),
                   2
                 ) AS avg_daily_admissions
	 FROM admissions;
     
# Q8. What is the average length of stay (LOS) by doctor's specialty?

     SELECT 
            d.specialty,
            ROUND(
                   AVG(DATEDIFF(a.discharge_date, a.admission_date)), 
                   2
				 ) AS avg_length_of_stays
     FROM admissions a
     JOIN doctors d 
		 ON a.attending_doctor_id = d.doctor_id
     WHERE a.discharge_date IS NOT NULL
		  AND a.discharge_date >= a.admission_date
     GROUP BY d.specialty
     ORDER BY avg_length_of_stays DESC;
     
# Q9. Which cities generate the highest patient volume?

     SELECT 
            p.city,
            COUNT(*) AS total_admissions
     FROM patients p
     JOIN admissions a 
		 ON p.patient_id = a.patient_id
     GROUP BY p.city
     ORDER BY total_admissions DESC
     LIMIT 10;
     
# Q10. How many admissions occur per province?

      SELECT 
             pr.province_name,
             COUNT(*) AS total_admissions
      FROM patients p
      JOIN admissions a 
		  ON p.patient_id = a.patient_id
      JOIN province_names pr 
		  ON p.province_id = pr.province_id
	  GROUP BY pr.province_name;
      
# Q11. How many admissions lasted more than 7 days, and what percentage do they represent?
     
      SELECT 
             COUNT(*) AS long_stay_admissions,
             ROUND(
			        COUNT(*) * 100.0 /
                  (
					SELECT COUNT(*)
                    FROM admissions
                    WHERE discharge_date IS NOT NULL
                         AND discharge_date >= admission_date
                  ),
                   2
                  ) AS long_stay_percentage
      FROM admissions
      WHERE discharge_date IS NOT NULL
           AND discharge_date >= admission_date
           AND DATEDIFF(discharge_date, admission_date) > 7;
           
# PERFORMANCE ENHANCEMENT (Q12-Q19)

# Q12. Who are the top 10 most frequently admitted patients?

       SELECT 
              CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
              COUNT(*) AS total_visits
       FROM patients p
       JOIN admissions a 
		   ON p.patient_id = a.patient_id
       GROUP BY patient_name
       ORDER BY total_visits DESC
       LIMIT 10;
       
# Q13. Which diagnoses have the highest readmission rate?
       
       SELECT 
              diagnosis,
              COUNT(*) AS total_admissions,
              COUNT(DISTINCT patient_id) AS unique_patients,
              COUNT(*) - COUNT(DISTINCT patient_id) AS readmissions,
              ROUND(
                    (COUNT(*) - COUNT(DISTINCT patient_id)) * 1.0 / COUNT(*),
					2
                   ) AS readmission_rate
       FROM admissions
       WHERE admission_date IS NOT NULL
       GROUP BY diagnosis
       HAVING COUNT(*) > 1
       ORDER BY readmission_rate DESC
       LIMIT 10;

       
# Q14. What is the average age of an admitted patient?

       SELECT 
              ROUND(
                    AVG(TIMESTAMPDIFF(YEAR, p.birth_date, a.admission_date)),
				   1) AS avg_age
	   FROM patients p
	   JOIN admissions a 
		   ON p.patient_id = a.patient_id;
                  
# Q15. Extract the gender based counts. 

       SELECT 
              p.gender,
              COUNT(*) AS admissions
	   FROM patients p
       JOIN admissions a 
           ON p.patient_id = a.patient_id
       GROUP BY p.gender;
       
# Q16. How many patients have no allegies?

       SELECT 
              CONCAT(first_name, ' ', last_name) AS patient_name
       FROM patients
       WHERE allergies IS NULL;
       
# Q17. What is the average length of stay (LOS) by per age group?

       SELECT 
              CASE 
                   WHEN TIMESTAMPDIFF(YEAR, p.birth_date, a.admission_date) < 18 THEN 'Junior'
                   WHEN TIMESTAMPDIFF(YEAR, p.birth_date, a.admission_date) BETWEEN 18 AND 35 THEN 'Young'
                   WHEN TIMESTAMPDIFF(YEAR, p.birth_date, a.admission_date) BETWEEN 35 AND 60 THEN 'Mid-Aged'
              ELSE 'Senior'
       END AS age_group,
       ROUND(
               AVG(DATEDIFF(a.discharge_date, a.admission_date)), 
			2) AS avg_length_of_stay_days
       FROM patients p
	   JOIN admissions a 
           ON p.patient_id = a.patient_id
       WHERE a.discharge_date IS NOT NULL
            AND a.discharge_date >= a.admission_date
       GROUP BY age_group
       ORDER BY avg_length_of_stay_days;

# Q18. Which doctors treat the widest variety of diagnoses?

       SELECT 
              CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
              COUNT(DISTINCT a.diagnosis) AS diagnosis_counts
       FROM doctors d
       JOIN admissions a 
           ON d.doctor_id = a.attending_doctor_id
	   GROUP BY doctor_name
       ORDER BY diagnosis_counts DESC;
       
# Q19. What are the average admission counts per doctor per year?
 
	   SELECT 
              CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
			  YEAR(a.admission_date) AS `year`,
              COUNT(*) AS admissions
       FROM admissions a
       JOIN doctors d 
           ON a.attending_doctor_id = d.doctor_id
       GROUP BY doctor_name, `year`
       ORDER BY doctor_name, `year`;
       
# COST REDUCTION & REVENUE OPTIMIZATION (Q20–Q26)

# Q20. Who are the top 10 long-stay patients contributing to high cost?

       SELECT 
              CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
			  DATEDIFF(a.discharge_date, a.admission_date) AS stay_days
       FROM patients p
       JOIN admissions a 
           ON p.patient_id = a.patient_id
       ORDER BY stay_days DESC
       LIMIT 10;
       
# Q21. What are the top 10 diagnoses by total bed-days consumed?

       SELECT 
              diagnosis,
              SUM(DATEDIFF(discharge_date, admission_date)) AS total_bed_days,
              COUNT(*) AS admission_counts,
              ROUND(
                    AVG(DATEDIFF(discharge_date, admission_date)), 
                    2
                   ) AS avg_length_of_stay_days
       FROM admissions
       WHERE discharge_date IS NOT NULL
            AND discharge_date >= admission_date
       GROUP BY diagnosis
       ORDER BY total_bed_days DESC
       LIMIT 10;
       
# Q22. How many repeat patients are there? 
	   
       SELECT 
              patient_id,
              COUNT(*) AS visit_counts
       FROM admissions
       GROUP BY patient_id
       HAVING visit_counts > 1;

# Q23. Extract the average length of stay (LOS) trend by year. 
       
       SELECT 
              YEAR(admission_date) AS `year`,
              ROUND(
                      AVG(DATEDIFF(discharge_date, admission_date)), 
				   2) AS avg_length_of_stay_days
              FROM admissions
              WHERE discharge_date IS NOT NULL
                   AND discharge_date >= admission_date
              GROUP BY `year`
              ORDER BY `year`;
              
# Q24. Extract the province wise average length of stay (LOS). 
       
       SELECT 
              pr.province_name,
              ROUND(
                      AVG(DATEDIFF(a.discharge_date, a.admission_date)), 
				   2) AS avg_length_of_stay_days
       FROM patients p
       JOIN admissions a 
           ON p.patient_id = a.patient_id
       JOIN province_names pr 
           ON p.province_id = pr.province_id
       WHERE a.discharge_date IS NOT NULL
       AND a.discharge_date >= a.admission_date
       GROUP BY pr.province_name
       ORDER BY avg_length_of_stay_days DESC;
       
# Q25. Evaluate the performance of the doctors. 

       SELECT 
               CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
               COUNT(*) AS admissions,
               ROUND(
                       AVG(DATEDIFF(a.discharge_date, a.admission_date)), 
                    2) AS avg_length_of_stay_days
       FROM doctors d
       JOIN admissions a 
           ON d.doctor_id = a.attending_doctor_id
       WHERE a.discharge_date IS NOT NULL
            AND a.discharge_date >= a.admission_date
       GROUP BY doctor_name
       ORDER BY admissions DESC, avg_length_of_stay_days ASC;
       
# Q26. Evaluate the admission trend year over year. 
       
       SELECT 
              DATE_FORMAT(admission_date, '%Y-%m') AS year_to_month,
              COUNT(*) AS total_admissions
       FROM admissions
       WHERE admission_date IS NOT NULL
       GROUP BY year_to_month
       ORDER BY year_to_month;

-- END
















     










