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

-- Ejercicio 7: Muestra los primeros 5 identificadores de reservas y filas de asientos para proyecciones en un año específico, renombrando las columnas y ordenando por identificador

-- Ejercicio 8: Obtén los primeros 4 nombres de películas y correos de clientes que hicieron reservas para proyecciones antes de una fecha, renombrando las columnas y ordenando por fecha

-- Ejercicio 9: Extrae los primeros 3 nombres únicos de clientes que reservaron asientos en filas específicas, renombrando el nombre y ordenando por identificador

-- Ejercicio 10: Lista los primeros 5 nombres de salas y duraciones de películas proyectadas en un rango de fechas, renombrando las columnas y ordenando por duración descendente

-- Ejercicio 11: Muestra los primeros 4 correos únicos de clientes con nombre nulo que reservaron proyecciones, renombrando el correo y ordenando alfabéticamente

-- Ejercicio 12: Obtén los primeros 3 identificadores únicos de proyecciones y números de asientos reservados en una sala específica, renombrando las columnas y ordenando por identificador

-- Ejercicio 13: Extrae los primeros 5 nombres de películas y fechas de proyecciones para clientes con apellidos que comiencen con una letra, renombrando las columnas y ordenando por fecha

-- Ejercicio 14: Lista los primeros 4 nombres únicos de clientes que reservaron proyecciones de películas con duración en un rango, renombrando el nombre y ordenando por identificador

-- Ejercicio 15: Muestra los primeros 3 nombres de películas proyectadas para clientes con correos de un dominio específico, renombrando el nombre y ordenando por duración

-- Ejercicio 16: Obtén los primeros 5 identificadores de reservas y filas de asientos para proyecciones que no sean de ciertas películas, renombrando las columnas y ordenando por identificador

-- Ejercicio 17: Extrae los primeros 4 nombres de salas y fechas de proyecciones para clientes con correos que terminen en un patrón, renombrando las columnas y ordenando por fecha

-- Ejercicio 18: Lista los primeros 3 nombres únicos de clientes que reservaron proyecciones de películas con duración mayor a un valor, renombrando el nombre y ordenando por identificador

-- Ejercicio 19: Muestra los primeros 5 nombres de películas y números de asientos para reservas hechas por clientes con apellido en un grupo, renombrando las columnas y ordenando por número de asiento

-- Ejercicio 20: Obtén los primeros 4 correos únicos de clientes que reservaron proyecciones en un rango de fechas, renombrando el correo y ordenando alfabéticamente
