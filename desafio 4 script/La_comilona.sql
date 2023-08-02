create database La_comilona; 
use la_comilona;
create table sistema (
 id_permiso INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 usuario varchar (50) not null,
 contraseña varchar (20)
); 
INSERT INTO sistema (usuario, contraseña) VALUES
('usuario1', 'pass1234'),
('admin_2023', 'admin_pass'),
('john_doe', 'doe_password'),
('cool_guy87', 'secret123'),
('jenny_567', 'jenny_pass'),
('power_user99', 'strong_pass'),
('new_user2023', 'new_pass_2023'),
('security_ninja', 'ninja_pass'),
('dev_team_lead', 'dev_lead123'),
('sysadmin42', 'sys_pass_42');
create table sucursales (
id_sucursal INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre_sucursal VARCHAR(50) NOT NULL,
    telefono_sucursal VARCHAR(50) null,
    direccion_sucursal VARCHAR(50)
);
INSERT INTO sucursales (nombre_sucursal, telefono_sucursal, direccion_sucursal) VALUES
('Sucursal Central', '555-1234', 'Calle Principal 123'),
('Sucursal Norte', '444-5678', 'Avenida Norte 456'),
('Sucursal Sur', '333-9087', 'Calle Sur 789'),
('Sucursal Este', '222-6754', 'Avenida Este 321'),
('Sucursal Oeste', '666-4321', 'Calle Oeste 654'),
('Sucursal 1', '777-9876', 'Avenida 1 987'),
('Sucursal 2', '888-2345', 'Calle 2 234'),
('Sucursal 3', '999-7654', 'Avenida 3 567');
create table empleados (
id_empleado INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre_empleado VARCHAR(50) NULL,
    telefono_empleado VARCHAR(50) null,
    direccion_empleado VARCHAR(60)
 );
 INSERT INTO empleados (nombre_empleado, telefono_empleado, direccion_empleado) VALUES
('Juan Pérez', '555-1234', 'Calle 123, Ciudad ABC'),
('María Gómez', '444-5678', 'Avenida XYZ, Pueblo 123'),
('Pedro López', '333-9087', 'Calle Principal, Ciudad XYZ'),
('Ana Ramírez', '222-6754', 'Avenida Central, Villa 456'),
('Carlos Castro', '666-4321', 'Calle Secundaria, Ciudad EFG'),
('Laura Hernández', '777-9876', 'Avenida del Sol, Pueblo 789'),
('Luis Martínez', '888-2345', 'Calle del Río, Ciudad XYZ'),
('Andrea Sánchez', '999-7654', 'Avenida del Mar, Villa 654'),
('José Rodríguez', '333-1111', 'Calle Tranquila, Ciudad ABC'),
('Diana Romero', '222-9999', 'Avenida del Bosque, Pueblo 654');
 create table casacentral (
 id_casacentral INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 nombre_casacentral varchar (50) not null,
 direccion varchar (60),
 telefono varchar (20),
 gerente_general varchar (50),
 id_empleado int not null,
 foreign key (id_empleado) references empleados (id_empleado)
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );
 INSERT INTO casacentral (nombre_casacentral, direccion, telefono, gerente_general, id_empleado) 
VALUES ('Sucursal Central', 'Calle Principal 123', '555-1234', 'Juan Pérez', 3);
create table proveedor (
 id_proveedor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 nombre varchar (50) not null,
 rubro varchar (50),
 telefono varchar (50),
 cuit varchar (50)
 );
 INSERT INTO proveedor (nombre, rubro, telefono, cuit) VALUES
('Proveedor1', 'Electrónica', '555-1234', '12-34567890-1'),
('Proveedor2', 'Textiles', '444-5678', '23-45678901-2'),
('SuministrosTech', 'Tecnología', '333-9087', '34-56789012-3'),
('MegaModa', 'Moda', '222-6754', '45-67890123-4'),
('ToolsRUs', 'Herramientas', '666-4321', '56-78901234-5'),
('EcoSoluciones', 'Medio ambiente', '777-9876', '67-89012345-6'),
('AgroInsumos', 'Agricultura', '888-2345', '78-90123456-7'),
('PapeleríaSuprema', 'Papelería', '999-7654', '89-01234567-8'),
('FerreteríaTotal', 'Ferretería', '333-1111', '90-12345678-9'),
('DistribucionesMundo', 'Distribución', '222-9999', '98-76543210-0');
 create table producto (
 id_producto INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 nombre varchar (50) not null,
 precio decimal
);
INSERT INTO producto (nombre, precio) VALUES
('Producto1', 100),
('Producto2', 50),
('Producto3', 75),
('Producto4', 120),
('Producto5', 200),
('Producto6', 80),
('Producto7', 60),
('Producto8', 90),
('Producto9', 150),
('Producto10', 180);
 create table materiaprima (
 id_materiaprima INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 id_sucursal int not null,
 cantidad decimal
);
INSERT INTO materiaprima (id_sucursal, cantidad) VALUES
(1, 100),
(1, 50),
(2, 75),
(2, 120),
(3, 200),
(3, 80),
(4, 60),
(4, 90),
(5, 150),
(5, 180);
create table licencia (
 id_licencia INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 id_empleado int not null,
 total_dias int,
 foreign key (id_empleado) references empleados (id_empleado)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);
INSERT INTO licencia (id_empleado, total_dias) VALUES
(1, 10),
(2, 15),
(3, 7),
(4, 12),
(5, 8);
create table pedidos_proveedores (
 id_pedido INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 id_proveedor int not null,
 id_materiaprima int not null,
 cantidad decimal (10,2),
 foreign key (id_proveedor) references proveedor (id_proveedor)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 foreign key (id_materiaprima) references materiaprima (id_materiaprima)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);
INSERT INTO pedidos_proveedores (id_proveedor, id_materiaprima, cantidad) VALUES
(1, 1, 5),
(2, 2, 3),
(3, 3, 8),
(4, 4, 10),
(5, 5, 2),
(6, 6, 6),
(7, 7, 4),
(8, 8, 7),
(9, 9, 9),
(10, 10, 1);
create table factura (
 id_factura INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 id_sucursal int not null,
 id_producto int not null,
 monto decimal (10.2),
 forma_pago varchar(30),
 fecha_hora datetime,
 foreign key (id_sucursal) references sucursales (id_sucursal)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 foreign key (id_producto) references producto (id_producto)
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );
 INSERT INTO factura (id_sucursal, id_producto, monto, forma_pago, fecha_hora) VALUES
(1, 1, 500, 'Tarjeta de crédito', '2023-08-01 10:00:00'),
(1, 2, 750, 'Efectivo', '2023-08-01 11:30:00'),
(2, 3, 320, 'Transferencia bancaria', '2023-08-01 14:15:00'),
(2, 4, 420, 'Efectivo', '2023-08-01 15:45:00'),
(3, 5, 600, 'Tarjeta de débito', '2023-08-01 17:30:00'),
(3, 6, 900, 'Efectivo', '2023-08-01 18:45:00'),
(4, 7, 800, 'Tarjeta de crédito', '2023-08-01 20:00:00'),
(4, 8, 250, 'Efectivo', '2023-08-01 21:30:00'),
(5, 9, 450, 'Tarjeta de crédito', '2023-08-01 23:00:00'),
(5, 10, 350, 'Efectivo', '2023-08-02 01:15:00'),
(1, 2, 700, 'Tarjeta de débito', '2023-08-02 03:30:00');
 create table ventas (
 id_venta INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 id_sucursal int not null,
 id_factura int not null,
 monto decimal (10.2),
 fecha_hora datetime,
 foreign key (id_sucursal) references sucursales (id_sucursal)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 foreign key (id_factura) references factura (id_factura)
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );
 INSERT INTO ventas (id_sucursal, id_factura, monto, fecha_hora) VALUES
(1, 1, 500, '2023-08-01 10:00:00'),
(1, 2, 750, '2023-08-01 11:30:00'),
(2, 3, 320, '2023-08-01 14:15:00'),
(2, 4, 420, '2023-08-01 15:45:00'),
(3, 5, 600, '2023-08-01 17:30:00'),
(3, 6, 900, '2023-08-01 18:45:00'),
(4, 7, 800, '2023-08-01 20:00:00'),
(4, 8, 250, '2023-08-01 21:30:00'),
(5, 9, 450, '2023-08-01 23:00:00'),
(5, 10, 350, '2023-08-02 01:15:00'),
(1, 2, 700, '2023-08-02 03:30:00');
 create table clientes (
id_cliente INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(50) NOT NULL,
    telefono_cliente VARCHAR(50) null,
    direccion_cliente VARCHAR(60),
    mail varchar(80)
	);
    INSERT INTO clientes (nombre_cliente, telefono_cliente, direccion_cliente, mail) VALUES
('Juan Pérez', '555-1234', 'Calle Principal 123', 'juan.perez@example.com'),
('María Gómez', '444-5678', 'Avenida Norte 456', 'maria.gomez@example.com'),
('Pedro López', '333-9087', 'Calle Sur 789', 'pedro.lopez@example.com'),
('Ana Ramírez', '222-6754', 'Avenida Este 321', 'ana.ramirez@example.com'),
('Carlos Castro', '666-4321', 'Calle Oeste 654', 'carlos.castro@example.com'),
('Laura Hernández', '777-9876', 'Avenida 1 987', 'laura.hernandez@example.com'),
('Luis Martínez', '888-2345', 'Calle 2 234', 'luis.martinez@example.com'),
('Andrea Sánchez', '999-7654', 'Avenida 3 567', 'andrea.sanchez@example.com'),
('José Rodríguez', '333-1111', 'Calle Tranquila 234', 'jose.rodriguez@example.com'),
('Diana Romero', '222-9999', 'Avenida del Bosque 789', 'diana.romero@example.com'),
('Fernando López', '555-4321', 'Calle del Mar 876', 'fernando.lopez@example.com'),
('Sofía Martínez', '444-9999', 'Avenida del Sol 345', 'sofia.martinez@example.com'),
('Lucas Fernández', '333-2222', 'Calle del Bosque 234', 'lucas.fernandez@example.com'),
('Carolina Ramírez', '222-5555', 'Avenida del Mar 789', 'carolina.ramirez@example.com'),
('Gabriel Gómez', '555-8888', 'Calle del Sol 543', 'gabriel.gomez@example.com');
    create table reservas (
 id_reserva INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 id_sucursal int not null,
 id_cliente int not null,
 telefono varchar (50),
  foreign key (id_sucursal) references sucursales (id_sucursal)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 foreign key (id_cliente) references clientes (id_cliente)
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );
 INSERT INTO reservas (id_sucursal, id_cliente, telefono) VALUES
(1, 1, '555-1234'),
(1, 2, '444-5678'),
(2, 3, '333-9087'),
(2, 4, '222-6754'),
(3, 5, '666-4321'),
(3, 6, '777-9876'),
(4, 7, '888-2345'),
(4, 8, '999-7654'),
(5, 9, '333-1111'),
(5, 10, '222-9999');
 create table pedido (
 id_pedido INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 id_producto int not null,
 nombre_cliente VARCHAR(50) NOT NULL,
    telefono_cliente VARCHAR(50) null,
    direccion_cliente VARCHAR(50), 
 foreign key (id_producto) references producto (id_producto)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);
INSERT INTO pedido (id_producto, nombre_cliente, telefono_cliente, direccion_cliente) VALUES
(1, 'Juan Pérez', '555-1234', 'Calle Principal 123'),
(2, 'María Gómez', '444-5678', 'Avenida Norte 456'),
(3, 'Pedro López', '333-9087', 'Calle Sur 789'),
(4, 'Ana Ramírez', '222-6754', 'Avenida Este 321'),
(5, 'Carlos Castro', '666-4321', 'Calle Oeste 654'),
(6, 'Laura Hernández', '777-9876', 'Avenida 1 987'),
(7, 'Luis Martínez', '888-2345', 'Calle 2 234'),
(8, 'Andrea Sánchez', '999-7654', 'Avenida 3 567'),
(9, 'José Rodríguez', '333-1111', 'Calle Tranquila 234'),
(10, 'Diana Romero', '222-9999', 'Avenida del Bosque 789');
create table compras (
 id_compra INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 id_pedido int not null,
 precio decimal (10.2), 
 foreign key (id_pedido) references pedido (id_pedido)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);
INSERT INTO compras (id_pedido, precio) VALUES
(1, 500),
(2, 750),
(3, 320),
(4, 420),
(5, 600),
(6, 900),
(7, 800),
(8, 250),
(9, 450),
(10, 350);
  create table movimientos_financieros (
 id_cuenta_corrientes INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 id_venta int not null,
 id_compra int not null,
 id_sucursal int not null,
 monto_total decimal (10,2),
foreign key (id_venta) references ventas (id_venta)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
 foreign key (id_compra) references compras (id_compra)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
  foreign key (id_sucursal) references sucursales (id_sucursal)
 ON DELETE CASCADE
 ON UPDATE CASCADE
 );
 INSERT INTO movimientos_financieros (id_cuenta_corrientes, id_venta, id_compra, id_sucursal, monto_total) VALUES
(31, 1, 1, 1, 100),
(32, 2, 2, 2, 250),
(33, 3, 3, 3, 180),
(34, 4, 4, 1, 120),
(35, 5, 5, 2, 300),
(36, 6, 6, 3, 120),
(37, 7, 7, 1, 220),
(38, 8, 8, 2, 180),
(39, 9, 9, 3, 160),
(40, 10, 10, 1, 200);




