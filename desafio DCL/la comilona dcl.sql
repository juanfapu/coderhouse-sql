-- Crear el usuario
CREATE USER 'usuario_lectura'@'localhost' IDENTIFIED BY '<contraseña>';

-- Otorgar permiso de lectura en todas las tablas
GRANT SELECT ON La_comilona.* TO 'usuario_lectura'@'localhost';

-- No permitir la eliminación de registros
REVOKE DELETE ON La_comilona.* FROM 'usuario_lectura'@'localhost';
-- Crear el usuario
CREATE USER 'usuario_modificacion'@'localhost' IDENTIFIED BY '<contraseña>';

-- Otorgar permiso de lectura, inserción y modificación en todas las tablas
GRANT SELECT, INSERT, UPDATE ON La_comilona.* TO 'usuario_modificacion'@'localhost';

-- No permitir la eliminación de registros
REVOKE DELETE ON La_comilona.* FROM 'usuario_modificacion'@'localhost';
