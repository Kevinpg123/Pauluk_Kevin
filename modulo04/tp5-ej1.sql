SELECT apellido FROM sistema.empleados;
SELECT apellido FROM sistema.empleados GROUP BY empleados.apellido;
SELECT * FROM sistema.empleados;
SELECT nombre,apellido  FROM sistema.empleados;
SELECT cuil_cuit FROM sistema.empleados;
SELECT concat_ws(' ',nombre,apellido) as Empleados FROM sistema.empleados;
SELECT UPPER(concat(nombre,' ',apellido)) AS Empleados FROM sistema.empleados;
SELECT LOWER(concat(nombre,' ',apellido)) AS Empleados FROM sistema.empleados;
SELECT nombre,presupuesto FROM sistema.departamentos WHERE estado=1 ORDER BY presupuesto asc;
SELECT nombre FROM sistema.departamentos ORDER BY nombre ASC;
SELECT nombre FROM sistema.departamentos ORDER BY nombre DESC;
SELECT concat_ws(' ',apellido,nombre) as Nombre FROM sistema.empleados ORDER BY apellido asc;
SELECT nombre,presupuesto FROM sistema.departamentos ORDER BY presupuesto desc limit 3;
SELECT nombre,presupuesto FROM sistema.departamentos where estado=1 ORDER BY presupuesto asc limit 3 ;
SELECT nombre,presupuesto FROM sistema.departamentos where presupuesto>=150000;
SELECT nombre,presupuesto FROM sistema.departamentos where presupuesto>99999 and presupuesto<200001;
SELECT nombre,presupuesto FROM sistema.departamentos where estado=1 and (presupuesto<100000 or presupuesto>200000) ;
SELECT nombre,presupuesto FROM sistema.departamentos where presupuesto between 100000 and 200000;
SELECT nombre,presupuesto FROM sistema.departamentos where estado=1 and presupuesto not between 100000 and 200000;
SELECT concat_ws(' ',e.nombre,e.apellido) as nombre , d.nombre as departamento FROM sistema.empleados as e JOIN sistema.departamentos as d WHERE d.iddepartamento=e.id_departamento;
SELECT concat_ws(' ',e.apellido,e.nombre) as Empleado, d.nombre as Departamento FROM sistema.empleados as e JOIN sistema.departamentos as d WHERE d.iddepartamento=e.id_departamento ORDER BY d.nombre,e.apellido,e.nombre asc;
SELECT d.iddepartamento as id_departamento,d.nombre FROM sistema.departamentos as d  JOIN sistema.empleados as e  WHERE d.iddepartamento=e.id_departamento group by d.nombre ORDER BY d.iddepartamento asc;
SELECT d.nombre FROM sistema.departamentos as d JOIN sistema.empleados as e WHERE e.id_departamento=d.iddepartamento and e.cuil_cuit='27-38382980-3' ;
SELECT d.nombre FROM sistema.departamentos as d JOIN sistema.empleados as e WHERE e.id_departamento=d.iddepartamento and e.nombre='Pepe' and e.apellido='Ruiz';
SELECT e.apellido,e.nombre,e.cuil_cuit FROM sistema.empleados as e JOIN sistema.departamentos as d WHERE e.id_departamento=d.iddepartamento and d.nombre='I+D' order by e.apellido,e.nombre asc;
SELECT e.nombre,e.apellido,e.cuil_cuit FROM sistema.empleados as e JOIN sistema.departamentos as d WHERE e.id_departamento=d.iddepartamento and (d.nombre='I+D' or d.nombre='Sistemas' or d.nombre='Contabilidad') order by e.apellido,e.nombre asc;
SELECT e.apellido,e.nombre FROM sistema.empleados as e JOIN sistema.departamentos as d WHERE e.id_departamento=d.iddepartamento and d.presupuesto not between 100000 and 200000;


