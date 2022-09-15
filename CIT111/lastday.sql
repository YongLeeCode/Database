USE world;

SELECT Name, Population
FROM country
WHERE Population <= 5000000
ORDER BY Population desc;

SELECT Language AS "Unique Language", COUNT(Language) AS COUNT
FROM countrylanguage
GROUP BY Language
ORDER BY language;

SELECT continent, COUNT(continent)
FROM country
GROUP BY continent;

SELECT co.Name AS Country, FORMAT(co.Population / COUNT(ci.Name), 0) AS AVG_Population_of_cities
FROM country AS co
	INNER JOIN city AS ci on co.code = ci.countryCode
GROUP BY co.Name
ORDER BY SUM(ci.Population) / COUNT(ci.Name) desc;

SELECT co.Name AS Country, AVG(ci.population) AS AVG_Population_of_cities 
FROM country AS co
	INNER JOIN city AS ci on co.code = ci.countryCode
GROUP BY co.Name;