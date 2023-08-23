use la_comilona;
DELIMITER //

CREATE PROCEDURE ProcessPedidos()
BEGIN
    DECLARE is_empty BOOLEAN;

    -- Verificar si la tabla PEDIDOS está vacía
    SELECT COUNT(*) = 0 INTO is_empty FROM pedidos;

    -- Iniciar una transacción
    START TRANSACTION;
    -- Desactivar restricciones de clave externa
    SET FOREIGN_KEY_CHECKS = 0;

    -- Eliminar registros si no está vacía.
    IF NOT is_empty THEN
        DELETE FROM pedidos LIMIT 2;
        SELECT "Se eliminaron registros de la tabla PEDIDOS." AS Message;
    ELSE
        -- Insertar registros si está vacía.
        INSERT INTO pedidos (id_producto, nombre_cliente, telefono_cliente, direccion_cliente)
        VALUES 
            (1, 'Juan Pérez', '555-1234', 'Calle Principal 123'),
            (2, 'María Gómez', '444-5678', 'Avenida Norte 456'),
            (3, 'Pedro López', '333-9087', 'Calle Sur 789'),
            (4, 'Ana Ramírez', '222-6754', 'Avenida Este 321'),
            (5, 'Carlos Castro', '666-4321', 'Calle Oeste 654');
        SELECT "Se insertaron 5 registros en la tabla PEDIDOS." AS Message;
    END IF;

    -- Volver a activar restricciones de clave externa
    SET FOREIGN_KEY_CHECKS = 1;

    -- Confirmar o deshacer la transacción
    -- COMMIT; 
    -- ROLLBACK;
END;
//

DELIMITER ;
DELIMITER //

CREATE PROCEDURE ProcessPedidosWithSavepoints()
BEGIN
    DECLARE is_empty BOOLEAN;

    -- Verificar si la tabla PEDIDOS está vacía
    SELECT COUNT(*) = 0 INTO is_empty FROM pedidos;

    -- Iniciar una transacción
    START TRANSACTION;
    -- Desactivar restricciones de clave externa
    SET FOREIGN_KEY_CHECKS = 0;

    -- Eliminar registros si no está vacía.
    IF NOT is_empty THEN
        DELETE FROM pedidos LIMIT 2;
        SELECT "Se eliminaron registros de la tabla PEDIDOS." AS Message;
    ELSE
        -- Insertar registros si está vacía.
        INSERT INTO pedidos (id_producto, nombre_cliente, telefono_cliente, direccion_cliente)
        VALUES 
            (1, 'Juan Pérez', '555-1234', 'Calle Principal 123'),
            (2, 'María Gómez', '444-5678', 'Avenida Norte 456'),
            (3, 'Pedro López', '333-9087', 'Calle Sur 789'),
            (4, 'Ana Ramírez', '222-6754', 'Avenida Este 321'),
            (5, 'Carlos Castro', '666-4321', 'Calle Oeste 654'),
            (6, 'Laura Hernández', '777-9876', 'Avenida 1 987'),
            (7, 'Luis Martínez', '888-2345', 'Calle 2 234'),
            (8, 'Andrea Sánchez', '999-7654', 'Avenida 3 567');
        SELECT "Se insertaron 8 registros en la tabla PEDIDOS." AS Message;

        -- Agregar savepoint después del registro #4
        SAVEPOINT savepoint_after_4;

        -- Insertar 4 registros adicionales
        INSERT INTO pedidos (id_producto, nombre_cliente, telefono_cliente, direccion_cliente)
        VALUES 
            (9, 'José Rodríguez', '333-1111', 'Calle Tranquila 234'),
            (10, 'Diana Romero', '222-9999', 'Avenida del Bosque 789'),
            (11, 'Fernando López', '555-4321', 'Calle del Mar 876'),
            (12, 'Sofía Martínez', '444-9999', 'Avenida del Sol 345');

        -- Agregar savepoint después del registro #8
        SAVEPOINT savepoint_after_8;

        -- Eliminar el savepoint después del registro #4
        -- RELEASE SAVEPOINT savepoint_after_4;

        -- Confirmar o deshacer la transacción
        -- COMMIT; 
        -- ROLLBACK;
    END IF;

    -- Volver a activar restricciones de clave externa
    SET FOREIGN_KEY_CHECKS = 1;
END;
//

DELIMITER ;
