-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.32 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para jfk_db
CREATE DATABASE IF NOT EXISTS `jfk_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jfk_db`;


-- Volcando estructura para tabla jfk_db.administracion_administrador
CREATE TABLE IF NOT EXISTS `administracion_administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tipo_usuario` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_b59fc33d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_administrador: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_administrador` DISABLE KEYS */;
INSERT INTO `administracion_administrador` (`id`, `nombres`, `apellidos`, `foto`, `correo`, `user_id`, `tipo_usuario`) VALUES
	(1, 'Daniel Alejandro', 'Tutalcha Ceron', '', 'alejotc@jfkennedy.edu.co', 18, 'Administrador General'),
	(2, 'Daniel Alejandro', 'Tutalcha Ceron', '', 'alejotc@jfkennedy.edu.co', 19, 'Administrador Noticias'),
	(3, 'Daniel Alejandro', 'Tutalcha Ceron', '', 'alejotc@jfkennedy.edu.co', 20, 'Administrador Multimedia'),
	(4, 'Daniel Alejandro', 'Ceron Martinez', '', 'nuevaesperanza@jfkennedy.edu.co', 30, 'Administrador General');
/*!40000 ALTER TABLE `administracion_administrador` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_album
CREATE TABLE IF NOT EXISTS `administracion_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_album: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_album` DISABLE KEYS */;
INSERT INTO `administracion_album` (`id`, `titulo`, `descripcion`, `estado`) VALUES
	(7, 'Lorem ipsum dolor. A 1', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint nobis repellendus ratione excepturi ipsum? Hic quo assumenda, tempore quisquam recusandae ipsam, voluptas consectetur. Tenetur, doloremque, provident? Dolor earum, in praesentium placeat, a soluta, ullam quas ab nesciunt excepturi ratione aperiam. Optio sit architecto pariatur perferendis, perspiciatis praesentium delectus magni consectetur recusandae fuga, ipsum tempora qui impedit at ad. Veniam autem possimus officia labore dignissimos eaque aspernatur quisquam, consequuntur deleniti accusantium in, dolorum fugit error omnis quasi a esse. Aperiam excepturi ipsum amet aliquid autem, quas ex nobis non, sapiente dolorem velit sed, minus voluptas unde officia nihil labore ipsa a natus ad ratione. Porro odio sint voluptatem mollitia provident facilis doloribus delectus architecto. Non, est accusantium omnis blanditiis voluptate molestiae temporibus, ab sit, obcaecati error ad ut ducimus quam laudantium dolorem quia inventore officiis perferendis ex tempore illo quaerat. Ipsum, distinctio aperiam expedita doloremque placeat dicta nulla. Non magnam vero sequi sit enim accusamus, eligendi veritatis dolorem quaerat fugit. Magnam maxime, non eligendi dicta ad incidunt inventore ipsam fuga id, sint iusto tempora dolor labore unde neque. Fuga est provident enim nihil numquam facere dolores, repudiandae magnam earum odio ipsa eaque quidem vel quo amet pariatur cum accusantium, alias harum!', 1),
	(8, 'Lorem ipsum dolor. A 2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint nobis repellendus ratione excepturi ipsum? Hic quo assumenda, tempore quisquam recusandae ipsam, voluptas consectetur. Tenetur, doloremque, provident? Dolor earum, in praesentium placeat, a soluta, ullam quas ab nesciunt excepturi ratione aperiam. Optio sit architecto pariatur perferendis, perspiciatis praesentium delectus magni consectetur recusandae fuga, ipsum tempora qui impedit at ad. Veniam autem possimus officia labore dignissimos eaque aspernatur quisquam, consequuntur deleniti accusantium in, dolorum fugit error omnis quasi a esse. Aperiam excepturi ipsum amet aliquid autem, quas ex nobis non, sapiente dolorem velit sed, minus voluptas unde officia nihil labore ipsa a natus ad ratione. Porro odio sint voluptatem mollitia provident facilis doloribus delectus architecto. Non, est accusantium omnis blanditiis voluptate molestiae temporibus, ab sit, obcaecati error ad ut ducimus quam laudantium dolorem quia inventore officiis perferendis ex tempore illo quaerat. Ipsum, distinctio aperiam expedita doloremque placeat dicta nulla. Non magnam vero sequi sit enim accusamus, eligendi veritatis dolorem quaerat fugit. Magnam maxime, non eligendi dicta ad incidunt inventore ipsam fuga id, sint iusto tempora dolor labore unde neque. Fuga est provident enim nihil numquam facere dolores, repudiandae magnam earum odio ipsa eaque quidem vel quo amet pariatur cum accusantium, alias harum!', 1),
	(9, 'Lorem ipsum dolor. A 3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint nobis repellendus ratione excepturi ipsum? Hic quo assumenda, tempore quisquam recusandae ipsam, voluptas consectetur. Tenetur, doloremque, provident? Dolor earum, in praesentium placeat, a soluta, ullam quas ab nesciunt excepturi ratione aperiam. Optio sit architecto pariatur perferendis, perspiciatis praesentium delectus magni consectetur recusandae fuga, ipsum tempora qui impedit at ad. Veniam autem possimus officia labore dignissimos eaque aspernatur quisquam, consequuntur deleniti accusantium in, dolorum fugit error omnis quasi a esse. Aperiam excepturi ipsum amet aliquid autem, quas ex nobis non, sapiente dolorem velit sed, minus voluptas unde officia nihil labore ipsa a natus ad ratione. Porro odio sint voluptatem mollitia provident facilis doloribus delectus architecto. Non, est accusantium omnis blanditiis voluptate molestiae temporibus, ab sit, obcaecati error ad ut ducimus quam laudantium dolorem quia inventore officiis perferendis ex tempore illo quaerat. Ipsum, distinctio aperiam expedita doloremque placeat dicta nulla. Non magnam vero sequi sit enim accusamus, eligendi veritatis dolorem quaerat fugit. Magnam maxime, non eligendi dicta ad incidunt inventore ipsam fuga id, sint iusto tempora dolor labore unde neque. Fuga est provident enim nihil numquam facere dolores, repudiandae magnam earum odio ipsa eaque quidem vel quo amet pariatur cum accusantium, alias harum!', 1),
	(10, 'Lorem ipsum dolor. A 4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint nobis repellendus ratione excepturi ipsum? Hic quo assumenda, tempore quisquam recusandae ipsam, voluptas consectetur. Tenetur, doloremque, provident? Dolor earum, in praesentium placeat, a soluta, ullam quas ab nesciunt excepturi ratione aperiam. Optio sit architecto pariatur perferendis, perspiciatis praesentium delectus magni consectetur recusandae fuga, ipsum tempora qui impedit at ad. Veniam autem possimus officia labore dignissimos eaque aspernatur quisquam, consequuntur deleniti accusantium in, dolorum fugit error omnis quasi a esse. Aperiam excepturi ipsum amet aliquid autem, quas ex nobis non, sapiente dolorem velit sed, minus voluptas unde officia nihil labore ipsa a natus ad ratione. Porro odio sint voluptatem mollitia provident facilis doloribus delectus architecto. Non, est accusantium omnis blanditiis voluptate molestiae temporibus, ab sit, obcaecati error ad ut ducimus quam laudantium dolorem quia inventore officiis perferendis ex tempore illo quaerat. Ipsum, distinctio aperiam expedita doloremque placeat dicta nulla. Non magnam vero sequi sit enim accusamus, eligendi veritatis dolorem quaerat fugit. Magnam maxime, non eligendi dicta ad incidunt inventore ipsam fuga id, sint iusto tempora dolor labore unde neque. Fuga est provident enim nihil numquam facere dolores, repudiandae magnam earum odio ipsa eaque quidem vel quo amet pariatur cum accusantium, alias harum!', 1);
/*!40000 ALTER TABLE `administracion_album` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_calendario_eventos
CREATE TABLE IF NOT EXISTS `administracion_calendario_eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `fecha` date NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `anio` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_calendario_eventos: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_calendario_eventos` DISABLE KEYS */;
INSERT INTO `administracion_calendario_eventos` (`id`, `titulo`, `imagen`, `descripcion`, `fecha`, `estado`, `anio`) VALUES
	(3, 'Lorem ipsum dolor. E 3', 'MultimediaData/calendario/Lorem ipsum dolor. E 3_1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque quidem, quasi rerum! Saepe eaque error dolores, reiciendis eligendi nesciunt voluptatibus praesentium, culpa velit sed omnis quos dicta, in ex dolorum. Dolorum earum, eligendi, sapiente sed, labore incidunt, voluptate ex maiores optio a quidem eius veritatis est sunt repellendus. Facilis,', '2017-10-07', 1, '2017'),
	(4, 'Lorem ipsum dolor. E 2', 'MultimediaData/calendario/Lorem ipsum dolor. E 3_2.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo eum quisquam libero consequuntur natus voluptatem provident rerum sunt nulla ducimus ad numquam quaerat ipsam eligendi debitis neque asperiores porro, voluptates voluptas ut sed facilis tenetur, officia, quo harum. Pariatur suscipit nihil porro, repellendus eaque nisi, nesciunt est beatae ab, voluptatum aliquid nam modi soluta explicabo doloremque voluptatem maxime quo reiciendis aut ducimus hic aperiam vitae possimus temporibus rerum. Nostrum cumque quae perferendis unde, laborum ullam tenetur nulla rerum voluptas minima harum velit iste doloribus accusamus atque sapiente qui vitae culpa, nesciunt nemo incidunt ducimus nam. Modi alias libero explicabo atque?\r\n', '2017-09-26', 0, '2017'),
	(5, 'Lorem ipsum dolor. E 1', 'MultimediaData/calendario/Lorem ipsum dolor. E 1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo eum quisquam libero consequuntur natus voluptatem provident rerum sunt nulla ducimus ad numquam quaerat ipsam eligendi debitis neque asperiores porro, voluptates voluptas ut sed facilis tenetur, officia, quo harum. Pariatur suscipit nihil porro, repellendus eaque nisi, nesciunt est beatae ab, voluptatum aliquid nam modi soluta explicabo doloremque voluptatem maxime quo reiciendis aut ducimus hic aperiam vitae possimus temporibus rerum. Nostrum cumque quae perferendis unde, laborum ullam tenetur nulla rerum voluptas minima harum velit iste doloribus accusamus atque sapiente qui vitae culpa, nesciunt nemo incidunt ducimus nam. Modi alias libero explicabo atque?\r\nEditar', '2017-01-18', 0, '2017'),
	(6, 'Lorem ipsum dolor. E 4', 'MultimediaData/calendario/Lorem ipsum dolor. E 4.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo eum quisquam libero consequuntur natus voluptatem provident rerum sunt nulla ducimus ad numquam quaerat ipsam eligendi debitis neque asperiores porro, voluptates voluptas ut sed facilis tenetur, officia, quo harum. Pariatur suscipit nihil porro, repellendus eaque nisi, nesciunt est beatae ab, voluptatum aliquid nam modi soluta explicabo doloremque voluptatem maxime quo reiciendis aut ducimus hic aperiam vitae possimus temporibus rerum. Nostrum cumque quae perferendis unde, laborum ullam tenetur nulla rerum voluptas minima harum velit iste doloribus accusamus atque sapiente qui vitae culpa, nesciunt nemo incidunt ducimus nam. Modi alias libero explicabo atque?\r\nEditar', '2017-02-24', 0, '2017'),
	(7, 'Lorem ipsum dolor. E 5', 'MultimediaData/calendario/Lorem ipsum dolor. E 5.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo eum quisquam libero consequuntur natus voluptatem provident rerum sunt nulla ducimus ad numquam quaerat ipsam eligendi debitis neque asperiores porro, voluptates voluptas ut sed facilis tenetur, officia, quo harum. Pariatur suscipit nihil porro, repellendus eaque nisi, nesciunt est beatae ab, voluptatum aliquid nam modi soluta explicabo doloremque voluptatem maxime quo reiciendis aut ducimus hic aperiam vitae possimus temporibus rerum. Nostrum cumque quae perferendis unde, laborum ullam tenetur nulla rerum voluptas minima harum velit iste doloribus accusamus atque sapiente qui vitae culpa, nesciunt nemo incidunt ducimus nam. Modi alias libero explicabo atque?\r\nEditar', '2017-03-31', 0, '2017'),
	(8, 'Lorem ipsum dolor. E 6', 'MultimediaData/calendario/Lorem ipsum dolor. E 6.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo eum quisquam libero consequuntur natus voluptatem provident rerum sunt nulla ducimus ad numquam quaerat ipsam eligendi debitis neque asperiores porro, voluptates voluptas ut sed facilis tenetur, officia, quo harum. Pariatur suscipit nihil porro, repellendus eaque nisi, nesciunt est beatae ab, voluptatum aliquid nam modi soluta explicabo doloremque voluptatem maxime quo reiciendis aut ducimus hic aperiam vitae possimus temporibus rerum. Nostrum cumque quae perferendis unde, laborum ullam tenetur nulla rerum voluptas minima harum velit iste doloribus accusamus atque sapiente qui vitae culpa, nesciunt nemo incidunt ducimus nam. Modi alias libero explicabo atque?\r\nEditar', '2017-04-12', 0, '2017'),
	(9, 'Lorem ipsum dolor. E 7', 'MultimediaData/calendario/Lorem ipsum dolor. E 7.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo eum quisquam libero consequuntur natus voluptatem provident rerum sunt nulla ducimus ad numquam quaerat ipsam eligendi debitis neque asperiores porro, voluptates voluptas ut sed facilis tenetur, officia, quo harum. Pariatur suscipit nihil porro, repellendus eaque nisi, nesciunt est beatae ab, voluptatum aliquid nam modi soluta explicabo doloremque voluptatem maxime quo reiciendis aut ducimus hic aperiam vitae possimus temporibus rerum. Nostrum cumque quae perferendis unde, laborum ullam tenetur nulla rerum voluptas minima harum velit iste doloribus accusamus atque sapiente qui vitae culpa, nesciunt nemo incidunt ducimus nam. Modi alias libero explicabo atque?\r\nEditar', '2017-05-12', 0, '2017'),
	(10, 'Lorem ipsum dolor. E 8', 'MultimediaData/calendario/Lorem ipsum dolor. E 8.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo eum quisquam libero consequuntur natus voluptatem provident rerum sunt nulla ducimus ad numquam quaerat ipsam eligendi debitis neque asperiores porro, voluptates voluptas ut sed facilis tenetur, officia, quo harum. Pariatur suscipit nihil porro, repellendus eaque nisi, nesciunt est beatae ab, voluptatum aliquid nam modi soluta explicabo doloremque voluptatem maxime quo reiciendis aut ducimus hic aperiam vitae possimus temporibus rerum. Nostrum cumque quae perferendis unde, laborum ullam tenetur nulla rerum voluptas minima harum velit iste doloribus accusamus atque sapiente qui vitae culpa, nesciunt nemo incidunt ducimus nam. Modi alias libero explicabo atque?\r\nEditar', '2017-07-03', 0, '2017'),
	(11, 'Lorem ipsum dolor. E 9', 'MultimediaData/calendario/Lorem ipsum dolor. E 9.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo eum quisquam libero consequuntur natus voluptatem provident rerum sunt nulla ducimus ad numquam quaerat ipsam eligendi debitis neque asperiores porro, voluptates voluptas ut sed facilis tenetur, officia, quo harum. Pariatur suscipit nihil porro, repellendus eaque nisi, nesciunt est beatae ab, voluptatum aliquid nam modi soluta explicabo doloremque voluptatem maxime quo reiciendis aut ducimus hic aperiam vitae possimus temporibus rerum. Nostrum cumque quae perferendis unde, laborum ullam tenetur nulla rerum voluptas minima harum velit iste doloribus accusamus atque sapiente qui vitae culpa, nesciunt nemo incidunt ducimus nam. Modi alias libero explicabo atque?\r\nEditar', '2017-07-09', 0, '2017'),
	(12, 'Lorem ipsum dolor. E 10', 'MultimediaData/calendario/Lorem ipsum dolor. E 10.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo eum quisquam libero consequuntur natus voluptatem provident rerum sunt nulla ducimus ad numquam quaerat ipsam eligendi debitis neque asperiores porro, voluptates voluptas ut sed facilis tenetur, officia, quo harum. Pariatur suscipit nihil porro, repellendus eaque nisi, nesciunt est beatae ab, voluptatum aliquid nam modi soluta explicabo doloremque voluptatem maxime quo reiciendis aut ducimus hic aperiam vitae possimus temporibus rerum. Nostrum cumque quae perferendis unde, laborum ullam tenetur nulla rerum voluptas minima harum velit iste doloribus accusamus atque sapiente qui vitae culpa, nesciunt nemo incidunt ducimus nam. Modi alias libero explicabo atque?\r\nEditar', '2017-08-19', 0, '2017'),
	(13, 'Lorem ipsum dolor. E 11', 'MultimediaData/calendario/Lorem ipsum dolor. E 11.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo eum quisquam libero consequuntur natus voluptatem provident rerum sunt nulla ducimus ad numquam quaerat ipsam eligendi debitis neque asperiores porro, voluptates voluptas ut sed facilis tenetur, officia, quo harum. Pariatur suscipit nihil porro, repellendus eaque nisi, nesciunt est beatae ab, voluptatum aliquid nam modi soluta explicabo doloremque voluptatem maxime quo reiciendis aut ducimus hic aperiam vitae possimus temporibus rerum. Nostrum cumque quae perferendis unde, laborum ullam tenetur nulla rerum voluptas minima harum velit iste doloribus accusamus atque sapiente qui vitae culpa, nesciunt nemo incidunt ducimus nam. Modi alias libero explicabo atque? Editar\r\nEditar', '2017-11-23', 1, '2017'),
	(14, 'Lorem ipsum dolor. E 12', 'MultimediaData/calendario/Lorem ipsum dolor. E 12.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo eum quisquam libero consequuntur natus voluptatem provident rerum sunt nulla ducimus ad numquam quaerat ipsam eligendi debitis neque asperiores porro, voluptates voluptas ut sed facilis tenetur, officia, quo harum. Pariatur suscipit nihil porro, repellendus eaque nisi, nesciunt est beatae ab, voluptatum aliquid nam modi soluta explicabo doloremque voluptatem maxime quo reiciendis aut ducimus hic aperiam vitae possimus temporibus rerum. Nostrum cumque quae perferendis unde, laborum ullam tenetur nulla rerum voluptas minima harum velit iste doloribus accusamus atque sapiente qui vitae culpa, nesciunt nemo incidunt ducimus nam. Modi alias libero explicabo atque? Editar\r\nEditar', '2017-12-02', 1, '2017');
/*!40000 ALTER TABLE `administracion_calendario_eventos` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_docente
CREATE TABLE IF NOT EXISTS `administracion_docente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `curso` varchar(100) NOT NULL,
  `jornada` varchar(100) NOT NULL,
  `sede_id` int(11) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `administracion_docente_af904988` (`sede_id`),
  CONSTRAINT `sede_id_refs_id_0c7f48c4` FOREIGN KEY (`sede_id`) REFERENCES `administracion_sede` (`id`),
  CONSTRAINT `user_id_refs_id_06e4ddf5` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_docente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_docente` DISABLE KEYS */;
INSERT INTO `administracion_docente` (`id`, `nombres`, `apellidos`, `foto`, `correo`, `user_id`, `curso`, `jornada`, `sede_id`, `tipo`) VALUES
	(1, 'Daniel Alejandro', 'Tutalcha Ceron', 'MultimediaData/persona/foto_28.jpeg', 'alejotc@jfkennedy.edu.co', 5, 'Biologia', 'Tarde', 1, 'Docente'),
	(2, 'Ider Marina', 'Ceron Martinez', 'MultimediaData/persona/foto_27.jpeg', 'alejotc@jfkennedy.edu.co', 17, 'Primero B', 'Mañana', 1, 'Docente'),
	(3, 'Daniel Alejandro', 'Ceron Martinez', 'MultimediaData/persona/foto_29.jpeg', 'nuevaesperanza@jfkennedy.edu.co', 29, 'Español', 'Tarde', 1, 'Docente');
/*!40000 ALTER TABLE `administracion_docente` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_documento
CREATE TABLE IF NOT EXISTS `administracion_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `documento` varchar(100) NOT NULL,
  `materia` varchar(20) NOT NULL,
  `grado` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` longtext NOT NULL,
  `autor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administracion_documento_40e8bcf3` (`autor_id`),
  CONSTRAINT `autor_id_refs_id_5cad8bc8` FOREIGN KEY (`autor_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_documento: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_documento` DISABLE KEYS */;
INSERT INTO `administracion_documento` (`id`, `titulo`, `documento`, `materia`, `grado`, `fecha`, `descripcion`, `autor_id`) VALUES
	(2, 'Lorem ipsum dolor. D2', 'MultimediaData/documentos/colombia.jpg', '', '', '2017-09-08', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, neque iste modi debitis aliquam, ea assumenda maxime in architecto enim!', 3),
	(3, 'Lorem ipsum dolor. D3', 'MultimediaData/documentos/imagen7.jpg', 'Español', 'Noveno', '2017-09-08', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, neque iste modi debitis aliquam, ea assumenda maxime in architecto enim!', 5),
	(4, 'Lorem ipsum dolor. D 5', 'MultimediaData/documentos/escudo.jpg', '', '', '2017-09-08', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, neque iste modi debitis aliquam, ea assumenda maxime in architecto enim!', 2),
	(5, 'Lorem ipsum dolor. D5', 'MultimediaData/documentos/1796746_893236214029319_4204449933833340470_o-672x372_1.jpg', 'Ingles', 'Octavo', '2017-09-08', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, neque iste modi debitis aliquam, ea assumenda maxime in architecto enim!', 5),
	(6, 'Lorem ipsum dolor. D6', 'MultimediaData/documentos/colombia_1.jpg', '', '', '2017-09-10', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, neque iste modi debitis aliquam, ea assumenda maxime in architecto enim!', 4),
	(7, 'Lorem ipsum dolor. D 7', 'MultimediaData/documentos/imagen8.jpeg', 'Ingles', 'Septimo', '2017-09-19', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, neque iste modi debitis aliquam, ea assumenda maxime in architecto enim!', 5);
/*!40000 ALTER TABLE `administracion_documento` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_estudiante
CREATE TABLE IF NOT EXISTS `administracion_estudiante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `identificacion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identificacion` (`identificacion`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_0ccaa4d5` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_estudiante: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_estudiante` DISABLE KEYS */;
INSERT INTO `administracion_estudiante` (`id`, `nombres`, `apellidos`, `foto`, `correo`, `user_id`, `identificacion`) VALUES
	(2, 'Daniel Alejandro', 'Tutalcha Ceron', '', 'alejandro-177-@hotmail.com', 13, '1061692955'),
	(3, 'Nasly Yaritza ', 'Casañas Campos', '', 'alejandro-177-@hotmail.com', 14, '1059913733');
/*!40000 ALTER TABLE `administracion_estudiante` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_funcionario
CREATE TABLE IF NOT EXISTS `administracion_funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `jornada` varchar(100) NOT NULL,
  `tipo_funcionario` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_3820f52f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_funcionario: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_funcionario` DISABLE KEYS */;
INSERT INTO `administracion_funcionario` (`id`, `nombres`, `apellidos`, `foto`, `correo`, `user_id`, `jornada`, `tipo_funcionario`) VALUES
	(1, 'Oliveiro ', 'Chilito Bravo', 'MultimediaData/persona/foto_21.jpeg', 'oliveiro@jfkennedy.edu.co', 2, '', 'Rector'),
	(2, 'Daniel Alejandro', 'Tutalcha Ceron', 'MultimediaData/persona/foto_22.jpeg', 'alejotc@jfkennedy.edu.co', 3, 'Mañana', 'Coordinador'),
	(3, 'Daniel Alejandro', 'Tutalcha Ceron', 'MultimediaData/persona/foto_23.jpeg', 'alejotc@jfkennedy.edu.co', 4, 'Tarde', 'Coordinador'),
	(4, 'Daniel Alejandro', 'Tutalcha Ceron', 'MultimediaData/persona/foto_25.jpeg', 'alejotc@jfkennedy.edu.co', 15, 'Mañana', 'Coordinador'),
	(5, 'Daniel Alejandro', 'Tutalcha Ceron', 'MultimediaData/persona/foto_26.jpeg', 'alejotc@jfkennedy.edu.co', 16, 'Tarde', 'Coordinador'),
	(6, 'Daniel Alejandro', 'Tutalcha Ceron', 'MultimediaData/persona/imagen6.jpeg', 'alejandro', 21, 'Tarde', 'Coordinador'),
	(10, 'Daniel Alejandro', 'Tutalcha Ceron', 'MultimediaData/persona/imagen9.jpg', 'coordinador6@jfkennedy.edu.co', 27, 'Mañana', 'Coordinador'),
	(11, 'Daniel Alejandro', 'Tutalcha Ceron', 'MultimediaData/persona/imagen4.jpg', 'coordinador7@jfkennedy.edu.co', 28, 'Tarde', 'Coordinador');
/*!40000 ALTER TABLE `administracion_funcionario` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_imagen_album
CREATE TABLE IF NOT EXISTS `administracion_imagen_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) NOT NULL,
  `album_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administracion_imagen_album_6781e42a` (`album_id`),
  CONSTRAINT `album_id_refs_id_f2009e39` FOREIGN KEY (`album_id`) REFERENCES `administracion_album` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_imagen_album: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_imagen_album` DISABLE KEYS */;
INSERT INTO `administracion_imagen_album` (`id`, `imagen`, `album_id`) VALUES
	(40, 'MultimediaData/album/books-student-study-education.jpg', 7),
	(41, 'MultimediaData/album/champagner-toasting-new-year-s-eve-drink.jpg', 7),
	(42, 'MultimediaData/album/people-woman-coffee-meeting.jpg', 7),
	(43, 'MultimediaData/album/pexels-photo (1).jpg', 7),
	(44, 'MultimediaData/album/pexels-photo-258112.jpeg', 7),
	(45, 'MultimediaData/album/pexels-photo-261909.jpeg', 7),
	(47, 'MultimediaData/album/pexels-photo-265076.jpeg', 8),
	(48, 'MultimediaData/album/pexels-photo-272976.jpeg', 8),
	(49, 'MultimediaData/album/pexels-photo-336407.jpeg', 8),
	(50, 'MultimediaData/album/pexels-photo-459793.jpeg', 8),
	(51, 'MultimediaData/album/pexels-photo-595804.jpeg', 8),
	(52, 'MultimediaData/album/books-student-study-education_1.jpg', 9),
	(53, 'MultimediaData/album/people-woman-coffee-meeting_1.jpg', 9),
	(54, 'MultimediaData/album/pexels-photo-258112_1.jpeg', 9),
	(55, 'MultimediaData/album/pexels-photo-262485_1.jpeg', 9),
	(56, 'MultimediaData/album/pexels-photo-272976_1.jpeg', 9),
	(57, 'MultimediaData/album/pexels-photo-459793_1.jpeg', 9),
	(58, 'MultimediaData/album/champagner-toasting-new-year-s-eve-drink_1.jpg', 10),
	(59, 'MultimediaData/album/pexels-photo (1)_1.jpg', 10),
	(60, 'MultimediaData/album/pexels-photo-261909_1.jpeg', 10),
	(61, 'MultimediaData/album/pexels-photo-265076_1.jpeg', 10),
	(62, 'MultimediaData/album/pexels-photo-336407_1.jpeg', 10),
	(63, 'MultimediaData/album/pexels-photo-595804_1.jpeg', 10),
	(64, 'MultimediaData/album/pexels-photo-261909_2.jpeg', 8);
/*!40000 ALTER TABLE `administracion_imagen_album` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_inscripcion
CREATE TABLE IF NOT EXISTS `administracion_inscripcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres_alumno` varchar(50) NOT NULL,
  `apellidos_alumno` varchar(50) NOT NULL,
  `edad` varchar(2) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `identificacion` varchar(15) NOT NULL,
  `telefono_1` varchar(15) NOT NULL,
  `telefono_2` varchar(15) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `oferta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administracion_inscripcion_72d14715` (`oferta_id`),
  CONSTRAINT `oferta_id_refs_id_911af74e` FOREIGN KEY (`oferta_id`) REFERENCES `administracion_oferta_educativa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_inscripcion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_inscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `administracion_inscripcion` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_institucion
CREATE TABLE IF NOT EXISTS `administracion_institucion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rector_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `escudo` varchar(100) NOT NULL,
  `estudiantes` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rector_id` (`rector_id`),
  CONSTRAINT `rector_id_refs_id_317da98a` FOREIGN KEY (`rector_id`) REFERENCES `administracion_funcionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_institucion: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_institucion` DISABLE KEYS */;
INSERT INTO `administracion_institucion` (`id`, `rector_id`, `nombre`, `escudo`, `estudiantes`) VALUES
	(1, 1, 'John F. Kennedy', 'MultimediaData/escudo/John F. Kennedy_5.jpg', 'MultimediaData/doc_estudiantes/estudiantes.xlsx');
/*!40000 ALTER TABLE `administracion_institucion` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_noticia
CREATE TABLE IF NOT EXISTS `administracion_noticia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `copete` longtext NOT NULL,
  `cuerpo` longtext NOT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `autor` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_noticia: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_noticia` DISABLE KEYS */;
INSERT INTO `administracion_noticia` (`id`, `titulo`, `copete`, `cuerpo`, `fecha`, `imagen`, `autor`, `estado`) VALUES
	(1, 'Lorem ipsum dolor. N 1', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia rerum accusamus, ad modi sunt animi ab aperiam vero ipsa ducimus necessitatibus architecto, omnis obcaecati voluptate excepturi repellendus asperiores ipsum. Eum voluptas, quia laudantium molestiae. Aliquam esse libero, numquam explicabo vero qui eligendi fuga doloribus illo quod veniam mollitia! Maiores omnis placeat, possimus error delectus reprehenderit! Quo eveniet quod, recusandae nesciunt iure eligendi nemo fugit fuga, ad error rem, beatae similique vel soluta. Amet deserunt culpa optio quo rem, adipisci, provident aliquid laboriosam ullam, facere error rerum! Sunt nobis dicta maiores at voluptates esse sapiente laudantium. Nam minus nisi consectetur quia.\r\n', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex modi, necessitatibus natus iure ab enim vitae expedita excepturi possimus ut, ducimus autem. Magnam consequuntur optio facilis quaerat numquam sapiente eos repellendus nesciunt illo reiciendis libero unde enim perspiciatis in aperiam iste, neque aspernatur, mollitia suscipit dolore deserunt blanditiis. A laborum asperiores consequuntur, fugiat quam itaque, ipsum nemo ea animi ipsam quos illo reprehenderit nostrum, amet consequatur. Optio, excepturi quis obcaecati est, illo nam cumque dolor similique provident doloremque eum dolores perspiciatis laudantium tempore harum enim expedita! Suscipit facere cumque sit dignissimos odio vero repellat officiis pariatur similique obcaecati, illum dolorem sint delectus at magni voluptate inventore molestiae consequatur numquam blanditiis id? Velit voluptate delectus sed a ipsam maxime eos alias cupiditate architecto excepturi magnam adipisci, impedit voluptatem. Iure enim fugiat, nihil alias nam sapiente nostrum. Eius sunt qui, atque aliquid, numquam sed! Natus quidem provident, odio quasi illum, sequi deserunt non voluptate aliquid eius aspernatur corporis, tempore perferendis magnam. Sapiente mollitia vero dolorem quod a ipsam suscipit nobis ut, praesentium quibusdam amet quos autem quam ipsa, totam deleniti. Velit consectetur itaque voluptatum, quam neque maiores quos assumenda deleniti dolore. Ipsa expedita suscipit totam, cum tempore officia nobis sapiente, quam voluptate provident eum recusandae similique odit repellendus animi repellat natus quidem. Assumenda nihil debitis quibusdam illo sint officiis repellat nostrum saepe maxime excepturi. Molestias quisquam consectetur non quia, praesentium adipisci, voluptas odio repellat rem vitae quod. Nemo atque sequi minima deserunt necessitatibus! Nihil eos laudantium dolorum iusto! Deserunt neque ex placeat magni commodi beatae, quos nam numquam iusto exercitationem alias impedit, doloribus. Officia doloribus, similique ullam ratione vero, iusto neque dolore libero natus eaque, deleniti nulla animi distinctio modi quam dolor! Ducimus aliquam ea, accusamus voluptates recusandae, sapiente explicabo fuga. Quo dolorem molestias facilis dolorum qui facere iste molestiae natus! Nesciunt.\r\n', '2017-09-25', 'MultimediaData/noticias/Lorem ipsum dolor. N 1_2017-09-25.jpg', 'Lorem ipsum dolor', 1),
	(2, 'Lorem ipsum dolor. N 2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia rerum accusamus, ad modi sunt animi ab aperiam vero ipsa ducimus necessitatibus architecto, omnis obcaecati voluptate excepturi repellendus asperiores ipsum. Eum voluptas, quia laudantium molestiae. Aliquam esse libero, numquam explicabo vero qui eligendi fuga doloribus illo quod veniam mollitia! Maiores omnis placeat, possimus error delectus reprehenderit! Quo eveniet quod, recusandae nesciunt iure eligendi nemo fugit fuga, ad error rem, beatae similique vel soluta. Amet deserunt culpa optio quo rem, adipisci, provident aliquid laboriosam ullam, facere error rerum! Sunt nobis dicta maiores at voluptates esse sapiente laudantium. Nam minus nisi consectetur quia.\r\n\r\n', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex modi, necessitatibus natus iure ab enim vitae expedita excepturi possimus ut, ducimus autem. Magnam consequuntur optio facilis quaerat numquam sapiente eos repellendus nesciunt illo reiciendis libero unde enim perspiciatis in aperiam iste, neque aspernatur, mollitia suscipit dolore deserunt blanditiis. A laborum asperiores consequuntur, fugiat quam itaque, ipsum nemo ea animi ipsam quos illo reprehenderit nostrum, amet consequatur. Optio, excepturi quis obcaecati est, illo nam cumque dolor similique provident doloremque eum dolores perspiciatis laudantium tempore harum enim expedita! Suscipit facere cumque sit dignissimos odio vero repellat officiis pariatur similique obcaecati, illum dolorem sint delectus at magni voluptate inventore molestiae consequatur numquam blanditiis id? Velit voluptate delectus sed a ipsam maxime eos alias cupiditate architecto excepturi magnam adipisci, impedit voluptatem. Iure enim fugiat, nihil alias nam sapiente nostrum. Eius sunt qui, atque aliquid, numquam sed! Natus quidem provident, odio quasi illum, sequi deserunt non voluptate aliquid eius aspernatur corporis, tempore perferendis magnam. Sapiente mollitia vero dolorem quod a ipsam suscipit nobis ut, praesentium quibusdam amet quos autem quam ipsa, totam deleniti. Velit consectetur itaque voluptatum, quam neque maiores quos assumenda deleniti dolore. Ipsa expedita suscipit totam, cum tempore officia nobis sapiente, quam voluptate provident eum recusandae similique odit repellendus animi repellat natus quidem. Assumenda nihil debitis quibusdam illo sint officiis repellat nostrum saepe maxime excepturi. Molestias quisquam consectetur non quia, praesentium adipisci, voluptas odio repellat rem vitae quod. Nemo atque sequi minima deserunt necessitatibus! Nihil eos laudantium dolorum iusto! Deserunt neque ex placeat magni commodi beatae, quos nam numquam iusto exercitationem alias impedit, doloribus. Officia doloribus, similique ullam ratione vero, iusto neque dolore libero natus eaque, deleniti nulla animi distinctio modi quam dolor! Ducimus aliquam ea, accusamus voluptates recusandae, sapiente explicabo fuga. Quo dolorem molestias facilis dolorum qui facere iste molestiae natus! Nesciunt.\r\n', '2017-09-25', 'MultimediaData/noticias/Lorem ipsum dolor. N 2_2017-09-25.jpg', 'Lorem ipsum dolor', 1),
	(3, 'Lorem ipsum dolor. N 3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia rerum accusamus, ad modi sunt animi ab aperiam vero ipsa ducimus necessitatibus architecto, omnis obcaecati voluptate excepturi repellendus asperiores ipsum. Eum voluptas, quia laudantium molestiae. Aliquam esse libero, numquam explicabo vero qui eligendi fuga doloribus illo quod veniam mollitia! Maiores omnis placeat, possimus error delectus reprehenderit! Quo eveniet quod, recusandae nesciunt iure eligendi nemo fugit fuga, ad error rem, beatae similique vel soluta. Amet deserunt culpa optio quo rem, adipisci, provident aliquid laboriosam ullam, facere error rerum! Sunt nobis dicta maiores at voluptates esse sapiente laudantium. Nam minus nisi consectetur quia.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex modi, necessitatibus natus iure ab enim vitae expedita excepturi possimus ut, ducimus autem. Magnam consequuntur optio facilis quaerat numquam sapiente eos repellendus nesciunt illo reiciendis libero unde enim perspiciatis in aperiam iste, neque aspernatur, mollitia suscipit dolore deserunt blanditiis. A laborum asperiores consequuntur, fugiat quam itaque, ipsum nemo ea animi ipsam quos illo reprehenderit nostrum, amet consequatur. Optio, excepturi quis obcaecati est, illo nam cumque dolor similique provident doloremque eum dolores perspiciatis laudantium tempore harum enim expedita! Suscipit facere cumque sit dignissimos odio vero repellat officiis pariatur similique obcaecati, illum dolorem sint delectus at magni voluptate inventore molestiae consequatur numquam blanditiis id? Velit voluptate delectus sed a ipsam maxime eos alias cupiditate architecto excepturi magnam adipisci, impedit voluptatem. Iure enim fugiat, nihil alias nam sapiente nostrum. Eius sunt qui, atque aliquid, numquam sed! Natus quidem provident, odio quasi illum, sequi deserunt non voluptate aliquid eius aspernatur corporis, tempore perferendis magnam. Sapiente mollitia vero dolorem quod a ipsam suscipit nobis ut, praesentium quibusdam amet quos autem quam ipsa, totam deleniti. Velit consectetur itaque voluptatum, quam neque maiores quos assumenda deleniti dolore. Ipsa expedita suscipit totam, cum tempore officia nobis sapiente, quam voluptate provident eum recusandae similique odit repellendus animi repellat natus quidem. Assumenda nihil debitis quibusdam illo sint officiis repellat nostrum saepe maxime excepturi. Molestias quisquam consectetur non quia, praesentium adipisci, voluptas odio repellat rem vitae quod. Nemo atque sequi minima deserunt necessitatibus! Nihil eos laudantium dolorum iusto! Deserunt neque ex placeat magni commodi beatae, quos nam numquam iusto exercitationem alias impedit, doloribus. Officia doloribus, similique ullam ratione vero, iusto neque dolore libero natus eaque, deleniti nulla animi distinctio modi quam dolor! Ducimus aliquam ea, accusamus voluptates recusandae, sapiente explicabo fuga. Quo dolorem molestias facilis dolorum qui facere iste molestiae natus! Nesciunt.', '2017-10-04', 'MultimediaData/noticias/Lorem ipsum dolor. N 3_2017-10-04.jpg', 'Lorem ipsum dolor', 1),
	(4, 'Lorem ipsum dolor. N 4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia rerum accusamus, ad modi sunt animi ab aperiam vero ipsa ducimus necessitatibus architecto, omnis obcaecati voluptate excepturi repellendus asperiores ipsum. Eum voluptas, quia laudantium molestiae. Aliquam esse libero, numquam explicabo vero qui eligendi fuga doloribus illo quod veniam mollitia! Maiores omnis placeat, possimus error delectus reprehenderit! Quo eveniet quod, recusandae nesciunt iure eligendi nemo fugit fuga, ad error rem, beatae similique vel soluta. Amet deserunt culpa optio quo rem, adipisci, provident aliquid laboriosam ullam, facere error rerum! Sunt nobis dicta maiores at voluptates esse sapiente laudantium. Nam minus nisi consectetur quia.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex modi, necessitatibus natus iure ab enim vitae expedita excepturi possimus ut, ducimus autem. Magnam consequuntur optio facilis quaerat numquam sapiente eos repellendus nesciunt illo reiciendis libero unde enim perspiciatis in aperiam iste, neque aspernatur, mollitia suscipit dolore deserunt blanditiis. A laborum asperiores consequuntur, fugiat quam itaque, ipsum nemo ea animi ipsam quos illo reprehenderit nostrum, amet consequatur. Optio, excepturi quis obcaecati est, illo nam cumque dolor similique provident doloremque eum dolores perspiciatis laudantium tempore harum enim expedita! Suscipit facere cumque sit dignissimos odio vero repellat officiis pariatur similique obcaecati, illum dolorem sint delectus at magni voluptate inventore molestiae consequatur numquam blanditiis id? Velit voluptate delectus sed a ipsam maxime eos alias cupiditate architecto excepturi magnam adipisci, impedit voluptatem. Iure enim fugiat, nihil alias nam sapiente nostrum. Eius sunt qui, atque aliquid, numquam sed! Natus quidem provident, odio quasi illum, sequi deserunt non voluptate aliquid eius aspernatur corporis, tempore perferendis magnam. Sapiente mollitia vero dolorem quod a ipsam suscipit nobis ut, praesentium quibusdam amet quos autem quam ipsa, totam deleniti. Velit consectetur itaque voluptatum, quam neque maiores quos assumenda deleniti dolore. Ipsa expedita suscipit totam, cum tempore officia nobis sapiente, quam voluptate provident eum recusandae similique odit repellendus animi repellat natus quidem. Assumenda nihil debitis quibusdam illo sint officiis repellat nostrum saepe maxime excepturi. Molestias quisquam consectetur non quia, praesentium adipisci, voluptas odio repellat rem vitae quod. Nemo atque sequi minima deserunt necessitatibus! Nihil eos laudantium dolorum iusto! Deserunt neque ex placeat magni commodi beatae, quos nam numquam iusto exercitationem alias impedit, doloribus. Officia doloribus, similique ullam ratione vero, iusto neque dolore libero natus eaque, deleniti nulla animi distinctio modi quam dolor! Ducimus aliquam ea, accusamus voluptates recusandae, sapiente explicabo fuga. Quo dolorem molestias facilis dolorum qui facere iste molestiae natus! Nesciunt.', '2017-10-04', 'MultimediaData/noticias/Lorem ipsum dolor. N 4_2017-10-04.jpg', 'Lorem ipsum dolor', 1),
	(5, 'Lorem ipsum dolor. N 5', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia rerum accusamus, ad modi sunt animi ab aperiam vero ipsa ducimus necessitatibus architecto, omnis obcaecati voluptate excepturi repellendus asperiores ipsum. Eum voluptas, quia laudantium molestiae. Aliquam esse libero, numquam explicabo vero qui eligendi fuga doloribus illo quod veniam mollitia! Maiores omnis placeat, possimus error delectus reprehenderit! Quo eveniet quod, recusandae nesciunt iure eligendi nemo fugit fuga, ad error rem, beatae similique vel soluta. Amet deserunt culpa optio quo rem, adipisci, provident aliquid laboriosam ullam, facere error rerum! Sunt nobis dicta maiores at voluptates esse sapiente laudantium. Nam minus nisi consectetur quia.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex modi, necessitatibus natus iure ab enim vitae expedita excepturi possimus ut, ducimus autem. Magnam consequuntur optio facilis quaerat numquam sapiente eos repellendus nesciunt illo reiciendis libero unde enim perspiciatis in aperiam iste, neque aspernatur, mollitia suscipit dolore deserunt blanditiis. A laborum asperiores consequuntur, fugiat quam itaque, ipsum nemo ea animi ipsam quos illo reprehenderit nostrum, amet consequatur. Optio, excepturi quis obcaecati est, illo nam cumque dolor similique provident doloremque eum dolores perspiciatis laudantium tempore harum enim expedita! Suscipit facere cumque sit dignissimos odio vero repellat officiis pariatur similique obcaecati, illum dolorem sint delectus at magni voluptate inventore molestiae consequatur numquam blanditiis id? Velit voluptate delectus sed a ipsam maxime eos alias cupiditate architecto excepturi magnam adipisci, impedit voluptatem. Iure enim fugiat, nihil alias nam sapiente nostrum. Eius sunt qui, atque aliquid, numquam sed! Natus quidem provident, odio quasi illum, sequi deserunt non voluptate aliquid eius aspernatur corporis, tempore perferendis magnam. Sapiente mollitia vero dolorem quod a ipsam suscipit nobis ut, praesentium quibusdam amet quos autem quam ipsa, totam deleniti. Velit consectetur itaque voluptatum, quam neque maiores quos assumenda deleniti dolore. Ipsa expedita suscipit totam, cum tempore officia nobis sapiente, quam voluptate provident eum recusandae similique odit repellendus animi repellat natus quidem. Assumenda nihil debitis quibusdam illo sint officiis repellat nostrum saepe maxime excepturi. Molestias quisquam consectetur non quia, praesentium adipisci, voluptas odio repellat rem vitae quod. Nemo atque sequi minima deserunt necessitatibus! Nihil eos laudantium dolorum iusto! Deserunt neque ex placeat magni commodi beatae, quos nam numquam iusto exercitationem alias impedit, doloribus. Officia doloribus, similique ullam ratione vero, iusto neque dolore libero natus eaque, deleniti nulla animi distinctio modi quam dolor! Ducimus aliquam ea, accusamus voluptates recusandae, sapiente explicabo fuga. Quo dolorem molestias facilis dolorum qui facere iste molestiae natus! Nesciunt.', '2017-10-04', 'MultimediaData/noticias/Lorem ipsum dolor. N 5_2017-10-04.jpg', 'Lorem ipsum dolor', 1);
/*!40000 ALTER TABLE `administracion_noticia` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_oferta_educativa
CREATE TABLE IF NOT EXISTS `administracion_oferta_educativa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_apertura` date NOT NULL,
  `fecha_cierre` date NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `nivel` varchar(100) NOT NULL,
  `grado` varchar(100) NOT NULL,
  `cupos` int(11) NOT NULL,
  `cupos_disponibles` int(11) NOT NULL,
  `jornada` varchar(10) NOT NULL,
  `sede_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administracion_oferta_educativa_af904988` (`sede_id`),
  CONSTRAINT `sede_id_refs_id_cfcf61e6` FOREIGN KEY (`sede_id`) REFERENCES `administracion_sede` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_oferta_educativa: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_oferta_educativa` DISABLE KEYS */;
INSERT INTO `administracion_oferta_educativa` (`id`, `fecha_apertura`, `fecha_cierre`, `estado`, `nivel`, `grado`, `cupos`, `cupos_disponibles`, `jornada`, `sede_id`) VALUES
	(2, '2017-09-18', '2017-10-03', 0, 'Basica Secundaria', 'Septimo', 10, 7, 'Tarde', 1),
	(3, '2017-09-25', '2017-10-04', 1, 'Basica Secundaria', 'Septimo', 28, 25, 'Tarde', 1),
	(4, '2017-10-04', '2017-10-29', 1, 'Basica Primaria', 'Segundo', 30, 30, 'Mañana', 1),
	(5, '2017-10-03', '2017-10-29', 1, 'Preescolar', 'Preescolar', 30, 30, 'Mañana', 1),
	(6, '2017-10-05', '2017-11-01', 0, 'Preescolar', 'Preescolar', 30, 30, 'Mañana', 2),
	(7, '2017-10-01', '2017-10-28', 1, 'Basica Primaria', 'Cuarto', 30, 30, 'Mañana', 2),
	(8, '2017-10-04', '2017-10-19', 1, 'Basica Primaria', 'Tercero', 30, 30, 'Tarde', 2),
	(9, '2017-10-05', '2017-10-28', 0, 'Basica Primaria', 'Quinto', 30, 30, 'Tarde', 2),
	(10, '2017-10-04', '2017-10-27', 1, 'Basica Primaria', 'Segundo', 30, 30, 'Mañana', 9),
	(11, '2017-10-04', '2017-10-12', 1, 'Preescolar', 'Preescolar', 30, 30, 'Mañana', 9);
/*!40000 ALTER TABLE `administracion_oferta_educativa` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_sede
CREATE TABLE IF NOT EXISTS `administracion_sede` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `nit` varchar(100) NOT NULL,
  `telefono_1` varchar(10) NOT NULL,
  `telefono_2` varchar(10) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `institucion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `administracion_sede_01d59ba2` (`institucion_id`),
  CONSTRAINT `institucion_id_refs_id_d443ae69` FOREIGN KEY (`institucion_id`) REFERENCES `administracion_institucion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_sede: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_sede` DISABLE KEYS */;
INSERT INTO `administracion_sede` (`id`, `nombre`, `nit`, `telefono_1`, `telefono_2`, `direccion`, `correo`, `institucion_id`) VALUES
	(1, 'John F. Kennedy', '800137367-9', '8382650', '8382650', 'Carrera 18 No. 7 32', 'alejotc@jfkennedy.edu.co', 1),
	(2, 'Jose Maria Obando', '800137367-9', '8382650', '8382650', 'Carrera 18 No. 7 32', 'jmobando@jfkennedy.edu.co', 1),
	(9, 'Nueva Esperanza', '123456789-2', '3196688928', '3196688928', 'Carerra 33 # 20-23', 'nuevaesperanza@jfkennedy.edu.co', 1);
/*!40000 ALTER TABLE `administracion_sede` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_sede_coordinadores
CREATE TABLE IF NOT EXISTS `administracion_sede_coordinadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sede_id` int(11) NOT NULL,
  `funcionario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sede_id` (`sede_id`,`funcionario_id`),
  KEY `administracion_sede_coordinadores_af904988` (`sede_id`),
  KEY `administracion_sede_coordinadores_22ee2d5e` (`funcionario_id`),
  CONSTRAINT `funcionario_id_refs_id_03aeef95` FOREIGN KEY (`funcionario_id`) REFERENCES `administracion_funcionario` (`id`),
  CONSTRAINT `sede_id_refs_id_659dabd4` FOREIGN KEY (`sede_id`) REFERENCES `administracion_sede` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_sede_coordinadores: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_sede_coordinadores` DISABLE KEYS */;
INSERT INTO `administracion_sede_coordinadores` (`id`, `sede_id`, `funcionario_id`) VALUES
	(1, 1, 2),
	(2, 1, 3),
	(3, 2, 4),
	(4, 2, 5),
	(5, 9, 10),
	(6, 9, 11);
/*!40000 ALTER TABLE `administracion_sede_coordinadores` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.administracion_slider_show
CREATE TABLE IF NOT EXISTS `administracion_slider_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.administracion_slider_show: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `administracion_slider_show` DISABLE KEYS */;
INSERT INTO `administracion_slider_show` (`id`, `imagen`, `estado`) VALUES
	(5, 'MultimediaData/slider/imagen1.jpg', 1),
	(6, 'MultimediaData/slider/imagen2.jpg', 1),
	(8, 'MultimediaData/slider/imagen4.jpg', 1),
	(9, 'MultimediaData/slider/photo.jpg', 1);
/*!40000 ALTER TABLE `administracion_slider_show` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.auth_group: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.auth_group_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.auth_permission: ~63 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add permission', 1, 'add_permission'),
	(2, 'Can change permission', 1, 'change_permission'),
	(3, 'Can delete permission', 1, 'delete_permission'),
	(4, 'Can add group', 2, 'add_group'),
	(5, 'Can change group', 2, 'change_group'),
	(6, 'Can delete group', 2, 'delete_group'),
	(7, 'Can add user', 3, 'add_user'),
	(8, 'Can change user', 3, 'change_user'),
	(9, 'Can delete user', 3, 'delete_user'),
	(10, 'Can add content type', 4, 'add_contenttype'),
	(11, 'Can change content type', 4, 'change_contenttype'),
	(12, 'Can delete content type', 4, 'delete_contenttype'),
	(13, 'Can add session', 5, 'add_session'),
	(14, 'Can change session', 5, 'change_session'),
	(15, 'Can delete session', 5, 'delete_session'),
	(16, 'Can add site', 6, 'add_site'),
	(17, 'Can change site', 6, 'change_site'),
	(18, 'Can delete site', 6, 'delete_site'),
	(19, 'Can add noticia', 7, 'add_noticia'),
	(20, 'Can change noticia', 7, 'change_noticia'),
	(21, 'Can delete noticia', 7, 'delete_noticia'),
	(22, 'Can add album', 8, 'add_album'),
	(23, 'Can change album', 8, 'change_album'),
	(24, 'Can delete album', 8, 'delete_album'),
	(25, 'Can add imagen_album', 9, 'add_imagen_album'),
	(26, 'Can change imagen_album', 9, 'change_imagen_album'),
	(27, 'Can delete imagen_album', 9, 'delete_imagen_album'),
	(28, 'Can add slider_show', 10, 'add_slider_show'),
	(29, 'Can change slider_show', 10, 'change_slider_show'),
	(30, 'Can delete slider_show', 10, 'delete_slider_show'),
	(31, 'Can add calendario_eventos', 11, 'add_calendario_eventos'),
	(32, 'Can change calendario_eventos', 11, 'change_calendario_eventos'),
	(33, 'Can delete calendario_eventos', 11, 'delete_calendario_eventos'),
	(34, 'Can add documento', 12, 'add_documento'),
	(35, 'Can change documento', 12, 'change_documento'),
	(36, 'Can delete documento', 12, 'delete_documento'),
	(37, 'Can add estudiante', 13, 'add_estudiante'),
	(38, 'Can change estudiante', 13, 'change_estudiante'),
	(39, 'Can delete estudiante', 13, 'delete_estudiante'),
	(40, 'Can add funcionario', 14, 'add_funcionario'),
	(41, 'Can change funcionario', 14, 'change_funcionario'),
	(42, 'Can delete funcionario', 14, 'delete_funcionario'),
	(43, 'Can add administrador', 15, 'add_administrador'),
	(44, 'Can change administrador', 15, 'change_administrador'),
	(45, 'Can delete administrador', 15, 'delete_administrador'),
	(46, 'Can add institucion', 16, 'add_institucion'),
	(47, 'Can change institucion', 16, 'change_institucion'),
	(48, 'Can delete institucion', 16, 'delete_institucion'),
	(49, 'Can add sede', 17, 'add_sede'),
	(50, 'Can change sede', 17, 'change_sede'),
	(51, 'Can delete sede', 17, 'delete_sede'),
	(52, 'Can add docente', 18, 'add_docente'),
	(53, 'Can change docente', 18, 'change_docente'),
	(54, 'Can delete docente', 18, 'delete_docente'),
	(55, 'Can add oferta_educativa', 19, 'add_oferta_educativa'),
	(56, 'Can change oferta_educativa', 19, 'change_oferta_educativa'),
	(57, 'Can delete oferta_educativa', 19, 'delete_oferta_educativa'),
	(58, 'Can add inscripcion', 20, 'add_inscripcion'),
	(59, 'Can change inscripcion', 20, 'change_inscripcion'),
	(60, 'Can delete inscripcion', 20, 'delete_inscripcion'),
	(61, 'Can add log entry', 21, 'add_logentry'),
	(62, 'Can change log entry', 21, 'change_logentry'),
	(63, 'Can delete log entry', 21, 'delete_logentry');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.auth_user: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$10000$zEqpIzLBB7DV$H6FXJWeaHyd+ShxD+UWptdC7uwJjPS4zoek5xIgA0es=', '2017-10-03 23:22:20', 1, 'admin', '', '', '', 1, 1, '2017-09-09 02:13:32'),
	(2, 'pbkdf2_sha256$10000$Ut0whaPtqg8F$zUkesFCuPHbn9BPVQVZj75n6+KxUFXlQZF/+jltrrNw=', '2017-10-04 16:37:26', 1, 'rector', '', '', '', 1, 1, '2017-09-09 02:14:39'),
	(3, 'pbkdf2_sha256$10000$8BnN6L35kyDi$d8Rd+aZi5dvB1EU0Fzh4+XMgCc3lKQniDXp3/8WiZMk=', '2017-09-20 22:16:46', 0, 'coordinador1', '', '', '', 0, 1, '2017-09-09 02:15:24'),
	(4, 'pbkdf2_sha256$10000$PSCSu5pz7bbn$wwbn3PnSwHniNtrql1g2AV7xPIQPOWviO2qda6fqTuY=', '2017-09-10 19:40:13', 0, 'coordinador2', '', '', '', 0, 1, '2017-09-09 02:15:41'),
	(5, 'pbkdf2_sha256$10000$VTupGxXIglzA$4DjU0XNPdXKgkWk3I1IC5ET8nw9iq4ycCYBQVQg/YCQ=', '2017-09-20 22:18:11', 0, 'docente1', '', '', '', 0, 1, '2017-09-09 02:16:18'),
	(13, 'pbkdf2_sha256$10000$QVtUY2AaBDeb$L3uk31evZG26HW8IBR2ZtEOz7Ew/6e9k3ou1i4WyIC8=', '2017-09-25 17:44:16', 0, 'estudiante2', '', '', '', 0, 1, '2017-09-10 18:38:14'),
	(14, 'pbkdf2_sha256$10000$1NtidVt6Vgq6$rj60tMzI5pmpd1RXf2TyNBE7QMNehxUGMUXLZFG2VdQ=', '2017-09-10 18:56:07', 0, 'estudiante3', '', '', '', 0, 1, '2017-09-10 18:56:07'),
	(15, 'pbkdf2_sha256$10000$hdnSZSkeawnm$f2EMglN1KpBNelcUTGxbSWkRCZ+uj+VcGZwdfAlswo4=', '2017-09-10 19:40:26', 0, 'coordinador3', '', '', '', 0, 1, '2017-09-10 19:09:51'),
	(16, 'pbkdf2_sha256$10000$AZUMlXosMG7g$uUUMQV76JK0Qq3dxlVzfMA61H+a0fhrxEDhBfO/brFA=', '2017-09-10 19:10:08', 0, 'coordinador4', '', '', '', 0, 1, '2017-09-10 19:10:08'),
	(17, 'pbkdf2_sha256$10000$OqPxwQhjdOMI$CKJTGExrcLzEzGmg6FiXUbm9AENJPwbtOCkIILyxlXU=', '2017-09-20 22:12:15', 0, 'docente2', '', '', '', 0, 1, '2017-09-11 16:19:28'),
	(18, 'pbkdf2_sha256$10000$1lD20kAIhZIr$OQz/7Lv/6HC0jH9e/CUeAb/3FGOqxbB/5lXURLKun+E=', '2017-09-20 22:12:48', 1, 'administrador1', '', '', '', 1, 1, '2017-09-11 19:39:18'),
	(19, 'pbkdf2_sha256$10000$aQaPrZTVxc8w$BTZ5DGKA1YAfucdRzk5u8TqA0S0Nn27ojB5ze7wC+w4=', '2017-09-19 19:31:06', 0, 'administrador2', '', '', '', 0, 1, '2017-09-12 23:04:38'),
	(20, 'pbkdf2_sha256$10000$bY4UAZ18u2rM$iXiBrkUBwwoeFv6N2CxI7ftmQhRk0YkWwORBu52goI4=', '2017-09-20 21:25:28', 0, 'administrador3', '', '', '', 0, 1, '2017-09-12 23:07:30'),
	(21, 'pbkdf2_sha256$10000$jrhoQ8TozHrf$bDdVisgHFXlQI3okDYtkitVzWUPMDR7peRTwG5/XjR8=', '2017-09-21 01:29:13', 0, 'coordinador5', '', '', '', 0, 1, '2017-09-21 01:29:13'),
	(27, 'pbkdf2_sha256$10000$ZM5n80BG8TSg$rVBnXbGSj9hASdqbzXq8ECyCM9WR8+VzADUxhvro5w4=', '2017-09-21 02:06:23', 0, 'coordinador6', '', '', '', 0, 1, '2017-09-21 02:06:23'),
	(28, 'pbkdf2_sha256$10000$hThKYMIKUv1y$BugEr3SUNsQy67s5iupFgaXW8WCaRF0a7VrbofqWP2M=', '2017-09-21 02:06:24', 0, 'coordinador7', '', '', '', 0, 1, '2017-09-21 02:06:24'),
	(29, 'pbkdf2_sha256$10000$neArYwKlWtJA$EeR8tx1XO+DrC3mo231YEqlLkN7BJp+c/JVMngwWzMI=', '2017-09-27 01:55:28', 0, 'docente5', '', '', '', 0, 1, '2017-09-27 01:55:28'),
	(30, 'pbkdf2_sha256$10000$ANdKO5buNhxJ$a07LAzfvAWNj1RJrfGdkbJB1czpM0rRAdh4/Hg5DniE=', '2017-09-27 01:57:39', 1, 'administrador4', '', '', '', 1, 1, '2017-09-27 01:57:39');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.auth_user_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.auth_user_user_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.django_admin_log: ~61 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
	(1, '2017-09-09 02:15:24', 1, 3, '3', 'coordinador1', 1, ''),
	(2, '2017-09-09 02:15:28', 1, 14, '2', 'Daniel Alejandro Tutalcha Ceron', 1, ''),
	(3, '2017-09-09 02:15:41', 1, 3, '4', 'coordinador2', 1, ''),
	(4, '2017-09-09 02:15:46', 1, 14, '3', 'Daniel Alejandro Tutalcha Ceron', 1, ''),
	(5, '2017-09-09 02:15:55', 1, 17, '1', 'John F. Kennedy', 1, ''),
	(6, '2017-09-09 02:21:50', 1, 3, '1', 'admin', 2, 'Modificado/a password y is_staff.'),
	(7, '2017-09-09 02:35:28', 1, 3, '6', 'alejotc ', 3, ''),
	(8, '2017-09-09 02:36:19', 1, 3, '8', 'alejotc ', 3, ''),
	(9, '2017-09-09 02:38:48', 1, 3, '9', 'estudiante1', 3, ''),
	(10, '2017-09-09 02:55:12', 1, 3, '10', 'estudiante1', 3, ''),
	(11, '2017-09-09 02:55:44', 1, 3, '11', 'estudiante1', 3, ''),
	(12, '2017-09-10 18:23:22', 1, 3, '6', 'admin123', 3, ''),
	(13, '2017-09-10 18:23:22', 1, 3, '7', 'admin234', 3, ''),
	(14, '2017-09-10 18:25:17', 1, 3, '9', 'admin234', 3, ''),
	(15, '2017-09-10 18:33:13', 1, 3, '10', 'estudiante1', 3, ''),
	(16, '2017-09-10 19:09:51', 1, 3, '15', 'coordinador3', 1, ''),
	(17, '2017-09-10 19:09:55', 1, 14, '4', 'Daniel Alejandro Tutalcha Ceron', 1, ''),
	(18, '2017-09-10 19:10:08', 1, 3, '16', 'coordinador4', 1, ''),
	(19, '2017-09-10 19:10:12', 1, 14, '5', 'Daniel Alejandro Tutalcha Ceron', 1, ''),
	(20, '2017-09-10 19:10:25', 1, 17, '2', 'Jose Maria Obando', 1, ''),
	(21, '2017-09-10 19:26:34', 1, 12, '2', 'Lorem ipsum dolor. D2', 2, 'No ha cambiado ningún campo.'),
	(22, '2017-09-10 19:26:58', 1, 12, '6', 'Lorem ipsum dolor. D5', 1, ''),
	(23, '2017-09-11 20:44:53', 1, 16, '1', 'John F. Kennedy', 2, 'Modificado/a escudo.'),
	(24, '2017-09-11 20:45:07', 1, 16, '1', 'John F. Kennedy', 2, 'Modificado/a escudo.'),
	(25, '2017-09-12 23:04:12', 1, 3, '18', 'administrador1', 2, 'Modificado/a password y is_staff.'),
	(26, '2017-09-15 16:48:39', 1, 3, '2', 'rector', 2, 'Modificado/a password y is_staff.'),
	(27, '2017-09-19 01:30:21', 1, 11, '4', 'Lorem ipsum dolor. E 1', 2, 'Modificado/a anio.'),
	(28, '2017-09-19 01:34:28', 1, 11, '3', 'Lorem ipsum dolor. E 3', 2, 'Modificado/a estado.'),
	(29, '2017-09-19 01:34:34', 1, 11, '2', 'Lorem ipsum dolor. E 2', 2, 'Modificado/a estado.'),
	(30, '2017-09-19 18:28:56', 1, 11, '3', 'Lorem ipsum dolor. E 3', 2, 'Modificado/a anio.'),
	(31, '2017-09-19 18:29:03', 1, 11, '3', 'Lorem ipsum dolor. E 3', 2, 'Modificado/a anio.'),
	(32, '2017-09-19 18:29:22', 1, 11, '4', 'Lorem ipsum dolor. E 1', 3, ''),
	(33, '2017-09-19 18:42:46', 1, 11, '2', 'Lorem ipsum dolor. E 2', 2, 'Modificado/a anio.'),
	(34, '2017-09-19 18:43:06', 1, 11, '2', 'Lorem ipsum dolor. E 2', 2, 'Modificado/a anio.'),
	(35, '2017-09-19 18:45:41', 1, 11, '5', 'Lorem ipsum dolor. E 1', 2, 'Modificado/a anio.'),
	(36, '2017-09-19 18:46:25', 1, 11, '6', 'Lorem ipsum dolor. E 1', 3, ''),
	(37, '2017-09-19 18:46:25', 1, 11, '5', 'Lorem ipsum dolor. E 1', 3, ''),
	(38, '2017-09-19 20:02:14', 1, 12, '6', 'Lorem ipsum dolor. D6', 2, 'Modificado/a titulo.'),
	(39, '2017-09-19 23:53:14', 2, 12, '7', 'Lorem ipsum dolor. D 7', 2, 'Modificado/a grado.'),
	(40, '2017-09-19 23:54:50', 2, 12, '3', 'Lorem ipsum dolor. D3', 2, 'Modificado/a grado.'),
	(41, '2017-09-19 23:54:54', 2, 12, '5', 'Lorem ipsum dolor. D5', 2, 'Modificado/a grado.'),
	(42, '2017-09-19 23:56:23', 2, 12, '3', 'Lorem ipsum dolor. D3', 2, 'Modificado/a documento.'),
	(43, '2017-09-19 23:59:37', 2, 12, '3', 'Lorem ipsum dolor. D3', 2, 'Modificado/a documento.'),
	(44, '2017-09-21 02:04:30', 1, 3, '22', 'coordinador6', 3, ''),
	(45, '2017-09-21 02:05:38', 1, 3, '24', 'coordinador6', 3, ''),
	(46, '2017-09-21 02:05:38', 1, 3, '25', 'coordinador7', 3, ''),
	(47, '2017-09-21 02:05:52', 1, 17, '8', 'Nueva Esperanza', 3, ''),
	(48, '2017-09-21 02:05:52', 1, 17, '7', 'Nueva Esperanza', 3, ''),
	(49, '2017-09-21 02:05:52', 1, 17, '6', 'Nueva Esperanza', 3, ''),
	(50, '2017-09-21 02:05:52', 1, 17, '5', 'Nueva Esperanza', 3, ''),
	(51, '2017-09-21 02:05:53', 1, 17, '4', 'Nueva Esperanza', 3, ''),
	(52, '2017-09-21 02:05:53', 1, 17, '3', 'Nueva Esperanza', 3, ''),
	(53, '2017-09-21 03:05:32', 2, 14, '13', 'Daniel Alejandro12 Tutalcha Ceron', 3, ''),
	(54, '2017-09-21 03:05:32', 2, 14, '12', 'Daniel Alejandro 1 Tutalcha Ceron', 3, ''),
	(55, '2017-09-21 03:07:12', 2, 14, '11', 'Daniel Alejandro Tutalcha Ceron', 2, 'Modificado/a jornada.'),
	(56, '2017-09-21 03:07:17', 2, 14, '10', 'Daniel Alejandro Tutalcha Ceron', 2, 'Modificado/a jornada.'),
	(57, '2017-09-25 23:43:54', 1, 20, '1', '', 3, ''),
	(58, '2017-09-25 23:45:34', 1, 20, '2', '', 3, ''),
	(59, '2017-10-03 23:09:07', 2, 16, '1', 'John F. Kennedy', 1, ''),
	(60, '2017-10-03 23:22:45', 1, 16, '1', 'John F. Kennedy', 2, 'Modificado/a estudiantes.'),
	(61, '2017-10-03 23:23:51', 1, 16, '1', 'John F. Kennedy', 2, 'Modificado/a estudiantes.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.django_content_type: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
	(1, 'permission', 'auth', 'permission'),
	(2, 'group', 'auth', 'group'),
	(3, 'user', 'auth', 'user'),
	(4, 'content type', 'contenttypes', 'contenttype'),
	(5, 'session', 'sessions', 'session'),
	(6, 'site', 'sites', 'site'),
	(7, 'noticia', 'administracion', 'noticia'),
	(8, 'album', 'administracion', 'album'),
	(9, 'imagen_album', 'administracion', 'imagen_album'),
	(10, 'slider_show', 'administracion', 'slider_show'),
	(11, 'calendario_eventos', 'administracion', 'calendario_eventos'),
	(12, 'documento', 'administracion', 'documento'),
	(13, 'estudiante', 'administracion', 'estudiante'),
	(14, 'funcionario', 'administracion', 'funcionario'),
	(15, 'administrador', 'administracion', 'administrador'),
	(16, 'institucion', 'administracion', 'institucion'),
	(17, 'sede', 'administracion', 'sede'),
	(18, 'docente', 'administracion', 'docente'),
	(19, 'oferta_educativa', 'administracion', 'oferta_educativa'),
	(20, 'inscripcion', 'administracion', 'inscripcion'),
	(21, 'log entry', 'admin', 'logentry');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.django_session: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('0bup2doat1177i4wco8i1z9r6en4sygy', 'YTRiMTg2NDM0ZTBmYWNlOGY3M2M4ZmQ5ODg1NjYwMDQ1OThhYmFhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2017-10-03 19:30:00'),
	('14rbqljnf9fyvgev9u2rujzyu3uihucf', 'YTRiMTg2NDM0ZTBmYWNlOGY3M2M4ZmQ5ODg1NjYwMDQ1OThhYmFhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2017-10-04 21:31:17'),
	('27vd9fenda7yqttah9n1r7eqtwdxvclz', 'YTRiMTg2NDM0ZTBmYWNlOGY3M2M4ZmQ5ODg1NjYwMDQ1OThhYmFhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2017-09-25 14:37:33'),
	('2chrvq6jy69iinupxajewascay1egyb9', 'YTRiMTg2NDM0ZTBmYWNlOGY3M2M4ZmQ5ODg1NjYwMDQ1OThhYmFhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2017-09-26 23:22:03'),
	('3m1c9pyik1dynfaanf30bat0ow2ky0af', 'YTRiMTg2NDM0ZTBmYWNlOGY3M2M4ZmQ5ODg1NjYwMDQ1OThhYmFhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2017-10-17 01:23:51'),
	('4bi98c81dpivrcsrtarw2m854gz7c0kw', 'YTRiMTg2NDM0ZTBmYWNlOGY3M2M4ZmQ5ODg1NjYwMDQ1OThhYmFhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2017-09-23 02:32:44'),
	('7xs3uhbarqon0pjcxdny10h0l6l62aa1', 'YTRiMTg2NDM0ZTBmYWNlOGY3M2M4ZmQ5ODg1NjYwMDQ1OThhYmFhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2017-10-05 01:29:46'),
	('8yf5u6sppo2e6339os9ly9jsrogqms2a', 'ZWE5YzEzYjcyZTQ3Y2M1ZDc0M2E2MDIyMWZjYzA3NWIyODY5MGFlODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=', '2017-10-07 00:45:10'),
	('f8tmt8ubyzt6sebuag0v6tu6hqnb0edt', 'YTRiMTg2NDM0ZTBmYWNlOGY3M2M4ZmQ5ODg1NjYwMDQ1OThhYmFhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2017-09-29 16:24:23'),
	('fpb2lg4nfassx5a76re8hdp9j1hl8416', 'YTRiMTg2NDM0ZTBmYWNlOGY3M2M4ZmQ5ODg1NjYwMDQ1OThhYmFhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2017-09-23 02:55:02'),
	('i1bkm4n3x4rm9ei90otlxnr16mu1hquw', 'YTRiMTg2NDM0ZTBmYWNlOGY3M2M4ZmQ5ODg1NjYwMDQ1OThhYmFhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2017-09-29 03:04:26'),
	('ng2vkewiaybv2illplp47iaxue6sfd7h', 'ZWE5YzEzYjcyZTQ3Y2M1ZDc0M2E2MDIyMWZjYzA3NWIyODY5MGFlODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=', '2017-10-05 00:43:07'),
	('o6kisozxf6fm0pb9aey6iy29wy77oey4', 'ZWE5YzEzYjcyZTQ3Y2M1ZDc0M2E2MDIyMWZjYzA3NWIyODY5MGFlODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=', '2017-10-03 20:05:21'),
	('r1fn68ctpq9wt6b6cn8rdzewcc7ctu9e', 'YTRiMTg2NDM0ZTBmYWNlOGY3M2M4ZmQ5ODg1NjYwMDQ1OThhYmFhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2017-09-26 23:08:06'),
	('r79xjax1srbelxt58mfkn373hhaa5h9z', 'ZWE5YzEzYjcyZTQ3Y2M1ZDc0M2E2MDIyMWZjYzA3NWIyODY5MGFlODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=', '2017-10-18 16:37:26'),
	('ssmkr6xeih24z9r6ehttb0nito3r4l4o', 'ZWE5YzEzYjcyZTQ3Y2M1ZDc0M2E2MDIyMWZjYzA3NWIyODY5MGFlODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=', '2017-10-03 23:50:28'),
	('urxb2390ozqgdvqt5fz1akfu8ut6p8r6', 'YTRiMTg2NDM0ZTBmYWNlOGY3M2M4ZmQ5ODg1NjYwMDQ1OThhYmFhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2017-09-29 16:48:26'),
	('uvz9k2ongvmbjxijcijqtd9bwmhpl698', 'MGUwZjg2MzdiZTJiNzhjOGViYTg5YjgzNWNkNDBlODdlYzMzY2U5YTp7InRlc3Rjb29raWUiOiJ3b3JrZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9', '2017-09-23 02:30:14'),
	('x4vao63q684v158d71zbvcjyl0ysek53', 'ZWE5YzEzYjcyZTQ3Y2M1ZDc0M2E2MDIyMWZjYzA3NWIyODY5MGFlODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=', '2017-10-03 00:54:14'),
	('xo2mosra8oem87c44qewewee9rmvgzbk', 'ODM2MjcxMGQ3ZmQ3NDk2NTlmNjU5Yjk1ODllYWE3YWI5ZDg4ZDBhZjp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==', '2017-09-29 15:20:46'),
	('z3jco4g6y21feoiwsbwiwpq04c4rnrdp', 'YTRiMTg2NDM0ZTBmYWNlOGY3M2M4ZmQ5ODg1NjYwMDQ1OThhYmFhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2017-09-24 18:13:49');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;


-- Volcando estructura para tabla jfk_db.django_site
CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla jfk_db.django_site: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
	(1, 'example.com', 'example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
