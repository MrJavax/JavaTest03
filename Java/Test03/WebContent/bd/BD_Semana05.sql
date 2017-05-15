SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `bd_mantenimiento` DEFAULT CHARACTER SET utf8 ;
USE `bd_mantenimiento` ;

-- -----------------------------------------------------
-- Table `bd_mantenimiento`.`tb_estado_civil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_mantenimiento`.`tb_estado_civil` (
  `codigo` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_mantenimiento`.`ubigeo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_mantenimiento`.`ubigeo` (
  `id` INT(11) NOT NULL,
  `departamento` VARCHAR(70) NULL DEFAULT NULL,
  `provincia` VARCHAR(70) NULL DEFAULT NULL,
  `distrito` VARCHAR(70) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_mantenimiento`.`tb_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_mantenimiento`.`tb_cliente` (
  `codigo` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `apellido` VARCHAR(30) NULL DEFAULT NULL,
  `distrito` INT(11) NULL DEFAULT NULL,
  `estado` SMALLINT(6) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `estado` (`estado` ASC),
  INDEX `distrito` (`distrito` ASC),
  CONSTRAINT `tb_cliente_ibfk_1`
    FOREIGN KEY (`estado`)
    REFERENCES `bd_mantenimiento`.`tb_estado_civil` (`codigo`),
  CONSTRAINT `tb_cliente_ibfk_2`
    FOREIGN KEY (`distrito`)
    REFERENCES `bd_mantenimiento`.`ubigeo` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_mantenimiento`.`tb_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_mantenimiento`.`tb_producto` (
  `cod_pro` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `nom_pro` VARCHAR(30) NULL DEFAULT NULL,
  `pre_pro` DOUBLE NULL DEFAULT NULL,
  `stk_pro` INT(11) NULL DEFAULT NULL,
  `cat_pro` VARCHAR(30) NULL DEFAULT NULL,
  `fec_reg_pro` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`cod_pro`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_mantenimiento`.`tb_sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_mantenimiento`.`tb_sede` (
  `cod_sed` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `nom_sed` VARCHAR(30) NULL DEFAULT NULL,
  `dir_sed` VARCHAR(30) NULL DEFAULT NULL,
  `fec_ina_sed` DATE NULL DEFAULT NULL,
  `ger_sed` VARCHAR(30) NULL DEFAULT NULL,
  `dis_sed` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_sed`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_mantenimiento`.`tb_vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_mantenimiento`.`tb_vendedor` (
  `cod_ven` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `nom_ven` VARCHAR(30) NULL DEFAULT NULL,
  `ape_ven` VARCHAR(30) NULL DEFAULT NULL,
  `eda_ven` SMALLINT(6) NULL DEFAULT NULL,
  `fec_nac_ven` DATE NULL DEFAULT NULL,
  `est_civ_ven` VARCHAR(30) NULL DEFAULT NULL,
  `dis_ven` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_ven`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bd_mantenimiento`.`carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_mantenimiento`.`carrera` (
  `idcarrera` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idcarrera`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bd_mantenimiento`.`alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_mantenimiento`.`alumno` (
  `idalumno` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `fechaNacimiento` DATE NULL,
  `idcarrera` INT NOT NULL,
  PRIMARY KEY (`idalumno`),
  INDEX `fk_alumno_carrera1_idx` (`idcarrera` ASC),
  CONSTRAINT `fk_alumno_carrera1`
    FOREIGN KEY (`idcarrera`)
    REFERENCES `bd_mantenimiento`.`carrera` (`idcarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




insert into tb_vendedor values(null,'Jorge','Arcos',15,'1979-10-10','Soltero','San Isidro');
insert into tb_vendedor values(null,'Maria','Gutarra',25,'1940-02-20','Casado','Miraflores');
insert into tb_vendedor values(null,'Patricia','Vivas',28,'1980-05-15','Soltero','Lince');
insert into tb_vendedor values(null,'Wendy','Camarena',30,'1974-12-23','Soltero','San Isidro');
insert into tb_vendedor values(null,'Milagros','Jacinto',31,'1975-04-17','Casado','Lince');
insert into tb_vendedor values(null,'Pablo','Milanes',22,'1979-03-24','Casado','San Isidro');



insert into tb_producto values(null,'Hojas Bulki',10,30,'Oficina','2007-03-01'); 
insert into tb_producto values(null,'Teclado',200.5,15,'Informatica','2007-03-09'); 
insert into tb_producto values(null,'Lapiceros Faber Castell',20.5,35,'Oficina','2007-03-15'); 
insert into tb_producto values(null,'Mouse',30.5,50,'Informatica','2007-03-20'); 
insert into tb_producto values(null,'Perforador',50,40,'Oficina','2007-03-01'); 
insert into tb_producto values(null,'Camaras',25,35,'Informatica','2007-03-09'); 
insert into tb_producto values(null,'Plumones',60,35,'Oficina','2007-03-15'); 
insert into tb_producto values(null,'Memorias',150,47,'Informatica','2007-03-20'); 
insert into tb_producto values(null,'Hojas Bond',10.5,69,'Oficina','2007-03-01'); 
insert into tb_producto values(null,'Disco Duro',300,70,'Informatica','2007-03-09'); 
insert into tb_producto values(null,'Cuadernos',25,78,'Oficina','2007-03-15'); 
insert into tb_producto values(null,'Microprocesadores',500,90,'Informatica','2007-03-20'); 




insert into tb_sede values(null,'Crisol Magdalena 1','Av. Magdalena 124','2000-05-10','Juan Perez','Magdalena');
insert into tb_sede values(null,'Crisol Magdalena 2','Av. Magdalena 542','2000-05-10','Ana Quispe','Magdalena');
insert into tb_sede values(null,'Crisol Lince','Av. Lince 345','1999-10-10','Felipe Len','Lince');
insert into tb_sede values(null,'Crisol Miraflores','Av. Miraflores 124','1998-10-10','Javier Astupillo','Miraflores');
insert into tb_sede values(null,'Crisol San Isidro','Av. ChinChon 124','2000-10-10','Fernado Salcedo','San Isidro');

  


insert into tb_estado_civil values(null,'Soltero');
insert into tb_estado_civil values(null,'Casado');
insert into tb_estado_civil values(null,'Viudo');
insert into tb_estado_civil values(null,'Divorciado');





INSERT INTO tb_cliente values(null,'Juan','Arcos',17962243,1);
INSERT INTO tb_cliente values(null,'Juana','Garcia',18272522,2);
INSERT INTO tb_cliente values(null,'Pedro','Quispe',18012312,1);
INSERT INTO tb_cliente values(null,'Luis','Jacinto',17962243,3);
INSERT INTO tb_cliente values(null,'Felipe','Gutarra',17762217,2);
INSERT INTO tb_cliente values(null,'Luisa','Morales',17962243,1);
INSERT INTO tb_cliente values(null,'Elsa','Gutierrez',6636115,4);




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



