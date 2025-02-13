USE MISCOMPANY;



CREATE TABLE Department_T
(
   Dep_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   Dep_name VARCHAR(10) NOT NULL,
   Manager_ID INT NOT NULL,
   FOREIGN KEY (Manager_ID) REFERENCES Employee_T(Emp_SIN) ON UPDATE CASCADE,
   Manager_assgnDate DATE NOT NULL CHECK (OrderDate::text ~ '^\d{4}-\d{2}-\d{2}$')
);

/*

CREATE TABLE Department_T
(
   Dep_ID SERIAL PRIMARY KEY,
   Dep_name VARCHAR(10) NOT NULL,
   Manager_ID INT NOT NULL,
   CONSTRAINT fk_Manager FOREIGN KEY (Manager_ID) REFERENCES Employee_T(Emp_ID) ON UPDATE CASCADE,
   Manager_assgnDate DATE NOT NULL
);

*/