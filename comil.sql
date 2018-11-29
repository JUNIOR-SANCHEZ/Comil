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
CREATE DATABASE /*!32312 IF NOT EXISTS*/`comil3` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;

USE `comil3`;

/*Table structure for table `estados_civiles` */

DROP TABLE IF EXISTS `estados_civiles`;

CREATE TABLE `estados_civiles` (
  `id_s_civil` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_s_civil` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `estado_s_civil` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_s_civil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `estados_civiles` */

LOCK TABLES `estados_civiles` WRITE;

insert  into `estados_civiles`(`id_s_civil`,`descripcion_s_civil`,`estado_s_civil`) values (1,'Solteros(as)',1);

UNLOCK TABLES;

/*Table structure for table `motivos` */

DROP TABLE IF EXISTS `motivos`;

CREATE TABLE `motivos` (
  `id_mot` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_mot` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `estado_mot` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_mot`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `motivos` */

LOCK TABLES `motivos` WRITE;

insert  into `motivos`(`id_mot`,`descripcion_mot`,`estado_mot`) values (1,'Asunto Personales',1),(2,'Enfermedad',1);

UNLOCK TABLES;

/*Table structure for table `permisos` */

DROP TABLE IF EXISTS `permisos`;

CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `permiso` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `key` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `permisos` */

LOCK TABLES `permisos` WRITE;

UNLOCK TABLES;

/*Table structure for table `permisos_personas` */

DROP TABLE IF EXISTS `permisos_personas`;

CREATE TABLE `permisos_personas` (
  `id_perm` int(11) NOT NULL AUTO_INCREMENT,
  `id_motivo` int(11) NOT NULL,
  `id_personal` int(11) NOT NULL,
  `fecha_perm` date DEFAULT NULL,
  `salida_perm` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `llegada_perm` varchar(25) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `inputable_perm` tinyint(4) NOT NULL,
  `estado_perm` tinyint(4) NOT NULL,
  `tipo_perm` char(1) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `detalle_perm` varchar(150) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id_perm`),
  KEY `s_p_m` (`inputable_perm`),
  KEY `PERM_PERS` (`id_personal`),
  KEY `PERM_MOTI` (`id_motivo`),
  CONSTRAINT `PERM_MOTI` FOREIGN KEY (`id_motivo`) REFERENCES `motivos` (`id_mot`),
  CONSTRAINT `PERM_PERS` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `permisos_personas` */

LOCK TABLES `permisos_personas` WRITE;

insert  into `permisos_personas`(`id_perm`,`id_motivo`,`id_personal`,`fecha_perm`,`salida_perm`,`llegada_perm`,`inputable_perm`,`estado_perm`,`tipo_perm`,`detalle_perm`) values (2,1,1,'2018-11-26','2018-11-26','2018-11-28',1,1,'D','Viaje'),(4,1,1,'2018-11-29','29/11/2018','29/11/2018',1,1,'D','asuntos personales'),(5,1,1,'2018-11-29','30/11/2018','01/12/2018',1,1,'D','ASUNTOS PERSONALES'),(6,1,1,'2018-11-29','29/11/2018','29/11/2018',1,1,'D','ASUNTO PERSONALES'),(7,2,1,'2018-11-29','13:21','15:30',1,1,'H','CITA MEDICA');

UNLOCK TABLES;

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

LOCK TABLES `permisos_role` WRITE;

UNLOCK TABLES;

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

LOCK TABLES `permisos_usuario` WRITE;

UNLOCK TABLES;

/*Table structure for table `personal` */

DROP TABLE IF EXISTS `personal`;

CREATE TABLE `personal` (
  `id_personal` int(11) NOT NULL AUTO_INCREMENT,
  `nombres_personal` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellidos_personal` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cedula_personal` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion_personal` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email_personal` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo_institucional_personal` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono_personal` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_nacimiento_personal` date DEFAULT NULL,
  `tipo_sangre_personal` int(11) NOT NULL,
  `genero_personal` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `estado_civil_personal` int(11) NOT NULL,
  `estado_personal` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_personal`),
  KEY `PERS_SCIV` (`estado_civil_personal`),
  KEY `PERS_TSAN` (`tipo_sangre_personal`),
  KEY `PERS_GEN` (`genero_personal`),
  CONSTRAINT `PERS_SCIV` FOREIGN KEY (`estado_civil_personal`) REFERENCES `estados_civiles` (`id_s_civil`),
  CONSTRAINT `PERS_TSAN` FOREIGN KEY (`tipo_sangre_personal`) REFERENCES `tipos_sangre` (`id_t_sangre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `personal` */

LOCK TABLES `personal` WRITE;

insert  into `personal`(`id_personal`,`nombres_personal`,`apellidos_personal`,`cedula_personal`,`direccion_personal`,`email_personal`,`correo_institucional_personal`,`telefono_personal`,`fecha_nacimiento_personal`,`tipo_sangre_personal`,`genero_personal`,`estado_civil_personal`,`estado_personal`) values (1,'JUAN PABLO','AGUILAR APOLO','0706584021','CIR SUR Y PALMERA ESQ.','juag@email.com','juag@correo.com','0958421563','1885-05-06',1,'H',1,1);

UNLOCK TABLES;

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `roles` */

LOCK TABLES `roles` WRITE;

UNLOCK TABLES;

/*Table structure for table `tipos_sangre` */

DROP TABLE IF EXISTS `tipos_sangre`;

CREATE TABLE `tipos_sangre` (
  `id_t_sangre` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_t_sangre` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `estado_t_sangre` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_t_sangre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `tipos_sangre` */

LOCK TABLES `tipos_sangre` WRITE;

insert  into `tipos_sangre`(`id_t_sangre`,`descripcion_t_sangre`,`estado_t_sangre`) values (1,'A-',1),(2,'B-',1),(3,'AB+',1),(4,'A+',1);

UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `usuarios` */

LOCK TABLES `usuarios` WRITE;

UNLOCK TABLES;

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

/* Procedure structure for procedure `motivos_proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `motivos_proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `motivos_proc`(
accion varchar(50),
id int,
des varchar(50),
est tinyint
    )
BEGIN
case accion 
WHEN 'consultas' THEN
SELECT id_mot AS id,descripcion_mot AS description,estado_mot AS `status` FROM motivos;
when 'insertar' then
insert into motivos (descripcion_mot,estado_mot)  values (des,1);
when 'modificar' then 
update motivos set descripcion_mot = des, estado_mot = esta where id_mot = id;
end case;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `permisos_personas_proc` */

/*!50003 DROP PROCEDURE IF EXISTS  `permisos_personas_proc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `permisos_personas_proc`(
	accion varchar(50),
	id int,
	id_per INT,
	id_mot INT,
	fecha date,
	salida varchar(25),
	llegada VARCHAR(25),
	intputable tinyint,
	estado TINYINT,
	tipo char(1),
	detalle varchar(150)
    )
BEGIN
	case accion
	when 'consultas' then
	select 
	p.id_perm as id,		p.salida_perm as `exit`,		p.llegada_perm AS arrival,		p.inputable_perm as inputable, 
	p.estado_perm as `status`,	p.id_personal as id_per,		p.tipo_perm as tipo,			p.fecha_perm as fecha,
	p.id_motivo as id_mot,		pr.nombres_personal as `name`, 		pr.`apellidos_personal` as lastname 	
	FROM permisos_personas p, personal pr
	WHERE p.id_personal = pr.id_personal;
	
	WHEN 'consultasdia' THEN
	SELECT 
	p.id_perm AS id,		p.salida_perm AS `exit`,		p.llegada_perm AS arrival,		p.inputable_perm AS inputable, 
	p.estado_perm AS `status`, 	p.id_personal AS id_per,		p.tipo_perm AS tipo,			p.fecha_perm AS fecha,
	p.id_motivo AS id_mot,		pr.nombres_personal AS `name`,		pr.`apellidos_personal` AS lastname,	p.`detalle_perm` as description
	FROM permisos_personas p, personal pr, motivos m
	WHERE p.id_personal = pr.id_personal
	and p.id_motivo = m.id_mot
	and p.fecha_perm =  CURDATE();
	
	when 'consultaid' then
	SELECT 
	p.id_perm AS id,		p.salida_perm AS `exit`,		p.llegada_perm AS arrival, 		p.inputable_perm AS inputable, 
	p.estado_perm AS `status`, 	p.id_personal AS id_per,		p.tipo_perm AS tipo,			p.fecha_perm AS fecha,
	p.id_motivo AS id_mot,		p.`detalle_perm` AS description
	FROM permisos_personas p 	WHERE 	p.id_perm = id;
	
	when 'insertar' then
	insert into permisos_personas (
	fecha_perm,			salida_perm,				llegada_perm,				inputable_perm,
	estado_perm,			tipo_perm,				id_personal,				id_motivo, 
	detalle_perm
	) values (
	fecha,				salida,					llegada,				intputable,
	1,				tipo,					id_per,					id_mot,					
	detalle
	);
	
	when 'modificar' then
	update permisos_personas set 
	salida_perm = salida,		llegada_perm = llegada,			inputable_perm = intputable,		fecha_perm = fecha,		
	tipo_perm = tipo,		id_motivo = id_mot,			detalle_perm = detalle,			id_personal = id_per
	where id_perm = id;
	end case;
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
	gen char(1),
	s_c int,
	est tinyint
	
    )
BEGIN
	DECLARE n TINYINT;
	SELECT estado_personal INTO n FROM personal WHERE id_personal = id;
	
	CASE accion
	when "consulta" then
		SELECT 
		id_personal AS id,nombres_personal AS `name`,
		apellidos_personal AS lastname, cedula_personal AS card,
		direccion_personal AS address, email_personal AS email,
		correo_institucional_personal AS email2, telefono_personal AS phone,
		fecha_nacimiento_personal AS birthdate, tipo_sangre_personal as blood, 
		genero_personal as gender, estado_civil_personal as civil,
		estado_personal AS state
		FROM personal;
		
	WHEN "consultaid" THEN
		SELECT 
		id_personal AS id,nombres_personal AS `name`,
		apellidos_personal AS lastname, cedula_personal AS card,
		direccion_personal AS address, email_personal AS email,
		correo_institucional_personal AS email2, telefono_personal AS phone,
		fecha_nacimiento_personal AS birthdate, tipo_sangre_personal AS blood, 
		genero_personal AS gender, estado_civil_personal AS civil,
		estado_personal AS state
		FROM personal where id_personal = id;
		
	when "modificar" then
		update personal set
		nombres_personal = nom, apellidos_personal = apel,
		cedula_personal = ced, direccion_personal = dir,
		email_personal = ema, correo_institucional_personal = cor,
		telefono_personal = tel, fecha_nacimiento_personal = fec,
		tipo_sangre_personal = t_s, genero_personal = gen,
		estado_civil_personal = s_c, estado_personal = 1 
		where id_personal = id;
	
	when "insertar" then
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
	when "eliminar" then	
		if n = 0 then
		update personal set estado_personal = 1 where id_personal = id;
		else
		UPDATE personal SET estado_personal = 0 WHERE id_personal = id;
		end if;
	end case;
	
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
