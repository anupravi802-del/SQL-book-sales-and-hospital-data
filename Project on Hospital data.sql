USE assignmentanswers;
SELECT * FROM hospital_data;
SHOW COLUMNS FROM hospital_data;

ALTER TABLE hospital_data
CHANGE COLUMN `ï»¿Hospital Name` Hospital_Name TEXT; 

DESCRIBE hospital_data; 

##1) find the total number of patients across all hospitals:
SELECT SUM( `Patients Count` ) AS Total_Patients
FROM hospital_data;

##2)Retrieve the average count of doctors available in each  hospital:
SELECT Hospital_Name, AVG(`Doctors Count`) AS Average_cont_of_doctors
FROM hospital_data
GROUP BY Hospital_Name; 

##3)Find the top 3 hospital departments that have the highest number of patients:
SELECT Department , MAX(`Patients Count`) AS Max_Patients
FROM hospital_data
GROUP BY Department 
ORDER BY Max_Patients DESC 
LIMIT 3; 

##4) Identify the hospital that recoreded the highest medical expenses:
SELECT Hospital_Name , MAX(`Medical Expenses`) AS Highest_medical_expenses
FROM hospital_data
GROUP BY Hospital_Name 
ORDER BY Highest_medical_expenses DESC
LIMIT 1;

##5) Calculate the average medical expenses per day for each hospital:
SELECT Hospital_Name,
AVG(`Medical Expenses` / NULLIF ( DATEDIFF( STR_TO_DATE( `Discharge Date`, '%d-%m-%Y'), STR_TO_DATE(`Admission Date`, '%d-%m-%Y')),0)
    ) AS Average_Expenses_Per_Day
FROM hospital_data
GROUP BY Hospital_Name
ORDER BY Average_Expenses_Per_Day DESC; 

##6)Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date:
SELECT 
    `Admission Date`,
    `Discharge Date`,
    DATEDIFF(
        STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
        STR_TO_DATE(`Admission Date`, '%d-%m-%Y')
    ) AS Hospital_Days
FROM hospital_data
ORDER BY Hospital_Days DESC LIMIT 3;

##7)Count the total number of patients treated in each city:
SELECT  DISTINCT Location , SUM( `Patients Count`) AS Toatl_no_of_Treated_in_each_city
FROM hospital_data
GROUP BY Location
ORDER BY Toatl_no_of_Treated_in_each_city  DESC ; 

##8)Calculate the average number of days patients spend in each department:
SELECT DISTINCT Department , 
AVG(NULLIF(DATEDIFF(STR_TO_DATE(`Discharge Date` , '%d-%m-%y'),
STR_TO_DATE(`Admission Date` , '%d-%m-%y')),0)) AS Average_no_of_days_patient_spent
FROM hospital_data
GROUP BY  Department
ORDER BY  Average_no_of_days_patient_spent DESC;

##9) Find the department with the least number of patients:
SELECT  DISTINCT Department ,MIN(`Patients Count`) AS Least_no_of_patients
FROM hospital_data 
GROUP BY Department
ORDER BY Least_no_of_patients LIMIT 2 ;

##10) Group the data by month and calculate the total medical expenses for each month: 
SELECT  
      DATE_FORMAT(
			STR_TO_DATE(`Admission Date` , '%d-%m-%y'),'%y-%m') AS Month,
            SUM(`Medical Expenses`) AS Total_Medical_Expenses
FROM hospital_data 
GROUP BY DATE_FORMAT(STR_TO_DATE(`Admission Date` , '%d-%m-%y'),'%y-%m')
ORDER BY  Total_Medical_Expenses  DESC;





   








