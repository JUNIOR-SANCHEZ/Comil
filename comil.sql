/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.33-MariaDB : Database - comil3
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`comil3` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `comil3`;

/*Table structure for table `capacidad` */

DROP TABLE IF EXISTS `capacidad`;

CREATE TABLE `capacidad` (
  `id_capacidad` int(11) NOT NULL,
  `volumen` int(11) NOT NULL,
  PRIMARY KEY (`id_capacidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `capacidad` */

/*Table structure for table `cargos_funciones_personal` */

DROP TABLE IF EXISTS `cargos_funciones_personal`;

CREATE TABLE `cargos_funciones_personal` (
  `id_cargos_funciones_personal` int(11) NOT NULL AUTO_INCREMENT,
  `cargo_funcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_cargos_funciones_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `cargos_funciones_personal` */

insert  into `cargos_funciones_personal`(`id_cargos_funciones_personal`,`cargo_funcion`) values (1,'Cargo 1'),(2,'Cargo 2'),(3,'cargo 3');

/*Table structure for table `dependencias` */

DROP TABLE IF EXISTS `dependencias`;

CREATE TABLE `dependencias` (
  `id_dependencias` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_dependencias`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `dependencias` */

insert  into `dependencias`(`id_dependencias`,`nombre`) values (1,'laboratorio de ingles bachillerato');

/*Table structure for table `disco_duro` */

DROP TABLE IF EXISTS `disco_duro`;

CREATE TABLE `disco_duro` (
  `id_disco_duro` int(11) NOT NULL,
  `marca` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `tecnologia` int(11) NOT NULL,
  `pc` int(11) NOT NULL,
  PRIMARY KEY (`id_disco_duro`),
  KEY `D_C` (`capacidad`),
  KEY `D_T` (`tecnologia`),
  KEY `D_M` (`marca`),
  KEY `D_P` (`pc`),
  CONSTRAINT `D_C` FOREIGN KEY (`capacidad`) REFERENCES `capacidad` (`id_capacidad`),
  CONSTRAINT `D_M` FOREIGN KEY (`marca`) REFERENCES `marcas_discos` (`id_marca`),
  CONSTRAINT `D_P` FOREIGN KEY (`pc`) REFERENCES `pc` (`id_pc`),
  CONSTRAINT `D_T` FOREIGN KEY (`tecnologia`) REFERENCES `tecnologia` (`id_tecnologia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `disco_duro` */

/*Table structure for table `estados_civiles` */

DROP TABLE IF EXISTS `estados_civiles`;

CREATE TABLE `estados_civiles` (
  `id_s_civil` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_s_civil` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `estado_s_civil` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_s_civil`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `estados_civiles` */

insert  into `estados_civiles`(`id_s_civil`,`descripcion_s_civil`,`estado_s_civil`) values (1,'Soltero(a)',1),(2,'Casado(a)',1),(3,'Divorciado(a)',0),(4,'Viudo(a)',0);

/*Table structure for table `fecha_permisos` */

DROP TABLE IF EXISTS `fecha_permisos`;

CREATE TABLE `fecha_permisos` (
  `id_fecha_permisos` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `numero` int(11) NOT NULL,
  `solicitud_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id_fecha_permisos`),
  KEY `s_p_f` (`solicitud_permiso`),
  CONSTRAINT `s_p_f` FOREIGN KEY (`solicitud_permiso`) REFERENCES `solicitud_permisos` (`id_solicitud_permisos`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `fecha_permisos` */

insert  into `fecha_permisos`(`id_fecha_permisos`,`fecha`,`numero`,`solicitud_permiso`) values (6,'2018-09-01',8,31),(7,'2018-08-31',2,33);

/*Table structure for table `generos` */

DROP TABLE IF EXISTS `generos`;

CREATE TABLE `generos` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_genero` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `estado_genero` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `generos` */

insert  into `generos`(`id_genero`,`descripcion_genero`,`estado_genero`) values (1,'masculino',1),(2,'femenino',1);

/*Table structure for table `hoja_vida_equipos` */

DROP TABLE IF EXISTS `hoja_vida_equipos`;

CREATE TABLE `hoja_vida_equipos` (
  `id_hoja_vida_equipos` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_emision` datetime NOT NULL,
  `codigo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `responsables` int(11) NOT NULL,
  PRIMARY KEY (`id_hoja_vida_equipos`),
  KEY `HVE_R` (`responsables`),
  CONSTRAINT `HVE_R` FOREIGN KEY (`responsables`) REFERENCES `responsables_ccp` (`id_responsables_ccp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `hoja_vida_equipos` */

/*Table structure for table `horas_permiso` */

DROP TABLE IF EXISTS `horas_permiso`;

CREATE TABLE `horas_permiso` (
  `id_horas_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora_salida` time NOT NULL,
  `hora_entrada` time NOT NULL,
  `solicitud_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id_horas_permiso`),
  KEY `s_p_h` (`solicitud_permiso`),
  CONSTRAINT `s_p_h` FOREIGN KEY (`solicitud_permiso`) REFERENCES `solicitud_permisos` (`id_solicitud_permisos`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `horas_permiso` */

insert  into `horas_permiso`(`id_horas_permiso`,`fecha`,`hora_salida`,`hora_entrada`,`solicitud_permiso`) values (6,'2018-08-31','09:00:00','10:00:00',32);

/*Table structure for table `marcas_discos` */

DROP TABLE IF EXISTS `marcas_discos`;

CREATE TABLE `marcas_discos` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `marcas_discos` */

insert  into `marcas_discos`(`id_marca`,`marca`) values (1,'SEAGATE'),(2,'ITACHI');

/*Table structure for table `marcas_pc` */

DROP TABLE IF EXISTS `marcas_pc`;

CREATE TABLE `marcas_pc` (
  `id_marcas` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_marcas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `marcas_pc` */

insert  into `marcas_pc`(`id_marcas`,`marca`) values (1,'HP'),(2,'TOSHIBA'),(3,'SAMSUNG'),(4,'ACER'),(5,'OTROS');

/*Table structure for table `marcas_procesador` */

DROP TABLE IF EXISTS `marcas_procesador`;

CREATE TABLE `marcas_procesador` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `marcas_procesador` */

insert  into `marcas_procesador`(`id_marca`,`marca`) values (1,'AMD'),(2,'INTEL');

/*Table structure for table `modelo_pc` */

DROP TABLE IF EXISTS `modelo_pc`;

CREATE TABLE `modelo_pc` (
  `id_modelo` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `modelo_pc` */

insert  into `modelo_pc`(`id_modelo`,`modelo`) values (2,'HP ProDesk 400 G1 MT'),(3,'DH615A_'),(4,'H81M-H');

/*Table structure for table `motivo_permisos` */

DROP TABLE IF EXISTS `motivo_permisos`;

CREATE TABLE `motivo_permisos` (
  `id_motivo_permisos` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_motivo_permisos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `motivo_permisos` */

insert  into `motivo_permisos`(`id_motivo_permisos`,`motivo`) values (1,'asuntos personales'),(2,'enfermedad'),(3,'calamidad domestica'),(4,'capacitacion');

/*Table structure for table `pc` */

DROP TABLE IF EXISTS `pc`;

CREATE TABLE `pc` (
  `id_pc` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `serie` varchar(50) DEFAULT NULL,
  `marcas` int(11) NOT NULL,
  `modelo` int(11) NOT NULL,
  PRIMARY KEY (`id_pc`),
  KEY `P_MA` (`marcas`),
  KEY `P_MO` (`modelo`),
  CONSTRAINT `P_MA` FOREIGN KEY (`marcas`) REFERENCES `marcas_pc` (`id_marcas`),
  CONSTRAINT `P_MO` FOREIGN KEY (`modelo`) REFERENCES `modelo_pc` (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

/*Data for the table `pc` */

insert  into `pc`(`id_pc`,`nombre`,`serie`,`marcas`,`modelo`) values (40,'EN-LAB-06','521CG11114006',2,3),(41,'EN-LAB-06','521CG11114006',2,3),(42,'EN-LAB-06','521CG11114006',2,2),(43,'EN-LAB-06','521CG11114006',2,2),(44,'EN-LAB-06','521CG11114006',1,2),(45,'EN-LAB-06','521CG11114006',1,2),(46,'EN-LAB-06','521CG11114006',2,3),(47,'EN-LAB-06','521CG11114006',1,2),(48,'EN-LAB-06','521CG11114006',2,2),(49,'EN-LAB-06','521CG11114006',2,2),(50,'EN-LAB-06','521CG11114006',1,2),(51,'EN-LAB-06','521CG11114006',1,2),(52,'EN-LAB-06','521CG11114006',1,2),(53,'EN-LAB-06','521CG11114006',1,2),(54,'EN-LAB-06','521CG11114006',1,2),(55,'EN-LAB-06','521CG11114006',1,2),(56,'EN-LAB-06','521CG11114006',1,2),(57,'EN-LAB-06','521CG11114006',2,2);

/*Table structure for table `permisos` */

DROP TABLE IF EXISTS `permisos`;

CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `permiso` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `key` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `permisos` */

insert  into `permisos`(`id_permiso`,`permiso`,`key`) values (1,'Tareas de administracion','admin_access'),(2,'add news','new_news'),(3,'edit news','edit_news'),(4,'delete news','delete_news'),(5,'Dpto. de Talento Humano','admin_dptoTalHum'),(6,'Dpto. de Centro de Computo','admin_dptoCenCom');

/*Table structure for table `permisos_role` */

DROP TABLE IF EXISTS `permisos_role`;

CREATE TABLE `permisos_role` (
  `role` int(11) NOT NULL,
  `permiso` int(11) NOT NULL,
  `valor` tinyint(4) NOT NULL,
  PRIMARY KEY (`role`,`permiso`),
  KEY `role` (`role`),
  KEY `permiso` (`permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `permisos_role` */

insert  into `permisos_role`(`role`,`permiso`,`valor`) values (1,1,1),(1,2,1),(1,3,1),(1,4,1),(2,2,1),(2,3,1),(2,4,1),(2,5,1),(3,6,1);

/*Table structure for table `permisos_usuario` */

DROP TABLE IF EXISTS `permisos_usuario`;

CREATE TABLE `permisos_usuario` (
  `usuario` int(11) NOT NULL,
  `permiso` int(11) NOT NULL,
  `valor` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`usuario`,`permiso`),
  KEY `permiso` (`permiso`),
  KEY `permisos_usuario_ibfk_2` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `permisos_usuario` */

/*Table structure for table `personal` */

DROP TABLE IF EXISTS `personal`;

CREATE TABLE `personal` (
  `id_personal` int(11) NOT NULL AUTO_INCREMENT,
  `nombres_personal` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos_personal` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_personal` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `direccion_personal` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `email_personal` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `correo_institucional_personal` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_personal` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento_personal` date NOT NULL,
  `tipo_sangre_personal` int(11) NOT NULL,
  `genero_personal` int(11) NOT NULL,
  `estado_civil_personal` int(11) NOT NULL,
  `estado_personal` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_personal`),
  KEY `PERS_SCIV` (`estado_civil_personal`),
  KEY `PERS_TSAN` (`tipo_sangre_personal`),
  KEY `PERS_GEN` (`genero_personal`),
  CONSTRAINT `PERS_GEN` FOREIGN KEY (`genero_personal`) REFERENCES `generos` (`id_genero`),
  CONSTRAINT `PERS_SCIV` FOREIGN KEY (`estado_civil_personal`) REFERENCES `estados_civiles` (`id_s_civil`),
  CONSTRAINT `PERS_TSAN` FOREIGN KEY (`tipo_sangre_personal`) REFERENCES `tipos_sangre` (`id_t_sangre`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `personal` */

insert  into `personal`(`id_personal`,`nombres_personal`,`apellidos_personal`,`cedula_personal`,`direccion_personal`,`email_personal`,`correo_institucional_personal`,`telefono_personal`,`fecha_nacimiento_personal`,`tipo_sangre_personal`,`genero_personal`,`estado_civil_personal`,`estado_personal`) values (1,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(2,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(3,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,0),(4,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(5,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(6,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(7,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,0),(8,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(9,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(10,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,0),(11,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(12,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(13,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,0),(14,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(15,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(16,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(17,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(18,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(19,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(20,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(21,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(22,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(23,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(24,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(25,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(26,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(27,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(28,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(29,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(30,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(31,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(32,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(33,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(34,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(35,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(36,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(37,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(38,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(39,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(40,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(41,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(42,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(43,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(44,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(45,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(46,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(47,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(48,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(49,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(50,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(51,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(52,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(53,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(54,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(55,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(56,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(57,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(58,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(59,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(60,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(61,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(62,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(63,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(64,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(65,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(66,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(67,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(68,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(69,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(70,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(71,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(72,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(73,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(74,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(75,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(76,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(77,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(78,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(79,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(80,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(81,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(82,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(83,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(84,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(85,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(86,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(87,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(88,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(89,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(90,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(91,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(92,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(93,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(94,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(95,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(96,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(97,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(98,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1),(99,'ING. ANGELA VERONICA','ALVARADO','0703762674','LAS PALMERAS Y 25 DE JUNIO','clarynericsa@gmail.com','clarynericsa@gmail.com','0997559305','1992-05-15',1,2,1,1);

/*Table structure for table `procesador` */

DROP TABLE IF EXISTS `procesador`;

CREATE TABLE `procesador` (
  `id_procesador` int(11) NOT NULL AUTO_INCREMENT,
  `marca` int(11) NOT NULL,
  `modelo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `velocidad` int(11) NOT NULL,
  `pc` int(11) NOT NULL,
  PRIMARY KEY (`id_procesador`),
  KEY `P_M` (`marca`),
  KEY `P_MO` (`modelo`),
  KEY `P_P` (`pc`),
  KEY `P_V` (`velocidad`),
  CONSTRAINT `P_M` FOREIGN KEY (`marca`) REFERENCES `marcas_procesador` (`id_marca`),
  CONSTRAINT `P_P` FOREIGN KEY (`pc`) REFERENCES `pc` (`id_pc`),
  CONSTRAINT `P_V` FOREIGN KEY (`velocidad`) REFERENCES `velocidad_procesador` (`id_velocidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `procesador` */

/*Table structure for table `responsables_ccp` */

DROP TABLE IF EXISTS `responsables_ccp`;

CREATE TABLE `responsables_ccp` (
  `id_responsables_ccp` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dependencias` varchar(100) NOT NULL,
  `cargos` varchar(100) NOT NULL,
  PRIMARY KEY (`id_responsables_ccp`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `responsables_ccp` */

insert  into `responsables_ccp`(`id_responsables_ccp`,`nombres`,`apellidos`,`dependencias`,`cargos`) values (6,'EDISON','FLORES','LABORATORIO DE COMPUTACION DE LA ESCUELA','RESPONSABLE DEL LABORATORIO DE COMPUTO'),(7,'SOLANGE','QUISHPE','LABORATORIO DE COMPUTACION BACHILLERATO Nª 2','RESPONSABLE DE LABORATORIO DE COMPUTO');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `roles` */

insert  into `roles`(`id_role`,`role`) values (1,'Administrador'),(2,'TalentoHumano'),(3,'CentroDeComputo'),(4,'Usuario');

/*Table structure for table `solicitud_permisos` */

DROP TABLE IF EXISTS `solicitud_permisos`;

CREATE TABLE `solicitud_permisos` (
  `id_solicitud_permisos` int(11) NOT NULL AUTO_INCREMENT,
  `persona` int(11) NOT NULL,
  `motivo` int(11) NOT NULL,
  `tipo_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id_solicitud_permisos`),
  KEY `s_p_m` (`motivo`),
  KEY `s_p_t` (`tipo_permiso`),
  CONSTRAINT `s_p_m` FOREIGN KEY (`motivo`) REFERENCES `motivo_permisos` (`id_motivo_permisos`),
  CONSTRAINT `s_p_t` FOREIGN KEY (`tipo_permiso`) REFERENCES `tipo_permisos` (`id_tipo_permisos`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `solicitud_permisos` */

insert  into `solicitud_permisos`(`id_solicitud_permisos`,`persona`,`motivo`,`tipo_permiso`) values (29,1,2,1),(31,1,3,1),(32,1,1,2),(33,5,1,1);

/*Table structure for table `tecnologia` */

DROP TABLE IF EXISTS `tecnologia`;

CREATE TABLE `tecnologia` (
  `id_tecnologia` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_tecnologia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `tecnologia` */

/*Table structure for table `tipo_permisos` */

DROP TABLE IF EXISTS `tipo_permisos`;

CREATE TABLE `tipo_permisos` (
  `id_tipo_permisos` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_permiso` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_tipo_permisos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `tipo_permisos` */

insert  into `tipo_permisos`(`id_tipo_permisos`,`tipo_permiso`) values (1,'inputable'),(2,'no inputable');

/*Table structure for table `tipos_sangre` */

DROP TABLE IF EXISTS `tipos_sangre`;

CREATE TABLE `tipos_sangre` (
  `id_t_sangre` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_t_sangre` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `estado_t_sangre` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_t_sangre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `tipos_sangre` */

insert  into `tipos_sangre`(`id_t_sangre`,`descripcion_t_sangre`,`estado_t_sangre`) values (1,'A+',1);

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `imagen` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `usuario` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `pass` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ocupacion` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `role` int(11) NOT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `fecha` date NOT NULL,
  `codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`nombre`,`imagen`,`usuario`,`pass`,`email`,`phone`,`ocupacion`,`role`,`estado`,`fecha`,`codigo`) values (1,NULL,'user.png','SrtoLeon','5bae17944cfa8bd5587a430e4a48c9ec0ce68219','leon@leon.com',NULL,NULL,2,1,'2018-08-09',NULL),(2,NULL,'user.png','SartoSanchez','5bae17944cfa8bd5587a430e4a48c9ec0ce68219','sanchez@sanchez.com',NULL,NULL,3,1,'2018-08-09',NULL);

/*Table structure for table `velocidad_procesador` */

DROP TABLE IF EXISTS `velocidad_procesador`;

CREATE TABLE `velocidad_procesador` (
  `id_velocidad` int(11) NOT NULL AUTO_INCREMENT,
  `velocidad` int(11) NOT NULL,
  PRIMARY KEY (`id_velocidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `velocidad_procesador` */

/* Function  structure for function  `solicitudDiasImputable_F` */

/*!50003 DROP FUNCTION IF EXISTS `solicitudDiasImputable_F` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `solicitudDiasImputable_F`(
	id int
    ) RETURNS int(11)
BEGIN
    declare dias int;
    select sum(f.`numero`) into dias 
    from solicitud_permisos s, personal p,`fecha_permisos` f, `tipo_permisos` t
    where s.`persona` = p.`id_personal`
    and f.`solicitud_permiso` = s.`id_solicitud_permisos`
    and s.`tipo_permiso` = t.`id_tipo_permisos`
    AND t.`tipo_permiso` = 'inputable'
    and p.id_personal = id;
    
    return dias;
    END */$$
DELIMITER ;

/* Function  structure for function  `solicitudDiasNoImputable_F` */

/*!50003 DROP FUNCTION IF EXISTS `solicitudDiasNoImputable_F` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `solicitudDiasNoImputable_F`(
	id int
    ) RETURNS int(11)
BEGIN
    declare dias int;
    select sum(f.`numero`) into dias 
    from solicitud_permisos s, personal p,`fecha_permisos` f, `tipo_permisos` t
    where s.`persona` = p.`id_personal`
    and f.`solicitud_permiso` = s.`id_solicitud_permisos`
    and s.`tipo_permiso` = t.`id_tipo_permisos`
    AND t.`tipo_permiso` = 'no inputable'
    and p.id_personal = id;
    
    return dias;
    END */$$
DELIMITER ;

/* Function  structure for function  `solicitudDiasTotal_F` */

/*!50003 DROP FUNCTION IF EXISTS `solicitudDiasTotal_F` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `solicitudDiasTotal_F`(
	id int
    ) RETURNS int(11)
BEGIN
    declare dias int;
    select sum(f.`numero`) into dias 
    from solicitud_permisos s, personal p,`fecha_permisos` f, `tipo_permisos` t
    where s.`persona` = p.`id_personal`
    and f.`solicitud_permiso` = s.`id_solicitud_permisos`
    and s.`tipo_permiso` = t.`id_tipo_permisos`
    and p.id_personal = id;
    
    return dias;
    END */$$
DELIMITER ;

/* Function  structure for function  `solicitudHoraImputable_F` */

/*!50003 DROP FUNCTION IF EXISTS `solicitudHoraImputable_F` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `solicitudHoraImputable_F`(
	id int
    ) RETURNS time
BEGIN
    declare horas int;
    select SEC_TO_TIME(SUM(TIME_TO_SEC(timediff(h.`hora_entrada`,h.`hora_salida`)))) AS imputables_horas into horas 
    from solicitud_permisos s, personal p,`horas_permiso` h, `tipo_permisos` t
    where s.`persona` = p.`id_personal`
    and h.`solicitud_permiso` = s.`id_solicitud_permisos`
    and s.`tipo_permiso` = t.`id_tipo_permisos`
    and t.`tipo_permiso` = 'inputable'
    AND p.id_personal = id;
    return horas;
    END */$$
DELIMITER ;

/* Function  structure for function  `solicitudHoraNoImputable_F` */

/*!50003 DROP FUNCTION IF EXISTS `solicitudHoraNoImputable_F` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `solicitudHoraNoImputable_F`(
	id int
    ) RETURNS time
BEGIN
    declare horas int;
    select SEC_TO_TIME(SUM(TIME_TO_SEC(timediff(h.`hora_entrada`,h.`hora_salida`)))) AS imputables_horas into horas 
    from solicitud_permisos s, personal p,`horas_permiso` h, `tipo_permisos` t
    where s.`persona` = p.`id_personal`
    and h.`solicitud_permiso` = s.`id_solicitud_permisos`
    and s.`tipo_permiso` = t.`id_tipo_permisos`
    and t.`tipo_permiso` = 'no inputable'
    AND p.id_personal = id;
    return horas;
    END */$$
DELIMITER ;

/* Function  structure for function  `solicitudHoraTotal_F` */

/*!50003 DROP FUNCTION IF EXISTS `solicitudHoraTotal_F` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `solicitudHoraTotal_F`(
	id int
    ) RETURNS time
BEGIN
    declare horas int;
    select SEC_TO_TIME(SUM(TIME_TO_SEC(timediff(h.`hora_entrada`,h.`hora_salida`)))) AS imputables_horas into horas 
    from solicitud_permisos s, personal p,`horas_permiso` h, `tipo_permisos` t
    where s.`persona` = p.`id_personal`
    and h.`solicitud_permiso` = s.`id_solicitud_permisos`
    and s.`tipo_permiso` = t.`id_tipo_permisos`
    AND p.id_personal = id;
    return horas;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `estados_civil_proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `estados_civil_proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `estados_civil_proc`(
accion VARCHAR(50),
id int,
descr varchar(50),
esta tinyint
)
BEGIN
	declare estado tinyint;
	select estado_s_civil into estado from estados_civiles where id_s_civil = id;
	
	case accion
	WHEN "consulta" THEN
	SELECT id_s_civil AS id, descripcion_s_civil AS description, estado_s_civil as `status` FROM estados_civiles;
	WHEN "activos" THEN
	SELECT id_s_civil AS id, descripcion_s_civil AS description, estado_s_civil AS `status` FROM estados_civiles where estado_s_civil = 1;
	when  "insertar" then
		INSERT INTO estados_civiles (descripcion_s_civil,estado_s_civil) VALUES (descr,1);
	when "modificar" then
		UPDATE estados_civiles SET descripcion_s_civil = descr WHERE id_s_civil = id;
	WHEN "estado" THEN
		if estado = 0 then
		UPDATE estados_civiles SET estado_s_civil = 1 WHERE id_s_civil = id;
		else 
		UPDATE estados_civiles SET estado_s_civil = 0 WHERE id_s_civil = id;
		end if;
	end case;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `generos_proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `generos_proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `generos_proc`(
	accion varchar(50),
	id int,
	description varchar(25),
	estatus tinyint
    )
BEGIN
	CASE accion
	when "consulta" then 
	select id_genero as id, descripcion_genero as description, estado_genero as `status` from generos;
	when "activos" then 
	SELECT id_genero AS id, descripcion_genero AS description, estado_genero AS `status` FROM generos where estado_genero = 1;
	end case;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `insertar` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar`()
BEGIN
    
	declare n int default 1;
	while n < 100 do
		CALL `personal_insertar_proc`(
		"ING. ANGELA VERONICA","ALVARADO",
		"0703762674","LAS PALMERAS Y 25 DE JUNIO",
		"clarynericsa@gmail.com","clarynericsa@gmail.com",
		"0997559305","1992/05/15",1,2,1
		);
		SET n = n + 1;
	END WHILE;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `personal_proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `personal_proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `personal_proc`(
	accion varchar(50),
	id int,
	nom varchar(50),
	apel varchar(50),
	ced varchar(150),
	dir varchar(50),
	ema varchar(50),
	cor varchar(50),
	tel varchar(50),
	fec vaRCHAR(50),
	t_s  int,
	gen int,
	s_c int,
	est tinyint
	
    )
BEGIN
	DECLARE n TINYINT;
	SELECT estado_personal INTO n FROM personal WHERE id_personal = id;
	
	if accion = "consulta" then
	SELECT 
	id_personal AS id,nombres_personal AS `name`,
	apellidos_personal AS lastname, cedula_personal AS card,
	direccion_personal AS address, email_personal AS email,
	correo_institucional_personal AS email2, telefono_personal AS phone,
	fecha_nacimiento_personal AS birthdate, estado_personal AS state
	FROM personal;
	
	end if;
	
	if accion = "modificar" then
	update personal set
	nombres_personal = nom, apellidos_personal = apel,
	cedula_personal = ced, direccion_personal = dir,
	email_personal = ema, correo_institucional_personal = cor,
	telefono_personal = tel, fecha_nacimiento_personal = fec,
	tipo_sangre_personal = t_s, genero_personal = gen,
	estado_civil_personal = s_c, estado_personal = 1 
	where id_personal = id;
	end if;
	
	if accion = "insertar" then
	INSERT INTO personal 
	(
	nombres_personal,apellidos_personal,
	cedula_personal,direccion_personal,
	email_personal,correo_institucional_personal,
	telefono_personal,fecha_nacimiento_personal,
	tipo_sangre_personal,genero_personal,
	estado_civil_personal,estado_personal
	) values (
	nom,apel,
	ced,dir,
	ema,cor,
	tel,fec,
	t_s,gen,
	s_c,1
	);
	end if;
	
	if accion = "eliminar" then	
	if n = 0 then
	update personal set estado_personal = 1 where id_personal = id;
	else
	UPDATE personal SET estado_personal = 0 WHERE id_personal = id;
	end if;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `tipos_sangre_proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `tipos_sangre_proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `tipos_sangre_proc`(
	accion VARCHAR(15),
	id int,
	descripcion varchar(5),
	estatus tinyint
)
BEGIN
	declare estado tinyint;
	select estado_t_sangre into estado from tipos_sangre where id_t_sangre = id;
	
	case accion
	when "consulta" then
	SELECT id_t_sangre AS id, descripcion_t_sangre AS description FROM tipos_sangre;
	WHEN "activos" THEn
	SELECT id_t_sangre AS id, descripcion_t_sangre AS description FROM tipos_sangre WHERE estado_t_sangre = 1;
	WHEN "insertar" THEN
	INSERT INTO tipos_sangre (descripcion_t_sangre,estado_t_sangre) VALUES (descripcion,1);
	WHEN "modificar" THEN
	UPDATE tipos_sangre SET descripcion_t_sangre = descripcion WHERE id_t_sangre = id;
	WHEN "estado" THEN
	IF estado = 0 THEN
		UPDATE tipos_sangre SET estado_t_sangre = 1 WHERE id_t_sangre = id;
		ELSE 
		UPDATE tipos_sangre SET estado_t_sangre = 0 WHERE id_t_sangre = id;
		END IF;
	end case;
	
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `userlogin` */

/*!50003 DROP PROCEDURE IF EXISTS  `userlogin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `userlogin`(
	user_login varchar(50),
	pass_login varchar(50) 
    
    )
BEGIN
    SELECT u.`role`,u.`id`,u.`usuario`, r.role AS nombre_role FROM usuarios u,roles r 
WHERE u.role = r.id_role
AND usuario = user_login
AND pass = pass_login;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
