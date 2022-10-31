CREATE TABLE paises (id INT NOT NULL,
					nombre varchar(45) NOT NULL,
                    primary key (id));
CREATE TABLE provincias (id INT NOT NULL,
						nombre varchar(45) NOT NULL,
                        idpais INT NOT NULL,
                        PRIMARY KEY (id),
                        FOREIGN KEY (idpais) references paises(id));
CREATE TABLE localidades (id INT NOT NULL,
						nombre VARCHAR(45),
                        cp VARCHAR(45),
                        id_provincia INT NOT NULL,
                        PRIMARY KEY (id),
                        FOREIGN KEY (id_provincia) references provincias(id));

ALTER TABLE `elsistema`.`empleados` 
ADD COLUMN `direccion` VARCHAR(45) NULL AFTER `estado`,
ADD COLUMN `id_localidad` INT(10) NULL AFTER `direccion`,
ADD COLUMN `email` VARCHAR(45) NULL AFTER `id_localidad`,
ADD COLUMN `telefono` VARCHAR(45) NULL AFTER `email`,
ADD COLUMN `fecha_ingreso` DATE NULL AFTER `telefono`,
ADD COLUMN `tms` TIMESTAMP(2) NULL AFTER `fecha_ingreso`;

ALTER TABLE `elsistema`.`empleados` 
ADD CONSTRAINT `id_localidad`
  FOREIGN KEY (`id_localidad`)
  REFERENCES `elsistema`.`localidades` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `elsistema`.`departamentos` 
ADD COLUMN `gasto` DOUBLE NULL AFTER `estado`,
ADD COLUMN `tms` TIMESTAMP(2) NULL AFTER `gasto`;

INSERT INTO `elsistema`.`paises` (`id`, `nombre`) VALUES ('1', 'alemania');
INSERT INTO `elsistema`.`paises` (`id`, `nombre`) VALUES ('2', 'suiza');
INSERT INTO `elsistema`.`paises` (`id`, `nombre`) VALUES ('3', 'mexico');
INSERT INTO `elsistema`.`paises` (`id`, `nombre`) VALUES ('4', 'argentina');
INSERT INTO `elsistema`.`paises` (`id`, `nombre`) VALUES ('5', 'brasil');

INSERT INTO `elsistema`.`provincias` (`id`, `nombre`, `idpais`) VALUES ('1', 'tucuman', '4');
INSERT INTO `elsistema`.`provincias` (`id`, `nombre`, `idpais`) VALUES ('2', 'salta', '4');
INSERT INTO `elsistema`.`provincias` (`id`, `nombre`, `idpais`) VALUES ('3', 'misiones', '4');
INSERT INTO `elsistema`.`provincias` (`id`, `nombre`, `idpais`) VALUES ('4', 'corrientes', '4');
INSERT INTO `elsistema`.`provincias` (`id`, `nombre`, `idpais`) VALUES ('5', 'san juan', '4');

INSERT INTO `elsistema`.`localidades` (`id`, `nombre`, `cp`, `id_provincia`) VALUES ('1', 'posadas', '3300', '3');
INSERT INTO `elsistema`.`localidades` (`id`, `nombre`, `cp`, `id_provincia`) VALUES ('2', 'corrientes', '4500', '4');
INSERT INTO `elsistema`.`localidades` (`id`, `nombre`, `cp`, `id_provincia`) VALUES ('3', 'obera', '6550', '3');
INSERT INTO `elsistema`.`localidades` (`id`, `nombre`, `cp`, `id_provincia`) VALUES ('4', 'san ignacio', '2300', '3');
INSERT INTO `elsistema`.`localidades` (`id`, `nombre`, `cp`, `id_provincia`) VALUES ('5', 'iguazu', '6555', '3');

INSERT INTO `elsistema`.`departamentos` (`iddepartamento`, `nombre`, `presupuesto`, `estado`, `gasto`, `tms`) VALUES (NULL, 'fotocopiado', '20000', '1', '15000', '2020-03-02 12:23:45');
INSERT INTO `elsistema`.`departamentos` (`iddepartamento`, `nombre`, `presupuesto`, `estado`, `gasto`, `tms`) VALUES (NULL, 'contaduria', '30000', '1', '17000', '2020-03-02 12:23:44');
INSERT INTO `elsistema`.`departamentos` (`iddepartamento`, `nombre`, `presupuesto`, `estado`, `gasto`, `tms`) VALUES (NULL, 'limpieza', '2000', '1', '21000', '2020-03-02 12:25:45');
INSERT INTO `elsistema`.`departamentos` (`iddepartamento`, `nombre`, `presupuesto`, `estado`, `gasto`, `tms`) VALUES (NULL, 'seguridad', '5000', '1', '3000', '2021-03-02 12:23:45');
INSERT INTO `elsistema`.`departamentos` (`iddepartamento`, `nombre`, `presupuesto`, `estado`, `gasto`, `tms`) VALUES (NULL, 'RRHH', '8000', '1', '2000', '2021-03-02 12:23:45');

INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `id_localidad`, `email`, `telefono`, `fecha_ingreso`, `tms`) VALUES ('6484984', 'Juan', 'garcia', '2', '1', 'santa fe', '1', 'hol@fdjk.com', '15875454459', '2022-12-03', '2020-02-03 12:03:45');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `id_localidad`, `email`, `telefono`, `fecha_ingreso`, `tms`) VALUES ('5459545', 'Jose', 'garay', '4', '0', 'calle12', '1', 'dkfjkdfj@kdjfk.com', '54484545', '2021-10-04', '2021-01-02 05:04:42');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `id_localidad`, `email`, `telefono`, `fecha_ingreso`, `tms`) VALUES ('4849848', 'Pepe', 'espinoza', '5', '1', 'calle45', '2', 'dkfjkd@fddfkj.com', '545454548', '2020-03-02', '2021-01-02 05:04:42');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `id_localidad`, `email`, `telefono`, `fecha_ingreso`, `tms`) VALUES ('5465495', 'Roberto', 'hild', '1', '0', 'calle56', '3', 'fkdjkf@dfkj.com', '84512184', '2020-01-01', '2020-02-03 12:03:45');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `id_localidad`, `email`, `telefono`, `fecha_ingreso`, `tms`) VALUES ('4549544', 'Pedro', 'ojeda', '1', '1', 'calle21', '2', 'kdjfkdj@dkfjkd.com', '845164848', '2020-03-05', '2020-02-03 12:03:45');

ALTER TABLE `elsistema`.`pedidos` 
RENAME TO  `elsistema`.`movimientos` ;

CREATE TABLE `elsistema`.`productos` (
  `id` INT(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `id_marca` INT(10) NOT NULL,
  `stock` INT(20) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `estado` INT(5) NOT NULL,
  `tms` TIMESTAMP(2) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `elsistema`.`marcas` (
  `id` INT(10) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `imagen` VARCHAR(45) NULL,
  `id_proveedor` INT(10) NULL,
  `estado` INT(10) NULL,
  `tms` TIMESTAMP(2) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `elsistema`.`proveedores` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `razon_social` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `naturaleza` VARCHAR(45) NULL,
  `cuit` VARCHAR(45) NULL,
  `id_localidad` INT(10) NULL,
  `estado` INT(10) NULL,
  `tms` TIMESTAMP(2) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `elsistema`.`cajas` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `horarioinicio` DATETIME(1) NULL,
  `horariocierre` DATETIME(1) NULL,
  `estado` INT(10) NULL,
  `tms` TIMESTAMP(2) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `elsistema`.`marca_productos` (
  `id_productos` INT(10) NOT NULL,
  `id_marcas` INT(10) NOT NULL,
  PRIMARY KEY (`id_productos`, `id_marcas`));

ALTER TABLE `elsistema`.`marcas` 
ADD COLUMN `id_producto` INT(10) NULL AFTER `tms`;
ALTER TABLE `elsistema`.`marcas` 
ADD CONSTRAINT `id_proveedor`
  FOREIGN KEY (`id_proveedor`)
  REFERENCES `elsistema`.`proveedores` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `id_producto`
  FOREIGN KEY (`id_producto`)
  REFERENCES `elsistema`.`marca_productos` (`id_productos`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `elsistema`.`productos` 
ADD CONSTRAINT `id_marca`
  FOREIGN KEY (`id_marca`)
  REFERENCES `elsistema`.`marca_productos` (`id_productos`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

INSERT INTO `elsistema`.`marca_productos` (`id_productos`, `id_marcas`) VALUES ('1', '2');
INSERT INTO `elsistema`.`marca_productos` (`id_productos`, `id_marcas`) VALUES ('2', '4');
INSERT INTO `elsistema`.`marca_productos` (`id_productos`, `id_marcas`) VALUES ('3', '5');
INSERT INTO `elsistema`.`marca_productos` (`id_productos`, `id_marcas`) VALUES ('4', '1');
INSERT INTO `elsistema`.`marca_productos` (`id_productos`, `id_marcas`) VALUES ('5', '3');

INSERT INTO `elsistema`.`productos` (`id`, `nombre`, `descripcion`, `id_marca`, `stock`, `precio`, `estado`, `tms`) VALUES ('1', 'lapiz', 'madera', '1', '100', '50', '1', '2020-10-10 03:02:45');
INSERT INTO `elsistema`.`productos` (`id`, `nombre`, `descripcion`, `id_marca`, `stock`, `precio`, `estado`, `tms`) VALUES ('2', 'birome', 'plastico', '2', '200', '60', '0', '2021-12-10 14:03:23');
INSERT INTO `elsistema`.`productos` (`id`, `nombre`, `descripcion`, `id_marca`, `stock`, `precio`, `estado`, `tms`) VALUES ('3', 'papel', 'madera', '4', '100', '10', '1', '2021-12-10 14:03:23');
INSERT INTO `elsistema`.`productos` (`id`, `nombre`, `descripcion`, `id_marca`, `stock`, `precio`, `estado`, `tms`) VALUES ('4', 'tijera', 'metal', '1', '15', '70', '1', '2020-10-10 03:02:45');
INSERT INTO `elsistema`.`productos` (`id`, `nombre`, `descripcion`, `id_marca`, `stock`, `precio`, `estado`, `tms`) VALUES ('5', 'clip', 'metal', '2', '25', '5', '0', '2020-10-10 03:02:45');

INSERT INTO `elsistema`.`proveedores` (`id`, `razon_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`, `tms`) VALUES ('1', 'SA', 'Juan', 'Ojeda', 'Economica', '25951', '1', '1', '2020-10-10 12:12:12');
INSERT INTO `elsistema`.`proveedores` (`id`, `razon_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`, `tms`) VALUES ('2', 'SRL', 'Pedro', 'Pirelli', 'Economica', '1651651', '2', '1', '2021-04-05 10:12:24');
INSERT INTO `elsistema`.`proveedores` (`id`, `razon_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`, `tms`) VALUES ('3', 'SA', 'Joshua', 'Ferrari', 'Economica', '5165165', '3', '0', '2021-04-05 10:12:24');
INSERT INTO `elsistema`.`proveedores` (`id`, `razon_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`, `tms`) VALUES ('4', 'SA', 'Penelope', 'Stroll', 'Economica', '651651', '2', '0', '2020-10-10 12:12:12');
INSERT INTO `elsistema`.`proveedores` (`id`, `razon_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`, `tms`) VALUES ('5', 'SRL', 'Brian', 'Binotto', 'Economica', '516516', '1', '0', '2021-04-05 10:12:24');

INSERT INTO `elsistema`.`cajas` (`id`, `horarioinicio`, `horariocierre`, `estado`, `tms`) VALUES ('1', '2021-05-06 21:06:21', '2022-12-12 21:05:03', '0', '2021-05-06 21:06:21');
INSERT INTO `elsistema`.`cajas` (`id`, `horarioinicio`, `horariocierre`, `estado`, `tms`) VALUES ('2', '2020-12-10 15:12:23', '2022-12-12 21:05:03', '0', '2020-12-10 15:12:23');
INSERT INTO `elsistema`.`cajas` (`id`, `horarioinicio`, `horariocierre`, `estado`, `tms`) VALUES ('3', '2021-05-06 21:06:21', '2022-12-12 21:05:03', '1', '2021-05-06 21:06:21');
INSERT INTO `elsistema`.`cajas` (`id`, `horarioinicio`, `horariocierre`, `estado`, `tms`) VALUES ('4', '2021-05-06 21:06:21', '2022-12-12 21:05:03', '1', '2022-12-12 21:05:03');
INSERT INTO `elsistema`.`cajas` (`id`, `horarioinicio`, `horariocierre`, `estado`, `tms`) VALUES ('5', '2021-05-06 21:06:21', '2022-12-12 21:05:03', '0', '2020-12-10 15:12:23');

INSERT INTO `elsistema`.`marcas` (`id`, `nombre`, `descripcion`, `id_proveedor`, `estado`, `tms`, `id_producto`) VALUES ('1', 'nestle', 'comida', '1', '0', '2020-12-10 23:12:45', '1');
INSERT INTO `elsistema`.`marcas` (`id`, `nombre`, `descripcion`, `id_proveedor`, `estado`, `tms`, `id_producto`) VALUES ('2', 'pepito', 'muebles', '5', '0', '2021-05-06 23:12:45', '2');
INSERT INTO `elsistema`.`marcas` (`id`, `nombre`, `descripcion`, `id_proveedor`, `estado`, `tms`, `id_producto`) VALUES ('3', 'pakito', 'muebles', '4', '1', '2020-04-09 23:12:45', '3');
INSERT INTO `elsistema`.`marcas` (`id`, `nombre`, `descripcion`, `id_proveedor`, `estado`, `tms`, `id_producto`) VALUES ('4', 'mouse', 'tecnologia', '2', '1', '2021-06-08 23:12:45', '4');
INSERT INTO `elsistema`.`marcas` (`id`, `nombre`, `descripcion`, `id_proveedor`, `estado`, `tms`, `id_producto`) VALUES ('5', 'cuadril', 'carne', '1', '0', '2021-06-05 23:12:45', '5');

SELECT nombre,presupuesto,gasto,(presupuesto-gasto) as diferencia FROM elsistema.departamentos WHERE estado=1 order by nombre;

SELECT pa.nombre as pais,l.nombre as localidad FROM elsistema.localidades as l JOIN elsistema.paises as pa JOIN elsistema.provincias as pr on (l.id_provincia=pr.id and pa.id=pr.idpais) order by pa.nombre asc;

UPDATE `elsistema`.`empleados` SET `telefono` = '125489542' WHERE (`idemplaedo` = '4');
UPDATE `elsistema`.`empleados` SET `id_localidad` = '3', `fecha_ingreso` = '2019-09-04' WHERE (`idemplaedo` = '2');

INSERT INTO `elsistema`.`vendedores` (`id`, `nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('1', 'Pablo', 'Casio', '54651651', '0.2');
INSERT INTO `elsistema`.`vendedores` (`id`, `nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('2', 'Fernando', 'Gutierrez', '54616515', '0.4');
INSERT INTO `elsistema`.`vendedores` (`id`, `nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('3', 'Luciano', 'Pereira', '51651651', '0.3');
INSERT INTO `elsistema`.`vendedores` (`id`, `nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('4', 'Tatiana', 'Rojas', '65165155', '0.5');
INSERT INTO `elsistema`.`vendedores` (`id`, `nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('5', 'Jessica', 'Fernandez', '78991566', '0.9');

ALTER TABLE `elsistema`.`movimientos` 
ADD COLUMN `id_producto` INT(10) UNSIGNED NOT NULL AFTER `id_vendedor`,
ADD COLUMN `tms` TIMESTAMP(2) NULL AFTER `id_producto`,
ADD COLUMN `tipo_movimiento` VARCHAR(45) NULL AFTER `tms`;

ALTER TABLE `elsistema`.`movimientos` 
DROP FOREIGN KEY `movimientos_ibfk_1`,
DROP FOREIGN KEY `movimientos_ibfk_2`;
ALTER TABLE `elsistema`.`movimientos` 
CHANGE COLUMN `id_cliente` `id_cliente` INT(10) UNSIGNED NULL ,
CHANGE COLUMN `id_vendedor` `id_vendedor` INT(10) UNSIGNED NULL ,
CHANGE COLUMN `id_producto` `id_producto` INT(10) UNSIGNED NULL ;
ALTER TABLE `elsistema`.`movimientos` 
ADD CONSTRAINT `movimientos_ibfk_1`
  FOREIGN KEY (`id_cliente`)
  REFERENCES `elsistema`.`clientes` (`id`),
ADD CONSTRAINT `movimientos_ibfk_2`
  FOREIGN KEY (`id_vendedor`)
  REFERENCES `elsistema`.`vendedores` (`id`);



INSERT INTO `elsistema`.`movimientos` (`id`, `cantidad`, `fecha`) VALUES ('1', '21651', '2020-10-10');
INSERT INTO `elsistema`.`movimientos` (`id`, `cantidad`, `fecha`) VALUES ('2', '51651', '2021-03-05');
INSERT INTO `elsistema`.`movimientos` (`id`, `cantidad`, `fecha`) VALUES ('3', '651651', '2019-04-05');
INSERT INTO `elsistema`.`movimientos` (`id`, `cantidad`, `fecha`) VALUES ('4', '651651', '2021-05-06');
INSERT INTO `elsistema`.`movimientos` (`id`, `cantidad`, `fecha`) VALUES ('5', '6516', '2024-02-06');

UPDATE `elsistema`.`productos` SET `stock` = '21751' WHERE (`id` = '1');
UPDATE `elsistema`.`productos` SET `stock` = '51851' WHERE (`id` = '2');
UPDATE `elsistema`.`productos` SET `stock` = '651751' WHERE (`id` = '3');
UPDATE `elsistema`.`productos` SET `stock` = '651666' WHERE (`id` = '4');
UPDATE `elsistema`.`productos` SET `stock` = '6541' WHERE (`id` = '5');

CREATE TABLE `elsistema`.`parametros` (
  `id` INT(10) NOT NULL,
  `tms` TIMESTAMP(1) NULL,
  `cosas` JSON DEFAULT NULL,
  `id_usuario` INT(10) NULL,
  PRIMARY KEY (`id`));

INSERT INTO `elsistema`.`parametros` (`id`, `cosas`, `id_usuario`) VALUES ('1', '{"idDeLaCosa": "101", "permisos": "PUT, GET"}', '1');
INSERT INTO `elsistema`.`parametros` (`id`, `cosas`, `id_usuario`) VALUES ('2', '{"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente","grupo": "ventas"}', '2');
INSERT INTO `elsistema`.`parametros` (`id`, `cosas`, `id_usuario`) VALUES ('3', '{"zonaHoraria": "America/Argentina/BuenosAires"}', '3');
INSERT INTO `elsistema`.`parametros` (`id`, `cosas`, `id_usuario`) VALUES ('4', '{"zonaHoraria": "America/Argentina/BuenosAires"}', '4');
INSERT INTO `elsistema`.`parametros` (`id`, `cosas`, `id_usuario`) VALUES ('5', '{"balancesAniosAnteriores":{"2019":{"ingreso":"7374901.93","egreso":"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":"31634912,57","egreso": "9757142,66"}}}', '5');




