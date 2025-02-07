SELECT * FROM bootcamps.asistencias;
-- Usando la BBDD que acabamos de crear responde a las siguientes preguntas:
-- ¿Que bootcamp tiene más estudiantes?
use bootcamps;
select 
b.bootcamp as nombre_bootcamp, 
count(e.estudiante_id) as numero_estudiantes
from bootcamps b
inner join estudiantes e on e.bootcamp_id = b.bootcamp_id
group by b.bootcamp
order by count(e.estudiante_id) desc; -- limit 1 para quedarse solo con el primero
-- equivalente a value_counts de pandas
-- inner join, group by, count, order by desc

-- ¿Cuantos bootcamps no tienen estudiantes?



-- ¿Que estudiantes tienen más asistencias y cuales tiene menos?

SELECT 
a.estudiante_id, count(a.estudiante_id)
FROM
asistencias as a
WHERE a.asistencia = 'TRUE'
GROUP BY a.estudiante_id
ORDER BY count(a.estudiante_id) desc
-- LIMIT 1;

-- con sum()
select a.estudiante_id, sum(a.asistencia)
from asistencias a
group by a.estudiante_id
order by sum(a.asistencia) ;


-- ¿Que modulo tiene mas puntuación de media y cual tiene menos puntuación de media?

-- modulo_bootcamp tiene las puntuaciones entre modulo y bootcamp, podemos hacer un group by por modulo
-- modulo_bootcamp group by modulo_id avg(puntuacion)


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





-- ¿Qué bootcamp tiene mas asistencias y cual tiene menos asistencias? Los bootcamps sin estudiantes no cuentan.

-- bootcamps join  con estudiantes y join con asistencia group by bootcamp count bootcamp



SELECT bootcamps.bootcamp, sum(asistencias.asistencia)
FROM bootcamps
INNER JOIN estudiantes ON estudiantes.bootcamp_id = bootcamps.bootcamp_id
INNER JOIN asistencias ON asistencias.estudiante_id = estudiantes.estudiante_id
WHERE asistencia = 1;
group by bootcamps.bootcamp
ORDER BY sum(asistencias.asistencia) desc;

-- Emilio José Fernández Fernández 15:12
SELECT b.bootcamp, 
       COUNT(a.asistencia_id) AS total_asistencias
FROM bootcamps b
JOIN estudiantes e ON b.bootcamp_id = e.bootcamp_id
JOIN asistencias a ON e.estudiante_id = a.estudiante_id
WHERE e.bootcamp_id IS NOT NULL
GROUP BY b.bootcamp_id
HAVING COUNT(a.asistencia_id) > 0
ORDER BY total_asistencias DESC;

Alan Sastre 15:23
select bootcamps.bootcamp, sum(asistencias.asistencia)
from bootcamps
inner join estudiantes on estudiantes.bootcamp_id = bootcamps.bootcamp_id
inner join asistencias on asistencias.estudiante_id = estudiantes.estudiante_id
group by bootcamps.bootcamp
order by sum(asistencias.asistencia) desc;




-- ¿Qué fecha tiene el mayor número de asistencias y cual tiene el menor número de asistencias?

-- Ceci
use bootcamps;
select a.fecha, sum(a.asistencia)
from asistencias a
group by a.fecha
order by sum(a.asistencia) desc;


-- Panchi De Benito (Madrid) 15:31
select sum(asistencias.asistencia) as  total_asistencias,
fecha
--mejor poner primero la fecha para que la tabla sea más clara
select fecha, sum(asistencias.asistencia) as  total_asistencias
from asistencias
group by fecha
order by total_asistencias desc;







-- ¿Cuales bootcamps le dan 10 al modulo de **Machine Learning**?

-- Muestra los 10 estudiantes que tenga más asistencias (_subqueries_).

SELECT 
    estudiante_id, 
    total_asistencias
FROM (
    SELECT 
        a.estudiante_id, 
        COUNT(a.asistencia) AS total_asistencias
    FROM 
        asistencias AS a
    WHERE 
        a.asistencia = '1'
    GROUP BY 
        a.estudiante_id
) AS subquery
ORDER BY 
    total_asistencias DESC
LIMIT 10;


1274	154
1819	154
2882	154
340	153
2224	153
2829	153
2508	153
2214	153
2029	153
3820	153


SELECT 
    a.estudiante_id, 
    COUNT(a.asistencia) AS total_asistencias
FROM 
    asistencias AS a
WHERE 
    a.asistencia = '1'
GROUP BY 
    a.estudiante_id
ORDER BY 
    total_asistencias DESC
LIMIT 10;

select * from estudiantes where estudiante_id in (
select estudiante_id from asistencias group by estudiante_id order by sum(asistencia) desc 
) limit 10;

Alan Sastre 16:15
select * from estudiantes where estudiante_id in (
 select estudiante_id from asistencias group by estudiante_id order by sum(asistencia) desc limit 10
 );
 
 
 select e.estudiante_id, sum(asistencia) from estudiantes e
 join asistencias a on e.estudiante_id = a.estudiante_id
 group by e.estudiante_id
 order by sum(a.asistencia) DESC
 limit 10;
 
1274	154
1819	154
2882	154
340	153
2224	153
2829	153
2508	153
2214	153
2029	153
3820	153
 




-- Las respuestas serán diferentes debido a la aleatoriedad de los datos.