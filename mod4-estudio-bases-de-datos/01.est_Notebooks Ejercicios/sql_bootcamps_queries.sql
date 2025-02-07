
-- Consultas SELECT

/*
- ¿Que bootcamp tiene más estudiantes?
- ¿Cuantos bootcamps no tienen estudiantes?
- ¿Que estudiantes tienen más asistencias y cuales tiene menos?
- ¿Que modulo tiene mas puntuación de media y cual tiene menos puntuación de media?
- ¿Qué bootcamp tiene mayor puntuación de media?
- ¿Qué bootcamp tiene mas asistencias y cual tiene menos asistencias? Los bootcamps sin estudiantes no cuentan.
- ¿Qué día tiene el mayor número de asistencias y cual tiene el menor número de asistencias?
- ¿Cuales bootcamps le dan 10 al modulo de **Machine Learning**?
- Muestra los 10 estudiantes que tenga más asistencias (_subqueries_).
*/

use bootcamps;

-- ¿Que bootcamp tiene más estudiantes?
select 
b.bootcamp as nombre_bootcamp, 
count(e.estudiante_id) as numero_estudiantes
from bootcamps b
inner join estudiantes e on e.bootcamp_id = b.bootcamp_id
group by b.bootcamp
order by count(e.estudiante_id) desc; -- limit 1 para quedarse solo con el primero

-- ¿Cuantos bootcamps no tienen estudiantes?
select 
b.bootcamp as nombre_bootcamp, 
count(e.estudiante_id) as numero_estudiantes
from bootcamps b
left join estudiantes e on e.bootcamp_id = b.bootcamp_id
group by b.bootcamp
having count(e.estudiante_id) = 0;

-- ¿Que estudiantes tienen más asistencias y cuales tiene menos?
-- mayor asistencia
select a.estudiante_id, sum(a.asistencia)
from asistencias a
group by a.estudiante_id
order by sum(a.asistencia) desc;
-- menor asistencia:
select a.estudiante_id, sum(a.asistencia)
from asistencias a
group by a.estudiante_id
order by sum(a.asistencia);


-- ¿Que modulo tiene mas puntuación de media y cual tiene menos puntuación de media?

SELECT 
    m.nombre,
    ROUND(AVG(mb.puntuacion), 1) AS puntuacion_media
FROM 
    modulos m
JOIN 
   modulo_bootcamp mb ON m.modulo_id = mb.modulo_id
GROUP BY 
    m.nombre
ORDER BY 
    puntuacion_media DESC;

-- ¿Qué bootcamp tiene mayor puntuación de media?

SELECT 
    b.bootcamp,
    ROUND(AVG(mb.puntuacion), 2) AS puntuacion_media
FROM 
    bootcamps b
JOIN 
   modulo_bootcamp mb ON b.bootcamp_id = mb.bootcamp_id
GROUP BY 
    b.bootcamp
ORDER BY 
    puntuacion_media DESC;

-- ¿Qué bootcamp tiene mas asistencias y cual tiene menos asistencias? Los bootcamps sin estudiantes no cuentan.

select bootcamps.bootcamp, sum(asistencias.asistencia)
from bootcamps
inner join estudiantes on estudiantes.bootcamp_id = bootcamps.bootcamp_id
inner join asistencias on asistencias.estudiante_id = estudiantes.estudiante_id
group by bootcamps.bootcamp
order by sum(asistencias.asistencia) desc;

-- ¿Qué fecha tiene el mayor número de asistencias y cual tiene el menor número de asistencias?
select fecha, sum(asistencias.asistencia) as total_asistencias
from asistencias
group by fecha
order by total_asistencias desc;


-- ¿Cuales bootcamps le dan 10 al modulo de **Machine Learning**?
select 
b.bootcamp
-- ,
-- m.nombre,
-- mb.puntuacion
FROM
modulos m
inner JOIN 
modulo_bootcamp mb on m.modulo_id = mb.modulo_id
INNER JOIN
bootcamps b on mb.bootcamp_id = b.bootcamp_id 
where
m.nombre = 'Machine Learning' and mb.puntuacion = 10;

-- Muestra los 10 estudiantes que tenga más asistencias (_subqueries_).
-- select dentro de select

select * from estudiantes where estudiante_id in (
 select estudiante_id from asistencias group by estudiante_id order by sum(asistencia) desc limit 10
);
     
     
/* AÑADIR EXPLAIN ANALYZE DELANTE PARA PROBAR
-> Limit: 10 row(s)  (actual time=22047..22047 rows=10 loops=1)
-> Sort: sum(a.asistencia) DESC, limit input to 10 row(s) per chunk  (actual time=22047..22047 rows=10 loops=1)
-> Stream results  (cost=524705 rows=7232) (actual time=2.93..2197...
*/
EXPLAIN select e.estudiante_id, sum(a.asistencia) from estudiantes e 
join asistencias a on e.estudiante_id = a.estudiante_id
group by e.estudiante_id
order by sum(a.asistencia) DESC
limit 10;

     
     
-- carolina
/* AÑADIR EXPLAIN ANALYZE DELANTE PARA PROBAR
-> Limit: 10 row(s)  (cost=120476..120476 rows=10) (actual time=19113..19113 rows=10 loops=1)
-> Sort: subquery.total_asistencias DESC, limit input to 10 row(s) per chunk  (cost=120476..120476 rows=10) (actual time=19113..19113 rows=10 loops=1)
...
*/
EXPLAIN SELECT 
    estudiante_id, 
    total_asistencias
FROM (
 SELECT 
        a.estudiante_id, 
        COUNT(a.asistencia) AS total_asistencias
    FROM 
        asistencias AS a
    WHERE 
        a.asistencia = 1
    GROUP BY 
        a.estudiante_id
) AS subquery
ORDER BY 
    total_asistencias DESC
LIMIT 10;
