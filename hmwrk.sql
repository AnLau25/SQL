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

