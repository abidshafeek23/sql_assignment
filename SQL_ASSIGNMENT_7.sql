USE MANAGERS;

ALTER TABLE Persons
ADD DOB DATE;

select * from persons;


SELECT Country_name, LEFT(Country_name, 3) AS First_Three_Chars
FROM Country;

DELIMITER $$
CREATE FUNCTION calculate_age(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    DECLARE today DATE;
    SET today = CURDATE();
    SET age = TIMESTAMPDIFF(YEAR, dob, today);
    IF TODAY < DATE_ADD(dob, INTERVAL age YEAR) THEN
        SET age = age - 1;
    END IF;
    RETURN age;
END$$
DELIMITER ;

SELECT * FROM Persons;

SELECT Id,Country_Name,LENGTH(Country_Name) AS Country_Name_Length
FROM Country;


SELECT Country_name, LEFT(Country_name, 3) AS First_Three_Chars
FROM Country;

SELECT Country_name, UPPER(Country_name) AS Uppercase_Name, LOWER(Country_name) AS Lowercase_Name
FROM Country;