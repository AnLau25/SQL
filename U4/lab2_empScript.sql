USE MISCOMPANY;



CREATE TABLE Employee_T
(
   Emp_SIN INT NOT NULL AUTO_INCREMENT PRIMARY KEY,--serial cause postgre does not support AUTO_I
   Emp_firstName VARCHAR(21) NOT NULL,
   Emp_midInit CHAR(1) NOT NULL,
   Emp_lastName VARCHAR(51) NOT NULL,
   Emp_bDate DATE NOT NULL CHECK (OrderDate::text ~ '^\d{4}-\d{2}-\d{2}$'),
   --Emp_bDate date NOT NULL [Postgre ensures that format]
   Emp_address VARCHAR(51) NOT NULL,
   Emp_gender ENUM('F', 'M', 'N')NOT NULL,
   --Emp_gender CHAR(1) NOT NULL CHECK (Emp_gender IN ('F', 'M', 'N'))
   Emp_salary DECIMAL(5,0),
   Dep_ID INT NOT NULL
   CONSTRAINT fk_Dep FOREIGN KEY (Dep_ID) REFERENCES Department_T(Dep_ID) ON UPDATE CASCADE
);

/*
CREATE TABLE Employee_T
(
   Emp_SIN SERIAL PRIMARY KEY,
   Emp_firstName VARCHAR(21) NOT NULL,
   Emp_midInit CHAR(1) NOT NULL,
   Emp_lastName VARCHAR(51) NOT NULL,
   Emp_bDate DATE NOT NULL,
   Emp_address VARCHAR(51) NOT NULL,
   Emp_gender CHAR(1) NOT NULL CHECK (Emp_gender IN ('F', 'M', 'N')),
   Emp_salary DECIMAL(5,0),
   Dep_ID INT NOT NULL
   CONSTRAINT fk_Dep FOREIGN KEY (Dep_ID) REFERENCES Department_T(Dep_ID) ON UPDATE CASCADE
);
*/
/*Doin it for her!*/