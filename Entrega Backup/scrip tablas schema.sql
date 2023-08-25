create database lacomilonabackup;
use lacomilonabackup;
create table sistema (
 id_permiso INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 usuario varchar (50) not null,
 contraseña varchar (20)
); 
create table sucursales (
id_sucursal INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre_sucursal VARCHAR(50) NOT NULL,
    telefono_sucursal VARCHAR(50) null,
    direccion_sucursal VARCHAR(50)
);
create table empleados (
id_empleado INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre_empleado VARCHAR(50) NULL,
    telefono_empleado VARCHAR(50) null,
    direccion_empleado VARCHAR(60)
 );
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
 create table proveedor (
 id_proveedor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 nombre varchar (50) not null,
 rubro varchar (50),
 telefono varchar (50),
 cuit varchar (50)
 );
 create table producto (
 id_producto INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 nombre varchar (50) not null,
 precio decimal
);
 create table materiaprima (
 id_materiaprima INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 id_sucursal int not null,
 cantidad decimal
);
create table licencia (
 id_licencia INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 id_empleado int not null,
 total_dias int,
 foreign key (id_empleado) references empleados (id_empleado)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);
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
 create table clientes (
id_cliente INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(50) NOT NULL,
    telefono_cliente VARCHAR(50) null,
    direccion_cliente VARCHAR(60),
    mail varchar(80)
	);
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
create table compras (
 id_compra INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
 id_pedido int not null,
 precio decimal (10.2), 
 foreign key (id_pedido) references pedido (id_pedido)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);
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