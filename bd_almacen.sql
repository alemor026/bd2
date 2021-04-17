-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: almacen
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idclientes` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `nit` varchar(12) NOT NULL,
  `genero` bit(1) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `correo_electronico` varchar(45) NOT NULL,
  `fecha_de_ingreso` datetime NOT NULL,
  PRIMARY KEY (`idclientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `idcompras` int NOT NULL AUTO_INCREMENT,
  `no_orden_compras` int NOT NULL,
  `idproveedores` int NOT NULL,
  `fecha_orden` date NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  PRIMARY KEY (`idcompras`),
  KEY `idproveedores_idx` (`idproveedores`),
  CONSTRAINT `idproveedores` FOREIGN KEY (`idproveedores`) REFERENCES `proveedores` (`idproveedores`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_detalle`
--

DROP TABLE IF EXISTS `compras_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_detalle` (
  `idcompras_detalle` bigint NOT NULL AUTO_INCREMENT,
  `idcompras` int NOT NULL,
  `idproductos` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_costo_unitario` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idcompras_detalle`),
  KEY `idcompras_idx` (`idcompras`),
  KEY `idproductos_idx` (`idproductos`),
  CONSTRAINT `idcompras` FOREIGN KEY (`idcompras`) REFERENCES `compras` (`idcompras`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idproductos` FOREIGN KEY (`idproductos`) REFERENCES `productos` (`idproductos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_detalle`
--

LOCK TABLES `compras_detalle` WRITE;
/*!40000 ALTER TABLE `compras_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idempleados` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `dpi` varchar(15) NOT NULL,
  `genero` bit(1) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `idpuestos` smallint NOT NULL,
  `fecha_inicio_labores` date NOT NULL,
  `fechaingreso` datetime NOT NULL,
  PRIMARY KEY (`idempleados`),
  KEY `idpuestos_idx` (`idpuestos`),
  CONSTRAINT `idpuestos` FOREIGN KEY (`idpuestos`) REFERENCES `puestos` (`idpuestos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `idmarcas` smallint NOT NULL AUTO_INCREMENT,
  `marcas` varchar(50) NOT NULL,
  PRIMARY KEY (`idmarcas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idproductos` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(50) NOT NULL,
  `idmarcas` smallint NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `imagen` varchar(30) NOT NULL,
  `precio_costo` decimal(8,2) NOT NULL,
  `precio_venta` decimal(8,2) NOT NULL,
  `existencia` int NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  PRIMARY KEY (`idproductos`),
  KEY `idmarcas_idx` (`idmarcas`),
  CONSTRAINT `idmarcas` FOREIGN KEY (`idmarcas`) REFERENCES `marcas` (`idmarcas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idproveedores` int NOT NULL AUTO_INCREMENT,
  `proveedores` varchar(50) NOT NULL,
  `nit_proveedores` varchar(12) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  PRIMARY KEY (`idproveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `idpuestos` smallint NOT NULL AUTO_INCREMENT,
  `puesto` varchar(50) NOT NULL,
  PRIMARY KEY (`idpuestos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idventas` int NOT NULL AUTO_INCREMENT,
  `nofactura` int NOT NULL,
  `serie` char(1) NOT NULL,
  `fecha_factura` date NOT NULL,
  `idclientes` int NOT NULL,
  `idempleados` int NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  PRIMARY KEY (`idventas`),
  KEY `idclientes_idx` (`idclientes`),
  KEY `idempleados_idx` (`idempleados`),
  CONSTRAINT `idclientes` FOREIGN KEY (`idclientes`) REFERENCES `clientes` (`idclientes`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idempleados` FOREIGN KEY (`idempleados`) REFERENCES `empleados` (`idempleados`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_detalle` (
  `idventas_detalle` bigint NOT NULL AUTO_INCREMENT,
  `idventas` int NOT NULL,
  `idproductos` int NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `precio_unitario` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idventas_detalle`),
  KEY `idventas_idx` (`idventas`),
  KEY `idproductos_idx` (`idproductos`),
  CONSTRAINT `idventas` FOREIGN KEY (`idventas`) REFERENCES `ventas` (`idventas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalle`
--

LOCK TABLES `ventas_detalle` WRITE;
/*!40000 ALTER TABLE `ventas_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-16 23:49:51
