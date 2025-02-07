DROP DATABASE IF EXISTS bootcamps;

CREATE DATABASE IF NOT EXISTS bootcamps;

USE bootcamps;

CREATE TABLE IF NOT EXISTS modulos (
    modulo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS bootcamps (
    bootcamp_id INT AUTO_INCREMENT PRIMARY KEY,
    bootcamp VARCHAR(255),
    inicio_bootcamp DATE,
    final_bootcamp DATE
 );

CREATE TABLE IF NOT EXISTS estudiantes (
    estudiante_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(200),
    inscripcion DATE, 
    beca BOOLEAN,
    bootcamp_id INT,
    -- Opción 1:
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamps(bootcamp_id)

    -- Opción 2:
    -- CONSTRAINT fk_estudiantes_bootcamps FOREIGN KEY (bootcamp_id) REFERENCES bootcamps(bootcamp_id)

    -- Opción 3:
    -- FOREIGN KEY (bootcamp_id) 
    -- REFERENCES bootcamps(bootcamp_id) 
    -- ON DELETE CASCADE 
    -- ON UPDATE CASCADE
);

-- Asociaciones
-- Many To One: Many students to one Bootcamp
-- Many To Many: Many modules to Many Bootcamps
CREATE TABLE IF NOT EXISTS modulo_bootcamp(
    bootcamp_id INT NOT NULL,
    modulo_id INT NOT NULL,
    puntuacion TINYINT UNSIGNED,
    PRIMARY KEY (bootcamp_id, modulo_id),
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamps(bootcamp_id) ON DELETE CASCADE,
    FOREIGN KEY (modulo_id) REFERENCES modulos(modulo_id) ON DELETE CASCADE
);
-- Opción 2:
/*
CREATE TABLE IF NOT EXISTS modulo_bootcamp2(
    id INT AUTO_INCREMENT PRIMARY KEY,
    bootcamp_id INT NOT NULL,
    modulo_id INT NOT NULL,
    puntuacion TINYINT UNSIGNED,
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamps(bootcamp_id) ON DELETE CASCADE,
    FOREIGN KEY (modulo_id) REFERENCES modulos(modulo_id) ON DELETE CASCADE,
    UNIQUE (bootcamp_id, modulo_id) -- Evita combinaciones duplicadas
);
*/

CREATE TABLE IF NOT EXISTS asistencias (
    asistencia_id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT NOT NULL,
    asistencia BOOLEAN,
    fecha DATE,
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(estudiante_id) ON DELETE CASCADE
);