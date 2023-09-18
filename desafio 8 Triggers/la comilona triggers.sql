CREATE TABLE log_ventas (
    id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    accion VARCHAR(100) NOT NULL
);
CREATE TABLE log_compras (
    id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    accion VARCHAR(100) NOT NULL
);
DELIMITER //

CREATE TRIGGER TR_ADD_RegistroLogVentas BEFORE INSERT ON ventas
FOR EACH ROW
BEGIN
    INSERT INTO log_ventas (usuario, fecha, hora, accion)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME());
END //

CREATE TRIGGER TR_ADD_RegistroLogCompras AFTER DELETE ON compras
FOR EACH ROW
BEGIN
    INSERT INTO log_compras (usuario, fecha, hora, accion)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME());
END //
DELIMITER ;