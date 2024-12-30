USE MANAGERS;

SELECT Country_name, COUNT(*) AS Number_of_Persons FROM Persons
GROUP BY Country_name;

SELECT Country_name, COUNT(*) AS Number_of_Persons FROM Persons
GROUP BY Country_name ORDER BY Number_of_Persons DESC;

SELECT Country_name, AVG(Rating) AS Average_Rating FROM Persons
GROUP BY Country_name HAVING AVG(Rating) > 3.0;

SELECT Country_name FROM Persons WHERE Rating = (SELECT Rating FROM Persons WHERE Country_name = 'USA');

SELECT Country_name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);
