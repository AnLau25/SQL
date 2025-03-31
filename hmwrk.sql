/*Count Costumer transaction*/
SELECT COUNT (DISTINCT CUSTOMER.C_ID) FROM CUSTOMER
INNER JOIN TRANSACTION ON TRANSACTION.C_ID = CUSTOMER.C_ID
WHERE CUSTOMER.C_ID IN TRANSACTION;

/*Oldest travel agent*/
SELECT name FROM TRAVEL_AGENT 
ORDER BY age DESC LIMIT 1;

/*List the total number of transactions for each travel agent. Consider only those transactions where the amount paid exceeds 1000.*/
SELECT TA_no, COUNT (number) FROM TRANSACTION
WHERE amount_paid>1000
GROUP BY TA_no;

/*Display the names and ages of the travel agents who have arranged journeys for customer “John Smith”, in descending order of age. (Use a subquery.)*/
SELECT DISTINCT name, age FROM TRAVEL_AGENT 
WHERE TA_no IN(
    SELECT TA_no FROM TRANSACTION
    WHERE C_ID IN(
        SELECT C_ID FROM CUSTOMER
        WHERE name='John Smith'
    )
)
ORDER BY age DESC;


/*Display the names and ages of the travel agents who have arranged journeys for customer “John Smith”, in descending order of age. (Do not use a subquery.)*/
SELECT DISTINCT name, age FROM TRAVEL_AGENT 
JOIN TRANSACTION ON TRANSACTION.TA_no = TRAVEL_AGENT.TA_no
JOIN CUSTOMER ON CUSTOMER.C_ID = TRANSACTION.C_ID
WHERE CUSTOMER.name='John Smith'
ORDER BY age DESC;



/*Display the age of travel agents who have arranged journeys for customer “John Smith” to “Ottawa”. (Use a subquery.)*/
SELECT DISTINCT age FROM TRAVEL_AGENT 
WHERE TA_no IN(
    SELECT TA_no FROM TRANSACTION
    WHERE C_ID IN(
        SELECT C_ID FROM CUSTOMER
        WHERE name='John Smith' AND CUSTOMER.destination = 'Ottawa'
    )
);


/*Display the age of travel agents who have arranged journeys for customer “John Smith” to “Ottawa”. (Do not use a subquery.)*/
SELECT DISTINCT age FROM TRAVEL_AGENT 
JOIN TRANSACTION ON TRANSACTION.TA_no = TRAVEL_AGENT.TA_no
JOIN CUSTOMER ON CUSTOMER.C_ID = TRANSACTION.C_ID
WHERE CUSTOMER.name='John Smith'AND CUSTOMER.destination = 'Ottawa';


/*Display the names and salaries of all travel agents who have not arranged journeys for customer “John Smith”, in ascending order of salary.*/
SELECT name, salary FROM TRAVEL_AGENT 
WHERE TA_no NOT IN(
    SELECT TA_no FROM TRANSACTION
    WHERE C_ID IN(
        SELECT C_ID FROM CUSTOMER
        WHERE name='John Smith'))
ORDER BY salary ASC;

/*--Display the names of travel agents who have five or more transactions.*/
SELECT TRAVEL_AGENT.name FROM TRAVEL_AGENT
INNER JOIN TRANSACTION ON TRANSACTION.TA_no = TRAVEL_AGENT.TA_no
GROUP BY TRAVEL_AGENT.TA_no, TRAVEL_AGENT.name
HAVING COUNT(TRANSACTION.number) >= 5;

/*--Display the names of all travel agents who have arranged at least ten journeys to “Ottawa”.*/
SELECT TRAVEL_AGENT.name FROM TRAVEL_AGENT
INNER JOIN TRANSACTION ON TRANSACTION.TA_no = TRAVEL_AGENT.TA_no
INNER JOIN CUSTOMER ON CUSTOMER.C_ID = TRANSACTION.C_ID
WHERE CUSTOMER.destination = 'Ottawa'
GROUP BY TRAVEL_AGENT.TA_no, TRAVEL_AGENT.name
HAVING COUNT(TRANSACTION.number) >= 10;


RealtorAgent (realtor_no, name, age, address, commission_percentage)
Customer (C_ID, name, property_id, property_address, description, property_tax, property_value)
Transaction (realtor_no, C_ID, property_id, price_sold, date_sold)

/*Consider the following Realtor database with three relations. Write SQL statements for creating a view called AgentsOfTheYear that will display the name and address of realtors who have sold a total amount of 5 million dollars’ worth of properties in 2021.*/
CREATE VIEW AgentsOfTheYear AS
SELECT RealtorAgent.name, RealtorAgent.address FROM RealtorAgent
INNER JOIN Transaction ON Transaction.realtor_no = RealtorAgent.realtor_no
WHERE YEAR(Transaction.date_sold) = 2021
GROUP BY RealtorAgent.name, RealtorAgent.address
HAVING SUM(Transaction.price_sold) = 5000000;

/*Write SQL query to list the names of instructors who have taught COMP 378 but not COMP 418 during the following sessions: Winter 2020 and Winter 2021.*/
SELECT DISTINCT name FROM Instructor
WHERE instructor_no IN (
    SELECT instructor_no 
    FROM Registration 
    WHERE (session LIKE 'Winter 2020%' OR session LIKE 'Winter 2021%') 
    AND course_no = 'COMP378' 
)
AND instructor_no NOT IN (
    SELECT instructor_no 
    FROM Registration 
    WHERE (session LIKE 'Winter 2020%' OR session LIKE 'Winter 2021%') 
    AND course_no = 'COMP418'
);/*Might have been qualified before and not anymore*/

/*
a.	Write a SELECT SQL query to list the numbers and names of all employees with a salary greater than 66000 who are assigned to projects, 
    and list the project name and location they are assigned to as well as the corresponding hours worked for each project. 
    Your list should be sorted by employee name.
*/
SELECT Employee.emp-no, Employee.name, Project.name, Project.location, ProjAssigned.worked-hours FROM Employee
INNER JOIN ProjAssigned ON Employee.emp-no = ProjAssigned.emp-no
JOIN Project ON ProjAssigned.proj-no = Project.proj_no
WHERE Employee.salary > 66000
ORDER BY Employee.name ASC;

CREATE UNIQUE INDEX EmpNo_PK ON Employee(emp-no);
CREATE UNIQUE INDEX ProjNo_PK ON Project(proj_no);
CREATE UNIQUE INDEX Assignements_PK ProjAssigned(emp-no, proj-no); 
CREATE INDEX Names_FK ON Employee(name);
CREATE INDEX Salary_FK ON Employee(salary);

/*
For each treatment performed in the past two weeks, list the physicians performing the 
treatment (grouped by treatment) and the number of times each physician performed that 
particular treatment on that particular day. 
Order the list by treatment ID and by reverse chronological order for each treatment ID.
*/
Treatement{Treatement_ID(Treatment_Number, Treatment_Name)}
Physician{Physician_ID, Pager_Number, Specialty, Care_Center_Name}
Treatement_Record{Treatement_ID, Physician_ID, Patient_ID, Treatment_Date, Treatement_Time, Results}

SELECT 
    Treatement_Record.Treatement_ID,
    Treatementt.Treatment_Name,
    Treatement_Record.Treatment_Date,
    Treatement_Record.Physician_ID,
    COUNT(*) AS Treatment_Count
FROM Treatement_Record
JOIN Treatement ON Treatement_Record.Treatement_ID = Treatement.Treatement_ID
WHERE Treatement_Record.Treatment_Date >= CURRENT_DATE - INTERVAL '14 DAY'
GROUP BY Treatement_Record.Treatement_ID, Treatement.Treatment_Name, Treatement_Record.Treatment_Date, Treatement_Record.Physician_ID
ORDER BY Treatement_Record.Treatement_ID ASC, Treatement_Record.Treatment_Date DESC;

CREATE INDEX TDate_FK ON Treatment_Reccord(Treatment_Date);
CREATE INDEX TID_FK ON Treatement_Record(Treatement_ID);
CREATE INDEX PID_FK ON Treatment_Reccord(Physician_ID);
CREATE INDEX Treatement_Group ON Treatement_Record(Treatement_ID, Treatment_Date, Physician_ID);

/*Module 3*/
CREATE DATABASE RVH;

CREATE TABLE Patients(
   pid SERIAL PRIMARY KEY,
   name VARCHAR NOT NULL,
   address VARCHAR NOT NULL,
   telephone VARCHAR(10) NOT NULL,
   care_centre_id INT NOT NULL,
   CONSTRAINT fkp_care_center FOREIGN KEY (care_centre_id) REFERENCES Care_centres(cid) ON UPDATE CASCADE
);

CREATE TABLE Care_centres(
   cid SERIAL PRIMARY KEY,
   name VARCHAR NOT NULL,
   location VARCHAR NOT NULL,
   nurse_charge_id INT NOT NULL,
   CONSTRAINT fk_nurse_charge FOREIGN KEY (nurse_charge_id) REFERENCES Nurses(nid) ON UPDATE CASCADE
);

CREATE TABLE Treatments(
   tid SERIAL PRIMARY KEY,
   treatment_name VARCHAR(255) NOT NULL,
   date_aplied DATE NOT NULL,
   patient_id INT NOT NULL,
   physician_id INT NOT NULL,
   CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES Patients(pid) ON UPDATE CASCADE,
   CONSTRAINT fk_physician FOREIGN KEY (physician_id) REFERENCES Physicians(phid) ON UPDATE CASCADE
);

CREATE TABLE Nurses(
   nid SERIAL PRIMARY KEY,
   name VARCHAR NOT NULL,
   certificate_type VARCHAR NOT NULL,
   telephone VARCHAR(10) NOT NULL,
   salary INT NOT NULL,
   care_centre_id INT NOT NULL
);

ALTER TABLE Nurses
ADD CONSTRAINT fkn_care_center 
FOREIGN KEY (care_centre_id) 
REFERENCES Care_centres(cid) ON UPDATE CASCADE;

CREATE TABLE Physicians(
   phid SERIAL PRIMARY KEY,
   pager_number SERIAL NOT NULL UNIQUE,
   name VARCHAR NOT NULL,
   specialization VARCHAR NOT NULL,
   salary INT NOT NULL
);

/*----------------------------------------------*/

CREATE UNIQUE INDEX tid ON Treatments (tid);

CREATE UNIQUE INDEX pid ON Patients (pid);
CREATE INDEX patient_id ON Treatments (patient_id);

CREATE UNIQUE INDEX nid ON Nurses (nid);
CREATE INDEX nurse_charge_id ON Care_centres (nurse_charge_id);

CREATE UNIQUE INDEX phid ON Physicians (phid);
CREATE INDEX physician_id ON Treatments (physician_id);

CREATE UNIQUE INDEX cid ON Care_centres (cid);
CREATE INDEX nurse_care_centre ON Nurses (care_centre_id);
CREATE INDEX patient_centre_id ON Patients (care_centre_id);

/*----------------------------------------------*/

INSERT INTO Nurses (name, certificate_type, telephone, salary, care_centre_id) VALUES
('Alice Johnson', 'RN', '1234567890', 60000, 1),
('Bob Smith', 'RN', '9876543210', 45000, 2),
('Clara Lee', 'RN', '5554443333', 50000, 3),
('Emily Davis', 'RN', '2345678901', 62000, 1),
('Michael Brown', 'RN', '3456789012', 59000, 1),
('Jessica Wilson', 'RN', '4567890123', 61000, 1),
('Robert Kowalski', 'RN', '5554443333', 50000, 3);

INSERT INTO Care_centres (name, location, nurse_charge_id) VALUES
('Sunshine Medical Center', 'New York, NY', 1),
('Healing Touch Clinic', 'Los Angeles, CA', 2),
('Wellness Haven', 'Chicago, IL', 3),
('Saint Catherine Clinic', 'San Francisco, CA', 7);

INSERT INTO Patients (name, address, telephone, care_centre_id) VALUES
   ('John Doe', '123 Elm Street', '1234567890', 1),
   ('Jane Smith', '456 Oak Avenue', '9876543210', 2),
   ('Alice Johnson', '789 Pine Road', '5678901234', 3);

INSERT INTO Physicians (pager_number, name, specialization, salary) VALUES
(1001, 'Dr. Emily Carter', 'Cardiologist', 180000),
(1002, 'Dr. Liam Nguyen', 'Pediatrician', 160000),
(1003, 'Dr. Sophia Martinez', 'Neurologist', 200000);

INSERT INTO Treatments (treatment_name, date_aplied, patient_id, physician_id) VALUES
('Physical Therapy', '2025-03-15', 1, 1),
('Chemotherapy', '2025-03-20', 2, 2),
('Heart Surgery', '2025-03-25', 3, 3),
('Physical Therapy', '2025-04-25', 3, 3);

/*----------------------------------------------*/

CREATE VIEW NURSE_SUMMARY (D, C, TOTAL_S, AVERAGE_S) AS
SELECT cid, COUNT(*), SUM(salary), AVG(salary)
FROM Care_centres
INNER JOIN Nurses ON Nurses.care_centre_id = Care_centres.cid
WHERE certificate_type LIKE 'RN%'
GROUP BY cid;

/*----------------------------------------------*/
CREATE VIEW PATIENT_SUMMARY (Pid, Pn, CCN, NiC, Tid, Tn, PhyId, Date) AS
SELECT pid, patients.name, care_centres.name, Nurses.name, tid, treatment_name, physician_id, date_aplied 
FROM patients
INNER JOIN Treatments ON Treatments.patient_id = patients.pid
INNER JOIN Care_centres ON Care_centres.cid = patients.care_centre_id
INNER JOIN Nurses ON Nurses.nid = Care_centres.nurse_charge_id
ORDER BY pid, tid;