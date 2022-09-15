USE world;

SELECT country.Name, country.Population AS country_population, city.Name, SUM(city.Population) AS city_population, 
	CONCAT(FORMAT(SUM(city.Population * 100) / country.Population, 2), '%') AS percent_urban
FROM country
	INNER JOIN city on country.code = city.countryCode
GROUP BY country.Code
ORDER BY SUM(city.Population) / country.Population desc;

SELECT Name, Language, IsOfficial, Percentage, SUM(Percentage)
FROM country AS n
	INNER JOIN countryLanguage AS g on n.Code = g.CountryCode
WHERE IsOfficial = "F"
GROUP BY n.Code
HAVING SUM(Percentage) >= 50
ORDER BY Name, Language;

