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
-- ¿Que modulo tiene mas puntuación de media y cual tiene menos puntuación de media?
-- ¿Qué bootcamp tiene mayor puntuación de media?
-- ¿Qué bootcamp tiene mas asistencias y cual tiene menos asistencias? Los bootcamps sin estudiantes no cuentan.
-- ¿Qué día tiene el mayor número de asistencias y cual tiene el menor número de asistencias?
-- ¿Cuales bootcamps le dan 10 al modulo de **Machine Learning**?
-- Muestra los 10 estudiantes que tenga más asistencias (_subqueries_).


-- Las respuestas serán diferentes debido a la aleatoriedad de los datos.
