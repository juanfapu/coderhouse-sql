-comentario: se realizo el backup de las siguientes tablas: casacentral,clientes,compras,empleados,factura,licencia,log_compras,log_ventas,materiaprima,movimientos_financieros
pedido,pedidos_proveedores,producto,proveedor,reservas,sistema,sucursales,ventas.
CREATE DATABASE  IF NOT EXISTS `lacomilona2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lacomilona2`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: lacomilona2
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `casacentral`
--

DROP TABLE IF EXISTS `casacentral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casacentral` (
  `id_casacentral` int NOT NULL AUTO_INCREMENT,
  `nombre_casacentral` varchar(50) NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `gerente_general` varchar(50) DEFAULT NULL,
  `id_empleado` int NOT NULL,
  PRIMARY KEY (`id_casacentral`),
  UNIQUE KEY `id_casacentral` (`id_casacentral`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `casacentral_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casacentral`
--

LOCK TABLES `casacentral` WRITE;
/*!40000 ALTER TABLE `casacentral` DISABLE KEYS */;
INSERT INTO `casacentral` VALUES (1,'Sucursal Central','Calle Principal 123','555-1234','Juan Pérez',3);
/*!40000 ALTER TABLE `casacentral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) NOT NULL,
  `telefono_cliente` varchar(50) DEFAULT NULL,
  `direccion_cliente` varchar(60) DEFAULT NULL,
  `mail` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan Pérez','555-1234','Calle Principal 123','juan.perez@example.com'),(2,'María Gómez','444-5678','Avenida Norte 456','maria.gomez@example.com'),(3,'Pedro López','333-9087','Calle Sur 789','pedro.lopez@example.com'),(4,'Ana Ramírez','222-6754','Avenida Este 321','ana.ramirez@example.com'),(5,'Carlos Castro','666-4321','Calle Oeste 654','carlos.castro@example.com'),(6,'Laura Hernández','777-9876','Avenida 1 987','laura.hernandez@example.com'),(7,'Luis Martínez','888-2345','Calle 2 234','luis.martinez@example.com'),(8,'Andrea Sánchez','999-7654','Avenida 3 567','andrea.sanchez@example.com'),(9,'José Rodríguez','333-1111','Calle Tranquila 234','jose.rodriguez@example.com'),(10,'Diana Romero','222-9999','Avenida del Bosque 789','diana.romero@example.com'),(11,'Fernando López','555-4321','Calle del Mar 876','fernando.lopez@example.com'),(12,'Sofía Martínez','444-9999','Avenida del Sol 345','sofia.martinez@example.com'),(13,'Lucas Fernández','333-2222','Calle del Bosque 234','lucas.fernandez@example.com'),(14,'Carolina Ramírez','222-5555','Avenida del Mar 789','carolina.ramirez@example.com'),(15,'Gabriel Gómez','555-8888','Calle del Sol 543','gabriel.gomez@example.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  UNIQUE KEY `id_compra` (`id_compra`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,500),(2,2,750),(3,3,320),(4,4,420),(5,5,600),(6,6,900),(7,7,800),(8,8,250),(9,9,450),(10,10,350);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_ADD_RegistroLogCompras` AFTER DELETE ON `compras` FOR EACH ROW BEGIN
    INSERT INTO log_compras (usuario, fecha, hora, accion)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `datos_clientes`
--

DROP TABLE IF EXISTS `datos_clientes`;
/*!50001 DROP VIEW IF EXISTS `datos_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `datos_clientes` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nombre_cliente`,
 1 AS `direccion_cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `emision_facturas`
--

DROP TABLE IF EXISTS `emision_facturas`;
/*!50001 DROP VIEW IF EXISTS `emision_facturas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `emision_facturas` AS SELECT 
 1 AS `id_sucursal`,
 1 AS `monto`,
 1 AS `forma_pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(50) DEFAULT NULL,
  `telefono_empleado` varchar(50) DEFAULT NULL,
  `direccion_empleado` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `id_empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Juan Pérez','555-1234','Calle 123, Ciudad ABC'),(2,'María Gómez','444-5678','Avenida XYZ, Pueblo 123'),(3,'Pedro López','333-9087','Calle Principal, Ciudad XYZ'),(4,'Ana Ramírez','222-6754','Avenida Central, Villa 456'),(5,'Carlos Castro','666-4321','Calle Secundaria, Ciudad EFG'),(6,'Laura Hernández','777-9876','Avenida del Sol, Pueblo 789'),(7,'Luis Martínez','888-2345','Calle del Río, Ciudad XYZ'),(8,'Andrea Sánchez','999-7654','Avenida del Mar, Villa 654'),(9,'José Rodríguez','333-1111','Calle Tranquila, Ciudad ABC'),(10,'Diana Romero','222-9999','Avenida del Bosque, Pueblo 654');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_sucursal` int NOT NULL,
  `id_producto` int NOT NULL,
  `monto` decimal(10,0) DEFAULT NULL,
  `forma_pago` varchar(30) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `id_factura` (`id_factura`),
  KEY `id_sucursal` (`id_sucursal`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,1,1,500,'Tarjeta de crédito','2023-08-01 10:00:00'),(2,1,2,750,'Efectivo','2023-08-01 11:30:00'),(3,2,3,320,'Transferencia bancaria','2023-08-01 14:15:00'),(4,2,4,420,'Efectivo','2023-08-01 15:45:00'),(5,3,5,600,'Tarjeta de débito','2023-08-01 17:30:00'),(6,3,6,900,'Efectivo','2023-08-01 18:45:00'),(7,4,7,800,'Tarjeta de crédito','2023-08-01 20:00:00'),(8,4,8,250,'Efectivo','2023-08-01 21:30:00'),(9,5,9,450,'Tarjeta de crédito','2023-08-01 23:00:00'),(10,5,10,350,'Efectivo','2023-08-02 01:15:00'),(11,1,2,700,'Tarjeta de débito','2023-08-02 03:30:00');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `info_pedidos`
--

DROP TABLE IF EXISTS `info_pedidos`;
/*!50001 DROP VIEW IF EXISTS `info_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_pedidos` AS SELECT 
 1 AS `id_pedido`,
 1 AS `telefono_cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `info_reservas`
--

DROP TABLE IF EXISTS `info_reservas`;
/*!50001 DROP VIEW IF EXISTS `info_reservas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_reservas` AS SELECT 
 1 AS `id_reserva`,
 1 AS `id_sucursal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ingresos_egresos`
--

DROP TABLE IF EXISTS `ingresos_egresos`;
/*!50001 DROP VIEW IF EXISTS `ingresos_egresos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ingresos_egresos` AS SELECT 
 1 AS `id_cuenta_corrientes`,
 1 AS `id_venta`,
 1 AS `id_compra`,
 1 AS `monto_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `licencia`
--

DROP TABLE IF EXISTS `licencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licencia` (
  `id_licencia` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `total_dias` int DEFAULT NULL,
  PRIMARY KEY (`id_licencia`),
  UNIQUE KEY `id_licencia` (`id_licencia`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `licencia_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licencia`
--

LOCK TABLES `licencia` WRITE;
/*!40000 ALTER TABLE `licencia` DISABLE KEYS */;
INSERT INTO `licencia` VALUES (1,1,10),(2,2,15),(3,3,7),(4,4,12),(5,5,8);
/*!40000 ALTER TABLE `licencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_compras`
--

DROP TABLE IF EXISTS `log_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_compras` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `accion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_compras`
--

LOCK TABLES `log_compras` WRITE;
/*!40000 ALTER TABLE `log_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_ventas`
--

DROP TABLE IF EXISTS `log_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_ventas` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `accion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_ventas`
--

LOCK TABLES `log_ventas` WRITE;
/*!40000 ALTER TABLE `log_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiaprima`
--

DROP TABLE IF EXISTS `materiaprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiaprima` (
  `id_materiaprima` int NOT NULL AUTO_INCREMENT,
  `id_sucursal` int NOT NULL,
  `cantidad` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_materiaprima`),
  UNIQUE KEY `id_materiaprima` (`id_materiaprima`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiaprima`
--

LOCK TABLES `materiaprima` WRITE;
/*!40000 ALTER TABLE `materiaprima` DISABLE KEYS */;
INSERT INTO `materiaprima` VALUES (1,1,100),(2,1,50),(3,2,75),(4,2,120),(5,3,200),(6,3,80),(7,4,60),(8,4,90),(9,5,150),(10,5,180);
/*!40000 ALTER TABLE `materiaprima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_financieros`
--

DROP TABLE IF EXISTS `movimientos_financieros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_financieros` (
  `id_cuenta_corrientes` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_compra` int NOT NULL,
  `id_sucursal` int NOT NULL,
  `monto_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_cuenta_corrientes`),
  UNIQUE KEY `id_cuenta_corrientes` (`id_cuenta_corrientes`),
  KEY `id_venta` (`id_venta`),
  KEY `id_compra` (`id_compra`),
  KEY `id_sucursal` (`id_sucursal`),
  CONSTRAINT `movimientos_financieros_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_financieros_ibfk_2` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_financieros_ibfk_3` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_financieros`
--

LOCK TABLES `movimientos_financieros` WRITE;
/*!40000 ALTER TABLE `movimientos_financieros` DISABLE KEYS */;
INSERT INTO `movimientos_financieros` VALUES (31,1,1,1,100.00),(32,2,2,2,250.00),(33,3,3,3,180.00),(34,4,4,1,120.00),(35,5,5,2,300.00),(36,6,6,3,120.00),(37,7,7,1,220.00),(38,8,8,2,180.00),(39,9,9,3,160.00),(40,10,10,1,200.00);
/*!40000 ALTER TABLE `movimientos_financieros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `telefono_cliente` varchar(50) DEFAULT NULL,
  `direccion_cliente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE KEY `id_pedido` (`id_pedido`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'Juan Pérez','555-1234','Calle Principal 123'),(2,2,'María Gómez','444-5678','Avenida Norte 456'),(3,3,'Pedro López','333-9087','Calle Sur 789'),(4,4,'Ana Ramírez','222-6754','Avenida Este 321'),(5,5,'Carlos Castro','666-4321','Calle Oeste 654'),(6,6,'Laura Hernández','777-9876','Avenida 1 987'),(7,7,'Luis Martínez','888-2345','Calle 2 234'),(8,8,'Andrea Sánchez','999-7654','Avenida 3 567'),(9,9,'José Rodríguez','333-1111','Calle Tranquila 234'),(10,10,'Diana Romero','222-9999','Avenida del Bosque 789');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_proveedores`
--

DROP TABLE IF EXISTS `pedidos_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_proveedores` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `id_materiaprima` int NOT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE KEY `id_pedido` (`id_pedido`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_materiaprima` (`id_materiaprima`),
  CONSTRAINT `pedidos_proveedores_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pedidos_proveedores_ibfk_2` FOREIGN KEY (`id_materiaprima`) REFERENCES `materiaprima` (`id_materiaprima`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_proveedores`
--

LOCK TABLES `pedidos_proveedores` WRITE;
/*!40000 ALTER TABLE `pedidos_proveedores` DISABLE KEYS */;
INSERT INTO `pedidos_proveedores` VALUES (1,1,1,5.00),(2,2,2,3.00),(3,3,3,8.00),(4,4,4,10.00),(5,5,5,2.00),(6,6,6,6.00),(7,7,7,4.00),(8,8,8,7.00),(9,9,9,9.00),(10,10,10,1.00);
/*!40000 ALTER TABLE `pedidos_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Producto1',100),(2,'Producto2',50),(3,'Producto3',75),(4,'Producto4',120),(5,'Producto5',200),(6,'Producto6',80),(7,'Producto7',60),(8,'Producto8',90),(9,'Producto9',150),(10,'Producto10',180);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `rubro` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `cuit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `id_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Proveedor1','Electrónica','555-1234','12-34567890-1'),(2,'Proveedor2','Textiles','444-5678','23-45678901-2'),(3,'SuministrosTech','Tecnología','333-9087','34-56789012-3'),(4,'MegaModa','Moda','222-6754','45-67890123-4'),(5,'ToolsRUs','Herramientas','666-4321','56-78901234-5'),(6,'EcoSoluciones','Medio ambiente','777-9876','67-89012345-6'),(7,'AgroInsumos','Agricultura','888-2345','78-90123456-7'),(8,'PapeleríaSuprema','Papelería','999-7654','89-01234567-8'),(9,'FerreteríaTotal','Ferretería','333-1111','90-12345678-9'),(10,'DistribucionesMundo','Distribución','222-9999','98-76543210-0');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL AUTO_INCREMENT,
  `id_sucursal` int NOT NULL,
  `id_cliente` int NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_reserva`),
  UNIQUE KEY `id_reserva` (`id_reserva`),
  KEY `id_sucursal` (`id_sucursal`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,1,1,'555-1234'),(2,1,2,'444-5678'),(3,2,3,'333-9087'),(4,2,4,'222-6754'),(5,3,5,'666-4321'),(6,3,6,'777-9876'),(7,4,7,'888-2345'),(8,4,8,'999-7654'),(9,5,9,'333-1111'),(10,5,10,'222-9999');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistema`
--

DROP TABLE IF EXISTS `sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sistema` (
  `id_permiso` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`),
  UNIQUE KEY `id_permiso` (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema`
--

LOCK TABLES `sistema` WRITE;
/*!40000 ALTER TABLE `sistema` DISABLE KEYS */;
INSERT INTO `sistema` VALUES (1,'usuario1','pass1234'),(2,'admin_2023','admin_pass'),(3,'john_doe','doe_password'),(4,'cool_guy87','secret123'),(5,'jenny_567','jenny_pass'),(6,'power_user99','strong_pass'),(7,'new_user2023','new_pass_2023'),(8,'security_ninja','ninja_pass'),(9,'dev_team_lead','dev_lead123'),(10,'sysadmin42','sys_pass_42');
/*!40000 ALTER TABLE `sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `nombre_sucursal` varchar(50) NOT NULL,
  `telefono_sucursal` varchar(50) DEFAULT NULL,
  `direccion_sucursal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`),
  UNIQUE KEY `id_sucursal` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (1,'Sucursal Central','555-1234','Calle Principal 123'),(2,'Sucursal Norte','444-5678','Avenida Norte 456'),(3,'Sucursal Sur','333-9087','Calle Sur 789'),(4,'Sucursal Este','222-6754','Avenida Este 321'),(5,'Sucursal Oeste','666-4321','Calle Oeste 654'),(6,'Sucursal 1','777-9876','Avenida 1 987'),(7,'Sucursal 2','888-2345','Calle 2 234'),(8,'Sucursal 3','999-7654','Avenida 3 567');
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_sucursal` int NOT NULL,
  `id_factura` int NOT NULL,
  `monto` decimal(10,0) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  UNIQUE KEY `id_venta` (`id_venta`),
  KEY `id_sucursal` (`id_sucursal`),
  KEY `id_factura` (`id_factura`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id_sucursal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,500,'2023-08-01 10:00:00'),(2,1,2,750,'2023-08-01 11:30:00'),(3,2,3,320,'2023-08-01 14:15:00'),(4,2,4,420,'2023-08-01 15:45:00'),(5,3,5,600,'2023-08-01 17:30:00'),(6,3,6,900,'2023-08-01 18:45:00'),(7,4,7,800,'2023-08-01 20:00:00'),(8,4,8,250,'2023-08-01 21:30:00'),(9,5,9,450,'2023-08-01 23:00:00'),(10,5,10,350,'2023-08-02 01:15:00'),(11,1,2,700,'2023-08-02 03:30:00');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TR_ADD_RegistroLogVentas` BEFORE INSERT ON `ventas` FOR EACH ROW BEGIN
    INSERT INTO log_ventas (usuario, fecha, hora, accion)
    VALUES (CURRENT_USER(), CURDATE(), CURTIME());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'lacomilona2'
--

--
-- Dumping routines for database 'lacomilona2'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_total_compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_total_compras`(suc_id INT) RETURNS decimal(10,2)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `calcular_total_ventas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_total_ventas`(sucursal_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(monto) INTO total FROM ventas WHERE id_sucursal = sucursal_id;
    IF total IS NULL THEN
        SET total = 0;
    END IF;
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProcessPedidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcessPedidos`()
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProcessPedidosWithSavepoints` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcessPedidosWithSavepoints`()
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_GET_ActualizarPrecioProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GET_ActualizarPrecioProducto`(
    IN producto_id INT,
    IN nuevo_precio DECIMAL(10, 2)
)
BEGIN
    UPDATE producto
    SET precio = nuevo_precio
    WHERE id_producto = producto_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_GET_InsertarEliminarRegistro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GET_InsertarEliminarRegistro`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `datos_clientes`
--

/*!50001 DROP VIEW IF EXISTS `datos_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datos_clientes` AS select `clientes`.`id_cliente` AS `id_cliente`,`clientes`.`nombre_cliente` AS `nombre_cliente`,`clientes`.`direccion_cliente` AS `direccion_cliente` from `clientes` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `emision_facturas`
--

/*!50001 DROP VIEW IF EXISTS `emision_facturas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emision_facturas` AS select `factura`.`id_sucursal` AS `id_sucursal`,`factura`.`monto` AS `monto`,`factura`.`forma_pago` AS `forma_pago` from `factura` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `info_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_pedidos` AS select `pedido`.`id_pedido` AS `id_pedido`,`pedido`.`telefono_cliente` AS `telefono_cliente` from `pedido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_reservas`
--

/*!50001 DROP VIEW IF EXISTS `info_reservas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_reservas` AS select `reservas`.`id_reserva` AS `id_reserva`,`reservas`.`id_sucursal` AS `id_sucursal` from `reservas` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ingresos_egresos`
--

/*!50001 DROP VIEW IF EXISTS `ingresos_egresos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ingresos_egresos` AS select `movimientos_financieros`.`id_cuenta_corrientes` AS `id_cuenta_corrientes`,`movimientos_financieros`.`id_venta` AS `id_venta`,`movimientos_financieros`.`id_compra` AS `id_compra`,`movimientos_financieros`.`monto_total` AS `monto_total` from `movimientos_financieros` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-24 16:48:08
