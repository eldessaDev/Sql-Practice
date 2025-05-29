USE cinema_booking_system;

SHOW TABLES;
SELECT * FROM bookings;
SELECT * FROM customers;
SELECT * FROM films;
SELECT * FROM reserved_seat;
SELECT * FROM rooms;
SELECT * FROM screenings;
SELECT * FROM seats; 

-- Ejercicio 1: Obtén los primeros 5 nombres de películas y fechas de proyección que comiencen en un mes específico, renombrando las columnas y ordenando por fecha
SELECT f.name AS movie_name, s.start_time FROM films f 
INNER JOIN screenings s ON f.id = s.film_id
WHERE s.start_time LIKE '2022-01%'
ORDER BY s.start_time
LIMIT 5; 

-- Ejercicio 2: Lista los primeros 4 nombres de clientes con apellidos que contengan un patrón y hayan hecho reservas, renombrando el nombre y ordenando por apellido
SELECT c.first_name AS customer_name, c.last_name FROM customers c
INNER JOIN bookings b ON c.id = b.customer_id
WHERE first_name LIKE '%an%'
ORDER BY c.last_name ASC
LIMIT 4;

-- Ejercicio 3: Muestra los primeros 3 nombres únicos de películas proyectadas en salas con un número de asientos en un rango, renombrando el nombre y ordenando por duración
SELECT DISTINCT f.name AS movie_name, f.length_min FROM films f 
INNER JOIN screenings s ON f.id = s.film_id
WHERE s.room_id IN(SELECT id FROM rooms WHERE no_seats BETWEEN 22 AND 72)
ORDER BY f.length_min
LIMIT 3;

-- Ejercicio 4: Obtén los primeros 5 correos electrónicos únicos de clientes que reservaron proyecciones de películas con duración mayor a cierto valor, renombrando el correo y ordenando por correo
SELECT DISTINCT c.email AS client_email FROM Customers c 
INNER JOIN bookings b ON c.id = b.customer_id
WHERE b.screening_id IN(SELECT id FROM screenings WHERE film_id IN(SELECT id FROM films WHERE length_min > 110))
ORDER BY c.email
LIMIT 5;

-- Ejercicio 5: Extrae los primeros 4 nombres de salas y fechas de proyecciones para películas cuyo nombre contenga un patrón, renombrando las columnas y ordenando por fecha
SELECT r.name AS screening_room, s.start_time AS show_time FROM rooms r 
INNER JOIN screenings s ON r.id = s.room_id
WHERE s.film_id IN(SELECT id FROM films WHERE name LIKE '%O%')
ORDER BY s.start_time DESC
LIMIT 4;

-- Ejercicio 6: Lista los primeros 3 nombres únicos de clientes que reservaron proyecciones de películas de duración en un rango, renombrando el nombre y ordenando por identificador
SELECT DISTINCT c.id, c.first_name AS client_name FROM customers c
INNER JOIN bookings b ON c.id = b.customer_id
WHERE b.screening_id IN (SELECT id FROM screenings WHERE film_id IN (SELECT id FROM films WHERE length_min BETWEEN 90 AND 110)) 
ORDER BY c.id ASC 
LIMIT 3;

-- Ejercicio 7: Muestra los primeros 5 identificadores de reservas y identificadores de asientos reservados, renombrando las columnas y ordenando por identificador de reserva.
SELECT b.id AS Booking_id, rs.id AS Seat_id FROM bookings b
INNER JOIN reserved_seat rs ON b.id = rs.booking_id
WHERE b.id BETWEEN 1 AND 50
ORDER BY b.id ASC
LIMIT 5;

-- Ejercicio 8: Obtén los primeros 4 nombres de películas y fechas de proyecciones con identificadores en un grupo, renombrando las columnas y ordenando por identificador.
SELECT f.name AS Movie_Name, s.start_time AS Show_Date FROM films f
INNER JOIN screenings s ON f.id = s.film_id
WHERE s.id IN(1,2,3,4,5,6,7,8,9,10)
ORDER BY f.id
LIMIT 4;

-- Ejercicio 9: Extrae los primeros 3 nombres únicos de clientes que reservaron asientos en filas específicas, renombrando el nombre y ordenando por identificador
SELECT DISTINCT c.id AS Client_id , c.first_name AS Client_Name FROM customers c
INNER JOIN bookings b ON c.id = b.customer_id
WHERE b.id IN (SELECT booking_id FROM reserved_seat WHERE seat_id IN (SELECT id FROM seats WHERE seat_row IN ('A', 'B'))) 
ORDER BY c.id ASC 
LIMIT 3;

-- Ejercicio 10: Lista los primeros 5 nombres de salas y fechas de proyecciones en un rango de fechas, renombrando las columnas y ordenando por fecha.
SELECT r.name AS RoomName, s.start_time AS ShowDate FROM rooms r 
INNER JOIN screenings s ON r.id = s.room_id 
WHERE s.start_time BETWEEN '2022-02-01' AND '2022-04-30' 
ORDER BY s.start_time DESC 
LIMIT 5;

-- Ejercicio 11: Muestra los primeros 4 correos únicos de clientes con nombre nulo que hicieron reservas, renombrando el correo y ordenando alfabéticamente
SELECT DISTINCT c.email AS Client_Email FROM customers c
INNER JOIN bookings b ON c.id = b.customer_id
WHERE c.first_name IS NULL 
ORDER BY c.email ASC
LIMIT 4;

-- Ejercicio 12: Obtén los primeros 3 identificadores únicos de proyecciones y nombres de salas para proyecciones en un rango de identificadores, renombrando las columnas y ordenando por identificador
SELECT DISTINCT s.id AS Screening_id, r.name AS Room_Name FROM Screenings s 
INNER JOIN Rooms r ON r.id = s.room_id
WHERE s.id BETWEEN 1 AND 30 
ORDER BY s.id DESC
LIMIT 3;

-- Ejercicio 13: Extrae los primeros 5 nombres de películas y fechas de proyecciones para proyecciones con identificadores en un grupo, renombrando las columnas y ordenando por fecha
SELECT f.name AS Movie_Name, s.start_time AS Show_time FROM films f
INNER JOIN screenings s ON f.id = s.film_id
WHERE s.id IN(1,5,10,15,20)
ORDER BY s.start_time DESC
LIMIT 5;

-- Ejercicio 14: Lista los primeros 4 nombres únicos de clientes que hicieron reservas con identificadores en un rango, renombrando el nombre y ordenando por identificador
SELECT DISTINCT c.id AS Client_id, c.first_name AS Client_Name FROM customers c
INNER JOIN bookings b ON c.id = b.customer_id
WHERE b.id BETWEEN 10 AND 40
ORDER BY c.id DESC
LIMIT 4;

-- Ejercicio 15: Muestra los primeros 3 nombres de películas proyectadas en salas con nombres que contengan un patrón, renombrando el nombre y ordenando por identificador de proyección
SELECT f.name AS Movie_Name FROM films f 
INNER JOIN screenings s ON f.id = s.film_id
WHERE s.room_id IN(1,2) AND s.room_id IN(SELECT id FROM rooms WHERE NAME LIKE '%ick%')
ORDER BY s.id DESC
LIMIT 3;

-- Ejercicio 16: Obtén los primeros 5 identificadores de reservas y identificadores de asientos reservados para reservas con identificadores no en un grupo, renombrando las columnas y ordenando por identificador
SELECT b.id AS Reservation_id, rs.id AS Reserved_Seat_id FROM bookings b
INNER JOIN reserved_seat rs ON b.id = rs.booking_id
WHERE b.id NOT IN(1,2,3,4,5)
ORDER BY b.id ASC
LIMIT 5;

-- Ejercicio 17: Extrae los primeros 4 nombres de salas y fechas de proyecciones para proyecciones con fechas en un rango, renombrando las columnas y ordenando por fecha
SELECT r.name AS Room_Name, s.start_time AS Show_time FROM rooms r 
INNER JOIN screenings s ON r.id = s.room_id
WHERE s.start_time BETWEEN '2022-06-01' AND '2022-09-30'
ORDER BY s.start_time DESC
LIMIT 4;

-- Ejercicio 18: Lista los primeros 3 nombres únicos de clientes que hicieron reservas para proyecciones con identificadores en un rango, renombrando el nombre y ordenando por identificador
SELECT DISTINCT c.id AS Client_id, c.first_name AS  Client_Name FROM Customers c
INNER JOIN bookings b ON c.id = b.customer_id
WHERE b.screening_id BETWEEN 10 AND 30
ORDER BY c.id ASC
LIMIT 3;

-- Ejercicio 19: Muestra los primeros 5 nombres de películas y fechas de proyecciones para proyecciones con identificadores en un grupo, renombrando las columnas y ordenando por fecha
SELECT f.name AS Movie_name, s.start_time AS Show_Time FROM films f 
INNER JOIN screenings s ON f.id = s.film_id
WHERE s.id IN(1,2,3,4,5,6,7,8,9,20)
ORDER BY s.start_time
LIMIT 5;

-- Ejercicio 20: Obtén los primeros 4 correos únicos de clientes que hicieron reservas para proyecciones con identificadores en un grupo, renombrando el correo y ordenando alfabéticamente
SELECT DISTINCT c.email AS EmailAddress 
FROM customers c 
INNER JOIN bookings b ON c.id = b.customer_id 
WHERE b.screening_id IN (1, 10, 20, 30) 
ORDER BY c.email ASC 
LIMIT 4;