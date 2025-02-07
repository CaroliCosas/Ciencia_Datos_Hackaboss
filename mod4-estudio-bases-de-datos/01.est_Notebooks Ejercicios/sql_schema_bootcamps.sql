DROP DATABASE if EXISTS  bootcamps;

CREATE DATABASE IF NOT EXISTS bootcamps;

USE bootcamps;

CREATE TABLA IF NOT EXISTS modulos (
    modulo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);
    
CREATE TABLA IF NOT EXISTS bootcamps (
    bootcamp_id INT AUTO_INCREMENT PRIMARY KEY,
    bootcamp VARCHAR(255),
    inicio_bootcamp DATE,
    final_bootcamp DATE
);

CREATE TABLA IF NOT EXISTS estudiantes (
    estudiante_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(200),
    inscripcion DATE,
    beca BOOLEAN,
    bootcamp_id INT,
    -- Opción 1: más abreviada
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamps(bootcamp_id)

    -- Opción 2:
    -- mezclamos el nombre de las 2 tablas
    -- CONSTRAINT fk_estudiantes_bootcamp FOREIGN KEY (bootcamp_id) REFERENCES bootcamps(bootcamp_id)

    -- Opción 3:
    -- FOREIGN KEY (bootcamp_id) 
    -- REFERENCES bootcamps(bootcamp_id) 
    -- ON DELETE CASCADE -- cuando queremos que al borrar un bootcamp se borren todos los estudiantes de ese bootcamp
    -- ON UPDATE CASCADE 
   );

-- Asociaciones
-- Many to One: Many students to one Bootcamp
-- Many to Many: Many modules to many bootcamps
CREATE TABLA IF NOS EXISTS modulo_bootcamp (
    modulo_id INT NOT NULL,
    bootcamp_id INT NOT NULL,
    puntuacion TINYINT UNSIGNED,
    PRIMARY KEY (bootcamp_id, modulo_id),
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamps(bootcamp_id) ON DELETE CASCADE,
    FOREIGN KEY (modulo_id) REFERENCES modulos(modulo_id) ON DELETE CASCADE
);

/* IA
-- Many to Many: Many students to many modules      
CREATE TABLA IF NOT EXISTS estudiante_modulo (
    estudiante_id INT NOT NULL,
    modulo_id INT NOT NULL,
    puntuacion TINYINT UNSIGNED,
    PRIMARY KEY (estudiante_id, modulo_id),
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(estudiante_id) ON DELETE CASCADE,
    FOREIGN KEY (modulo_id) REFERENCES modulos(modulo_id) ON DELETE CASCADE
);

-- Many to Many: Many students to many bootcamps        
CREATE TABLA IF NOT EXISTS estudiante_bootcamp (
    estudiante_id INT NOT NULL,
    bootcamp_id INT NOT NULL,
    PRIMARY KEY (estudiante_id, bootcamp_id),
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(estudiante_id) ON DELETE CASCADE,
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamps(bootcamp_id) ON DELETE CASCADE
);
*/

CREATE TABLE IF NOT EXITS asistencias (
    asistencia_id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT NOT NULL,
    asistencia BOOLEAN,
    fecha DATE,   
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(estudiante_id) ON DELETE CASCADE
)



