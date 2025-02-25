/*Count Costumer transaction*/
SELECT COUNT (DISTINCT CUSTOMER.C_ID) FROM CUSTOMER
INNER JOIN TRANSACTION ON TRANSACTION.C_ID = CUSTOMER.C_ID
WHERE CUSTOMER.C_ID IN TRANSACTION;

/*Oldest travel agent*/
SELECT name FROM TRAVEL_AGENT 
ORDER BY age DESC LIMIT 1;

/*--Count Costumer transaction>1000 per agent*/
SELECT COUNT (number) FROM TRANSACTION
JOIN TRAVEL_AGENT ON TRAVEL_AGENT.TA_no = TRANSACTION.TA_no
WHERE TRANSACTION.amount_paid>1000
GROUP BY TRAVEL_AGENT.TA_no;

/*--Display the names and ages of the travel agents who have arranged journeys for customer “John Smith”, in descending order of age*/
SELECT DISTINCT name, age FROM TRAVEL_AGENT 
WHERE TA_no IN(
    SELECT TA_no FROM TRANSACTION
    WHERE C_ID IN(
        SELECT C_ID FROM CUSTOMER
        WHERE name='John Smith'))
ORDER BY age DESC;

/*--Display the names and ages of the travel agents who have arranged journeys for customer “John Smith”, in descending order of age*/
SELECT DISTINCT name, age FROM TRAVEL_AGENT 
JOIN TRANSACTION ON TRANSACTION.TA_no = TRAVEL_AGENT.TA_no
JOIN CUSTOMER ON CUSTOMER.C_ID = TRANSACTION.C_ID
WHERE CUSTOMER.name='John Smith'
ORDER BY age DESC;

/*--f.	Display the age of travel agents who have arranged journeys for customer “John Smith” to “Ottawa”. (Use a subquery.)*/