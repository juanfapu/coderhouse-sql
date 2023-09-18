CREATE PROCEDURE SP_GET_InsertarEliminarRegistro(
    IN accion INT,
    IN tabla_nombre VARCHAR(50),
    IN id_registro INT
)
BEGIN
    IF accion = 1 THEN
        INSERT INTO tabla_nombre (campo1, campo2, campo3) VALUES (valor1, valor2, valor3);
    ELSEIF accion = 2 THEN
        DELETE FROM tabla_nombre WHERE id_registro = id_registro;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SP_GET_ActualizarPrecioProducto(
    IN producto_id INT,
    IN nuevo_precio DECIMAL(10, 2)
)
BEGIN
    UPDATE producto
    SET precio = nuevo_precio
    WHERE id_producto = producto_id;
END //
DELIMITER ;
CREATE TABLE log_ventas (
    id_log INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    accion VARCHAR(100) NOT NULL
);