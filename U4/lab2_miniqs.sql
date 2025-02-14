--q4
ALTER TABLE employee_t
ADD CONSTRAINT fk_Dep
FOREIGN KEY (dep_id)
REFERENCES department_T(dep_id)
ON UPDATE CASCADE;

UPDATE department_T
SET
    Dep_ID = 14
WHERE
    Dep_ID = 12;

--q5
SELECT COUNT (Emp_SIN) FROM employee_t
JOIN project_t ON employee_t.Dep_id = project_T.Dep_id
WHERE project_T.Proj_name = 'Mobile Banking';

--q6
SELECT department_T.Dep_name, COUNT(employee_t.Emp_SIN) FROM department_T
JOIN employee_t ON employee_t.Dep_id = department_T.Dep_id
WHERE employee_t.Emp_gender = 'F' AND employee_t.Emp_salary >= 27000
GROUP BY department_T.Dep_name;

--q7
CREATE VIEW DEPT_SUMMARY (D, C, TOTAL_S, AVERAGE_S)
AS SELECT EMPLOYEE_T.Dep_id, COUNT (*), SUM (emp_SALARY), AVG (emp_SALARY)
FROM EMPLOYEE_T, PROJECT_T
WHERE EMPLOYEE_T.Dep_id = project_T.Dep_id and proj_name like 'Mobile%'
GROUP BY EMPLOYEE_T.Dep_id;

--q8
--a) Si
SELECT * FROM DEPT_SUMMARY;
--b) Si, no hay tanata gente, pero podria funcionar si hubiese mas departamentos trabajando mobil
SELECT Department, total FROM DEPT_SUMMARY
WHERE TOTAL_S > 100000;--Pide or el departamento de mobil con mayor gasto en salarios
--c) Si, aunque no hay un depa 4. 
--En teoria da le depa y el avg de salario de todos los depas cuyo total> al total del depa 4 
SELECT department, AVERAGE_S FROM DEPT_SUMMARY
WHERE total > (SELECT total FROM DEPT_SUMMARY WHERE department=4);
--d) No, views con ⁡⁢⁢⁢GROUP BY⁡ no pueden ser auto updateadas
UPDATE DEPT_SUMMARY
SET D=3
WHERE D=4;
--e) No, views con ⁡⁢⁢⁢GROUP BY⁡ no pueden ser auto updateadas
DELETE FROM DEPT_SUMMARY
WHERE total > 2