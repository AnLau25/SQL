/*
    PostgreSQL
    Manager (manager_no, name, address, specialization, salary)
    Employee (emp_no, name, address, rank, salary) 
    Project_assignment (proj_no, emp_no, duration) 
    Project (Proj_no, manager_no, name, location, budget) 
*/

--Show the names and salaries of managers who are managing projects with employees of rank “beginner” in ascending order of salary. 
SELECT name, salary FROM Manager
INNER JOIN Project ON Project.manager_no = Manager.manager_no --EXISTS is also an option since we dont need to display all the employees 
WHERE Project.proj_no IN (SELECT DISTINCT(proj_no) FROM Project_assignment -- WHERE EXISTS (SELECT * FROM Project_assignment [...]) cheks if at least one employee in the project of rank begginer
                  INNER JOIN Employee ON Employee.emp_no = Project_assignment.emp_no
                  WHERE Employee.rank='beginner')
ORDER BY Manager.salary ASC;

--Show the names and salaries of managers who are in charge of projects having more than 20 employees.
SELECT name, salary FROM Manager
INNER JOIN Project ON Project.manager_no = Manager.manager_no
WHERE Project.proj_no IN (SELECT proj_no FROM Project_assignment
                          GROUP BY proj_no
                          HAVING COUNT(emp_no)>20);



