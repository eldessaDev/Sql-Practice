USE cinema_booking_system;

SHOW TABLES;
SELECT * FROM bookings;
SELECT * FROM customers;
SELECT * FROM films;
SELECT * FROM reserved_seat;
SELECT * FROM rooms;
SELECT * FROM screenings;
SELECT * FROM seats;


-- Ejercicio 1: Obtén los primeros 5 nombres de películas y nombres de salas para proyecciones que comiencen en un mes específico, renombrando las columnas y ordenando por fecha de inicio
SELECT f.name AS movie_name, r.name AS room_name FROM films f
INNER JOIN screenings s ON f.id = s.film_id
INNER JOIN rooms r ON   r.id = s.room_id
WHERE start_time LIKE '2022-01%' 
ORDER BY s.start_time ASC
LIMIT 5;

-- Ejercicio 2: Lista los primeros 4 nombres de clientes con apellidos que contengan un patrón y hayan reservado asientos en una sala específica, renombrando el nombre y ordenando por apellido
SELECT DISTINCT c.first_name AS customer_name, c.last_name AS customer_last_name,r.name FROM customers c
INNER JOIN bookings b ON c.id  = b.customer_id
INNER JOIN screenings s ON s.id = b.screening_id
INNER JOIN rooms r ON r.id = s.room_id
WHERE last_name LIKE '%son' AND r.name = 'Chaplin'
ORDER BY last_name 
LIMIT 4;



-- Ejercicio 3: Muestra los primeros 3 nombres únicos de películas proyectadas en salas con un número de asientos en un rango, renombrando el nombre y ordenando por duración


-- Ejercicio 4: Obtén los primeros 5 correos electrónicos únicos de clientes que reservaron proyecciones de películas con duración mayor a cierto valor, renombrando el correo y ordenando por correo


-- Ejercicio 5: Extrae los primeros 4 nombres de salas y fechas de proyecciones para películas cuyo nombre contenga un patrón y la proyección sea después de una fecha, renombrando las columnas y ordenando por fecha


-- Ejercicio 6: Lista los primeros 3 nombres únicos de clientes que reservaron asientos en proyecciones de una sala específica o películas de duración en un rango, renombrando el nombre y ordenando por identificador de cliente


-- Ejercicio 7: Muestra los primeros 5 identificadores de reservas y filas de asientos para proyecciones en un año específico, renombrando las columnas y ordenando por identificador de reserva


-- Ejercicio 8: Obtén los primeros 4 nombres de películas y correos de clientes que hicieron reservas para proyecciones antes de una fecha, renombrando las columnas y ordenando por fecha de proyección


-- Ejercicio 9: Extrae los primeros 3 nombres únicos de clientes que reservaron asientos en filas específicas y para películas con nombres que terminen en un patrón, renombrando el nombre y ordenando por identificador


-- Ejercicio 10: Lista los primeros 5 nombres de salas y duraciones de películas proyectadas en un rango de fechas, renombrando las columnas y ordenando por duración descendente


-- Ejercicio 11: Muestra los primeros 4 correos únicos de clientes con nombre nulo que reservaron proyecciones de películas con duración menor a un valor, renombrando el correo y ordenando alfabéticamente


-- Ejercicio 12: Obtén los primeros 3 identificadores únicos de proyecciones y números de asientos reservados en una sala específica, renombrando las columnas y ordenando por identificador de proyección


-- Ejercicio 13: Extrae los primeros 5 nombres de películas y fechas de proyecciones para clientes con apellidos que comiencen con una letra, renombrando las columnas y ordenando por fecha


-- Ejercicio 14: Lista los primeros 4 nombres únicos de clientes que reservaron asientos en proyecciones de películas con duración en un rango y sala con cierto número de asientos, renombrando el nombre y ordenando por identificador


-- Ejercicio 15: Muestra los primeros 3 nombres de películas proyectadas en salas cuyo nombre contenga un patrón y para clientes con correos de un dominio específico, renombrando el nombre y ordenando por duración


-- Ejercicio 16: Obtén los primeros 5 identificadores de reservas y filas de asientos para proyecciones que no sean de ciertas películas, renombrando las columnas y ordenando por identificador de reserva


-- Ejercicio 17: Extrae los primeros 4 nombres de salas y fechas de proyecciones para clientes con correos que terminen en un patrón y proyecciones después de una fecha, renombrando las columnas y ordenando por fecha


-- Ejercicio 18: Lista los primeros 3 nombres únicos de clientes que reservaron asientos en proyecciones de películas con duración mayor a un valor o en una sala específica, renombrando el nombre y ordenando por identificador


-- Ejercicio 19: Muestra los primeros 5 nombres de películas y números de asientos para reservas hechas por clientes con apellido en un grupo, renombrando las columnas y ordenando por número de asiento


-- Ejercicio 20: Obtén los primeros 4 correos únicos de clientes que reservaron proyecciones en un rango de fechas y asientos en filas específicas, renombrando el correo y ordenando alfabéticamente
