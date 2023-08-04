DELIMITER //
CREATE FUNCTION calcular_total_ventas(sucursal_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(monto) INTO total FROM ventas WHERE id_sucursal = sucursal_id;
    IF total IS NULL THEN
        SET total = 0;
    END IF;
    RETURN total;
END;
//
DELIMITER ;
DELIMITER //
CREATE FUNCTION calcular_total_compras(suc_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(precio) INTO total
    FROM compras
    WHERE id_pedido IN (SELECT id_pedido FROM pedido WHERE id_producto IN (SELECT id_producto FROM factura WHERE id_sucursal = suc_id));
    IF total IS NULL THEN
        SET total = 0;
    END IF;
    RETURN total;
END;
//
DELIMITER ;