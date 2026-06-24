
-- Solve the below SQL problems using the Famous Paintings & Museum dataset:



-- 1) Fetch all the paintings which are not displayed on any museums?
 

 SELECT *

 FROM work 

 WHERE museum_id IS NULL



-- Identify paintings that are not currently displayed in any museum.
-- Helps discover unutilized artworks and potential collection management gaps.



-- 2) Are there museuems without any paintings?



select * from museum m
	where not exists (select * from work w
					 where w.museum_id=m.museum_id)



-- Identify paintings that are not currently displayed in any museum.
-- Helps discover unutilized artworks and potential collection management gaps.



-- 3) How many paintings have an asking price of more than their regular price? 



SELECT work_id

FROM product_size

WHERE sale_price > regular_price;


-- Identify paintings where asking price is higher than regular price.
-- Helps analyze premium-valued artworks and potential high-value collection assets.



-- 4) Identify the paintings whose asking price is less than 50% of its regular price


SELECT work_id 

FROM product_size 

WHERE sale_price < (regular_price*0.5);




-- 5) Which canva size costs the most?
-- 1115

SELECT * FROM canvas_size 
WHERE size_id = (
SELECT TOP 1 size_id
FROM product_size
ORDER BY sale_price DESC
)


-- Identify the canvas size with the highest cost.
-- Helps analyze premium canvas categories and factors influencing pricing.



-- 6) Delete duplicate records from work, product_size, subject and image_link tables

delete from work 
	where work_id not in (select min(work_id)
						from work
						group by work_id );

	delete from product_size 
	where work_id not in (select min(work_id)
						from product_size
						group by work_id, size_id );

	delete from subject 
	where work_id not in (select min(work_id)
						from subject
						group by work_id, subject );

	delete from image_link 
	where work_id not in (select min(work_id)
						from image_link
						group by work_id );

-- Identify and remove duplicate records from artwork-related tables.
-- Improves data accuracy, consistency, and reliability of analysis.



-- 7) Identify the museums with invalid city information in the given dataset


SELECT * FROM museum


SELECT city FROM museum

WHERE city LIKE '[0-9]%' 


-- Identify museums with invalid city information.
-- Helps improve location data accuracy and maintain reliable analysis.

 
-- 8) Museum_Hours table has 1 invalid entry. Identify it and remove it.
 
	delete from museum_hours 
	where museum_id not in (select min(museum_id)
						from museum_hours
						group by museum_id, day );



-- Identify and remove the invalid record from Museum_Hours table.
-- Ensures accurate museum operating hours and improves data quality.


-- 9) Fetch the top 10 most famous painting subject



SELECT * FROM (

SELECT s.subject,COUNT(*) AS total_count_of_subject, 

RANK() OVER(ORDER BY COUNT(*) DESC)  AS subject_rank

FROM subject s 

JOIN work w ON w.work_id = s.work_id 

GROUP BY s.subject
) t

WHERE subject_rank<=10



-- Identify the top 10 most frequent painting subjects.
-- Helps understand popular artwork themes and optimize exhibition and marketing strategies.




-- 10) Identify the museums which are open on both Sunday and Monday. Display museum name, city.		 


select distinct m.name as museum_name, m.city, m.state,m.country
	from museum_hours mh 
	join museum m on m.museum_id=mh.museum_id
	where day='Sunday'
	and exists (select 1 from museum_hours mh2 
				where mh2.museum_id=mh.museum_id 
			    and mh2.day='Monday');



-- Identify museums operating on both Sunday and Monday.
-- Helps analyze museum availability and optimize visitor engagement strategies.



-- 11) How many museums are open every single day?


SELECT * FROM museum 
WHERE museum_id IN (
SELECT museum_id
FROM museum_hours 
GROUP BY museum_id 
HAVING COUNT(day) = 7 
)


-- Identify museums that are open every day of the week.
-- Helps analyze museum accessibility, visitor strategy, and revenue opportunities.



-- 12) Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum)



SELECT TOP 5 mu.name, COUNT(w.work_id) AS county 

FROM museum mu 

JOIN work w ON mu.museum_id = w.museum_id

GROUP BY mu.name 

ORDER BY county DESC


-- Identify the top 5 museums based on the number of paintings.
-- Helps analyze museums with the largest artwork collections and business opportunities.



-- 13) Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist)


SELECT TOP 5 a.full_name, COUNT(w.work_id) AS county 

FROM artist a 

JOIN work w ON a.artist_id = w.artist_id 

GROUP BY a.full_name  

ORDER BY county DESC


-- Identify the top 5 artists based on the number of paintings created.
-- Helps analyze artist representation and optimize exhibition and marketing strategies.




-- 14) Display the 3 least popular canva sizes



SELECT * FROM canvas_size 

WHERE size_id  IN (
SELECT TOP 3  p.size_id

FROM work w 

JOIN product_size p ON w.work_id = p.work_id

GROUP BY p.size_id

ORDER BY count(*) ASC

)

-- Identify the 3 least popular canvas sizes based on usage frequency.
-- Helps analyze low-demand products and improve inventory management strategies.





-- 15) Which museum has the most no of most popular painting style?


  SELECT TOP 1 m.name,w.style, COUNT(w.style) AS county
  FROM museum m
  JOIN work w ON m.museum_id = w.museum_id
  GROUP BY m.name,w.style 
  ORDER BY county DESC


  -- Identify the museum with the highest number of paintings from the most popular style.
  -- Helps analyze collection strengths and improve exhibition strategies.



-- 16) Identify the artists whose paintings are displayed in multiple countries


SELECT full_name FROM artist 
WHERE artist_id IN (

SELECT w.artist_id
FROM museum m
JOIN work w ON m.museum_id = w.museum_id 
GROUP BY w.artist_id 
HAVING COUNT(DISTINCT(m.COUNTRY)) > 1 

) 


-- Identify artists whose paintings are displayed across multiple countries.
-- Helps analyze globally represented artists and optimize collection strategies.




-- 17) Display the country and the city with most no of museums. Output 2 seperate columns to mention the city and country. If there are multiple value, seperate them with comma.




WITH city_cte AS (

SELECT city, COUNT(*) AS total_museum_in_city
FROM museum 
GROUP BY city

),
           country_cte AS (

			SELECT country, COUNT(*) AS total_museum_in_country
			FROM museum 
			GROUP BY country
)

			SELECT 
			(SELECT STRING_AGG(city,',') 
			FROM city_cte 
			WHERE total_museum_in_city = (SELECT MAX(total_museum_in_city) FROM city_cte)) AS city,  


(
	SELECT STRING_AGG(country,',')
	FROM country_cte 
	WHERE total_museum_in_country = (SELECT MAX(total_museum_in_country) FROM country_cte)) AS country
 




 -- Identify the country and city with the highest number of museums.
-- Helps analyze major art hubs and cultural concentration.



	
-- 18) Identify the artist and the museum where the most expensive and least expensive painting is placed. Display the artist name, sale_price, painting name, museum name, museum city and canvas label

SELECT * FROM museum

SELECT * FROM (
SELECT TOP 1 w.work_id,m.name , a.full_name,MAX(p.sale_price) AS price, 'Most Expensive' AS Label
FROM work w 
JOIN product_size p ON w.work_id = p.work_id
JOIN museum m ON w.museum_id = m.museum_id
JOIN artist a ON a.artist_id = w.artist_id
GROUP BY w.work_id, m.name, a.full_name
ORDER BY price DESC
) AS P
UNION ALL 

SELECT * FROM (

SELECT TOP 1 w.work_id,m.name , a.full_name,MAX(p.sale_price) AS price, 'Least Expensive' AS label
FROM work w 
JOIN product_size p ON w.work_id = p.work_id
JOIN museum m ON w.museum_id = m.museum_id
JOIN artist a ON a.artist_id = w.artist_id
GROUP BY w.work_id, m.name, a.full_name
ORDER BY price ASC
) AS q;



-- Identify the highest and lowest priced paintings with artist and museum details.
-- Helps analyze artwork valuation and collection strategy.



-- 19) Which country has the 5th highest no of paintings?
 
 WITH CTE AS (
 SELECT m.country, COUNT(m.museum_id)  AS county, RANK() OVER(ORDER BY COUNT(*) DESC) AS ranking
 FROM museum m 
 JOIN work w ON m.museum_id = w.museum_id 
 GROUP BY m.country
 )
 SELECT *
 FROM CTE 
 WHERE ranking = 5



 -- Find the country ranking 5th based on total number of paintings.
-- Helps analyze global artwork distribution.



-- 20) Which are the 3 most popular and 3 least popular painting styles? 



SELECT * FROM (
SELECT TOP 3 style, COUNT(*) AS count, 'Least Popular' AS Category
FROM work 
GROUP BY style 
ORDER BY COUNT(*)
) AS least

UNION ALL
SELECT * FROM (
SELECT TOP 3 style , COUNT(*) AS  count, 'Most Popular' AS Category
FROM work 
GROUP BY style 
ORDER BY COUNT(*) DESC
) AS most



-- Identify the most and least popular painting styles.
-- Helps understand art trends and optimize exhibition planning.



-- 21) Which artist has the most no of Portraits paintings outside USA?. Display artist name, no of paintings and the artist nationality.


WITH CTE AS (
 SELECT a.full_name, COUNT(w.work_id) AS no_of_paintings,a.nationality
 FROM artist a
 JOIN work w ON a.artist_id = w.artist_id 
 JOIN subject s ON s.work_id = w.work_id 
 JOIN museum m ON m.museum_id = w.museum_id
 WHERE s.subject = 'Portraits' AND m.country != 'USA'
 GROUP BY a.full_name,a.nationality

 ) 

SELECT *
FROM CTE 
WHERE no_of_paintings = (SELECT MAX(no_of_paintings) from cte)
  





  -- Identify the artist with the highest number of portrait paintings outside USA.
-- Helps analyze internationally recognized artists and collection opportunities.






