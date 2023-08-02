use la_comilona;
create view primera as
select id_cliente,nombre_cliente,direccion_cliente from clientes;
create view segunda as
select id_sucursal,monto,forma_pago from factura;
create view tercera as
select id_reserva,id_sucursal from reservas;
create view cuarta as
select id_cuenta_corrientes,id_venta,id_compra,monto_total from movimientos_financieros;
create view quinta as
select id_pedido,telefono_cliente from pedido;
 