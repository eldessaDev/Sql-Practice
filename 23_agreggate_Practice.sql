USE cinema_booking_system;

SHOW TABLES;
SELECT * FROM bookings;
SELECT * FROM customers;
SELECT * FROM films;
SELECT * FROM reserved_seat;
SELECT * FROM rooms;
SELECT * FROM screenings;
SELECT * FROM seats; 


-- count()
SELECT count(*) FROM customers;
SELECT count(Last_name) FROM customers;
SELECT count(first_name) FROM customers;

SELECT count(*) FROM customers
WHERE last_name =  'Smith';

SELECT count(*) FROM customers
WHERE first_namE IS NULL;

-- sum() only sum numeric columns
SELECT * FROM rooms;

SELECT sum(no_seats) FROM rooms;

SELECT count(id) FROM screenings;

SELECT sum(no_seats) FROM rooms
WHERE id > 1;

-- min(), max()
SELECT max(length_min) FROM films;

SELECT min(length_min) FROM films;

-- avg()
SELECT * FROM films;
SELECT avg(length_min) AS Movie_Length_Avg FROM films;

SELECT avg(length_min) AS Movie_Length_Avg FROM films
WHERE length_min > 120;

-- Practice count, sum, min, max, avg
SELECT count(b.customer_id) FROM bookings b
INNER JOIN customers c ON c.id = b.customer_id
WHERE c.id = 10;

SELECT f.name, count(*) AS Screening_october2022 FROM screenings s
INNER JOIN films f ON f.id = s.film_id
WHERE f.name  = 'Blade Runner 2049'
AND s.start_time BETWEEN '2022-10-01' AND '2022-10-31 23:59:59.999999';

SELECT f.name, count(*) AS Screening_october2022 FROM screenings s
INNER JOIN films f ON f.id = s.film_id
WHERE f.name  = 'Blade Runner 2049' AND month(s.start_time) = 10 AND year(s.start_time) = 2022;

SELECT count(DISTINCT(b.customer_id)) FROM bookings b
INNER JOIN screenings s ON s.id = b.screening_id
WHERE s.start_time  BETWEEN '2022-10-01' AND '2022-10-31 23:59:59.999999';


-- group by
SELECT * FROM bookings;

SELECT count(*) FROM bookings;

SELECT customer_id, count(*) FROM bookings
GROUP BY customer_id;

SELECT customer_id, screening_id, count(*) FROM bookings
GROUP BY customer_id, screening_id
ORDER BY customer_id;

SELECT f.name, s.start_time, c.first_name, c.last_name, count(b.id) FROM films f
JOIN screenings s ON f.id = s.film_id
JOIN bookings b ON s.id = b.screening_id
JOIN customers c ON c.id = b.customer_id
GROUP BY f.name, c.last_name, c.first_name, s.start_time
ORDER BY s.start_time;

-- HAVING
SELECT * FROM bookings;
SELECT customer_id, screening_id, count(*) FROM bookings
GROUP BY customer_id, screening_id
HAVING customer_id = 10;

SELECT * FROM bookings;
SELECT b.customer_id, b.screening_id, count(*) FROM bookings b
JOIN screenings s ON s.id = b.screening_id 
WHERE year(s.start_time) = 2022
GROUP BY customer_id, screening_id
HAVING customer_id = 10;


SELECT b.customer_id, s.* FROM bookings b 
JOIN screenings s ON b.screening_id = s.id
WHERE b.customer_id = 10;

-- Practice GROUP BY, HAVING
SELECT b.customer_id, count(*) FROM bookings b
JOIN reserved_seat rs ON b.id = rs.booking_id
GROUP BY b.customer_id
ORDER BY customer_id;

SELECT f.name, f.length_min, count(s.id) FROM films f 
JOIN screenings s ON s.film_id =  f.id
GROUP BY f.name
HAVING f.length_min > 120;

SELECT f.name, f.length_min, count(s.id) FROM films f 
JOIN screenings s ON s.film_id =  f.id
WHERE month(s.start_time) = 1 AND year(s.start_time) = 2023 AND f.length_min > 120
GROUP BY f.name;

SELECT b.customer_id, b.screening_id, count(*) AS no_seats FROM bookings b
JOIN reserved_seat rs ON rs.booking_id = b.id
GROUP BY b.customer_id, b.screening_id
ORDER BY b.customer_id;

-- Practice Grok
USE cinema_booking_system;

SHOW TABLES;
SELECT * FROM bookings;
SELECT * FROM customers;
SELECT * FROM films;
SELECT * FROM reserved_seat;
SELECT * FROM rooms;
SELECT * FROM screenings;
SELECT * FROM seats; 


-- Ejercicio 1: Cuenta el número total de reservas por cliente, mostrando el nombre y el conteo, ordenado por conteo descendente
SELECT c.first_name, count(b.customer_id) AS Total_Bookings FROM customers c
JOIN bookings b ON c.id = b.customer_id
GROUP BY c.first_name
ORDER BY Total_Bookings
LIMIT 20;

-- Ejercicio 2: Suma la duración total de las películas proyectadas en cada sala, mostrando el nombre de la sala y la suma
SELECT r.name AS Movie_Name, count(f.length_min) AS Total_Duration FROM rooms r 
JOIN screenings s ON r.id = s.room_id
JOIN films f ON f.id = s.film_id
GROUP BY r.name
ORDER BY Total_Duration
LIMIT 10;

-- Ejercicio 3: Encuentra la duración mínima de películas proyectadas en cada sala, mostrando el nombre de la sala
SELECT r.name AS Room_Name, min(f.length_min) AS Min_Duration FROM  rooms r
JOIN screenings s ON s.room_id = r.id
JOIN films f ON s.film_id = f.id
GROUP BY r.name
ORDER BY Min_Duration
LIMIT 10;

-- Ejercicio 4: Encuentra la duración máxima de películas proyectadas en cada sala, mostrando el nombre de la sala
SELECT r.name AS Room_Name, max(f.length_min) AS Max_Duration FROM rooms r 
JOIN screenings s ON s.room_id  = r.id
JOIN films f ON s.film_id = f.id
GROUP BY r.name
ORDER BY Max_Duration
LIMIT 5;

-- Ejercicio 5: Calcula el promedio de duración de películas por sala, mostrando el nombre de la sala
SELECT r.name AS Room_Name, avg(f.length_min) AS Length_Average FROM rooms r
JOIN screenings s ON s.room_id = r.id
JOIN films f ON f.id = s.film_id
GROUP BY r.name
ORDER BY Length_Average
LIMIT 3;

-- Ejercicio 6: Cuenta las reservas por mes en 2022, mostrando el mes y el conteo, ordenado por mes

-- Ejercicio 7: Suma el número total de asientos reservados por reserva, mostrando el identificador de reserva


-- Ejercicio 8: Encuentra la duración mínima de películas proyectadas antes de una fecha, agrupadas por sala


-- Ejercicio 9: Encuentra la duración máxima de películas con reservas, agrupadas por cliente


-- Ejercicio 10: Calcula el promedio de asientos reservados por reserva, mostrando el identificador


-- Ejercicio 11: Cuenta las proyecciones por película, mostrando el nombre y el conteo, con más de 5 proyecciones


-- Ejercicio 12: Suma las duraciones de películas por mes en 2022, mostrando el mes


-- Ejercicio 13: Encuentra la duración mínima de películas por sala con más de 2 proyecciones


-- Ejercicio 14: Encuentra la duración máxima de películas por cliente con más de 1 reserva

-- Ejercicio 15: Calcula el promedio de duración de películas por mes en 2022 con más de 10 proyecciones


-- Ejercicio 16: Cuenta las reservas por cliente con apellidos que contengan un patrón, ordenado por conteo


-- Ejercicio 17: Suma las duraciones de películas por sala con proyecciones después de una fecha


-- Ejercicio 18: Encuentra la duración mínima de películas por cliente con reservas en un rango de fechas


-- Ejercicio 19: Calcula el promedio de asientos reservados por reserva con más de 2 asientos


-- Ejercicio 20: Cuenta las proyecciones por sala con duración promedio superior a 110 minutos












