SELECT id,cantidad,fecha FROM ventas.pedidos ORDER BY fecha asc;
SELECT id,cantidad,fecha FROM ventas.pedidos ORDER BY cantidad desc limit 2;
SELECT c.id,c.nombre,c.apellido,c.cuitcuil,c.ciudad,c.categoría FROM ventas.clientes as c JOIN ventas.pedidos as p WHERE p.id_cliente=c.id group by c.id;
SELECT id,cantidad,fecha FROM ventas.pedidos WHERE (fecha between '2022-01-01' and '2022-12-31') and cantidad>500 ;
SELECT * FROM ventas.vendedores WHERE comisión between '0.05' and '0.11';
SELECT comisión FROM ventas.vendedores ORDER BY comisión desc limit 1;
SELECT id,apellido,nombre,cuitcuil FROM ventas.clientes WHERE cuitcuil!='null' ORDER BY apellido,nombre;
SELECT nombre FROM ventas.clientes WHERE (nombre like 'A%n') or (nombre like 'P%') order by nombre asc;
SELECT nombre FROM ventas.clientes WHERE nombre like 'A%' order by nombre asc;
SELECT nombre FROM ventas.vendedores WHERE (nombre like '%el') or (nombre like '%o') group by nombre order by nombre asc;
SELECT c.id,c.apellido,c.nombre FROM ventas.clientes as c JOIN ventas.pedidos as p WHERE c.id=p.id_cliente group by c.nombre order by c.apellido,c.nombre asc;
SELECT c.apellido,c.nombre,c.cuitcuil,c.ciudad,p.cantidad,p.fecha FROM ventas.clientes as c JOIN ventas.pedidos as p WHERE p.id_cliente=c.id order by c.apellido,c.nombre asc;
SELECT v.apellido,v.nombre,v.cuitcuil,v.comisión,p.cantidad,p.fecha FROM ventas.vendedores as v JOIN ventas.pedidos as p WHERE v.id=p.id_vendedor order by v.apellido,v.nombre asc;
SELECT concat_ws(' ',c.apellido,c.nombre) as Datos_cliente, p.cantidad,p.fecha,concat_ws(' ',v.apellido,v.nombre) as Datos_vendedor  FROM ventas.clientes as c JOIN ventas.pedidos as p JOIN ventas.vendedores as v WHERE p.id_cliente=c.id and p.id_vendedor=v.id order by c.apellido,c.nombre;
SELECT c.apellido,c.nombre,p.cantidad,p.fecha FROM ventas.clientes as c JOIN ventas.pedidos as p WHERE p.id_cliente=c.id and (p.fecha between '2022-01-01' and '2022-12-31') and (cantidad between 300 and 1000) order by c.apellido,c.nombre asc;
SELECT v.apellido,v.nombre FROM ventas.vendedores as v JOIN ventas.pedidos as p JOIN ventas.clientes as c WHERE (p.id_cliente=c.id and p.id_vendedor=v.id) and c.nombre='María' and c.apellido='Santana';
SELECT  c.apellido,c.nombre FROM ventas.clientes as c JOIN ventas.vendedores as v JOIN ventas.pedidos as p WHERE (p.id_cliente=c.id and p.id_vendedor=v.id) and v.nombre='Daniel' and v.apellido='Sáez';
SELECT c.apellido,c.nombre,p.cantidad FROM ventas.clientes as c LEFT JOIN ventas.pedidos as p ON p.id_cliente=c.id order by c.apellido,c.nombre asc;
SELECT v.apellido,v.nombre,p.cantidad FROM ventas.vendedores as v LEFT JOIN ventas.pedidos as p ON p.id_cliente=v.id order by v.apellido,v.nombre asc;
SELECT c.apellido,c.nombre FROM ventas.clientes as c LEFT JOIN ventas.pedidos as p ON p.id_cliente=c.id WHERE p.cantidad IS NULL;
SELECT v.apellido,v.nombre FROM ventas.vendedores as v LEFT JOIN ventas.pedidos as p ON p.id_vendedor=v.id WHERE p.cantidad IS NULL;
SELECT clientes.apellido FROM ventas.clientes LEFT JOIN ventas.pedidos ON clientes.id=pedidos.id_cliente where pedidos.cantidad is null union SELECT vendedores.apellido FROM ventas.vendedores LEFT JOIN ventas.pedidos ON vendedores.id=pedidos.id_vendedor WHERE pedidos.cantidad is null;
SELECT sum(cantidad) FROM ventas.pedidos;
SELECT avg(cantidad) FROM ventas.pedidos;
SELECT count(apellido) as cant_vendedores FROM ventas.vendedores;
SELECT count(apellido) as cant_clientes FROM ventas.clientes;
SELECT max(cantidad) as max_cantidad FROM ventas.pedidos;
SELECT min(cantidad) as max_cantidad FROM ventas.pedidos;
SELECT max(categoría),ciudad FROM ventas.clientes group by ciudad order by ciudad,categoría desc;
SELECT max(p.cantidad),c.id,c.apellido,c.nombre,p.fecha FROM ventas.pedidos as p JOIN ventas.clientes as c on p.id_cliente=c.id group by fecha order by p.cantidad asc;
SELECT max(p.cantidad),c.id,c.apellido,c.nombre,p.fecha FROM ventas.pedidos as p JOIN ventas.clientes as c on p.id_cliente=c.id WHERE p.cantidad>'2000' group by fecha order by p.cantidad asc;
SELECT max(p.cantidad),v.id,v.apellido,v.nombre,p.fecha FROM ventas.vendedores as v JOIN ventas.pedidos as p on v.id=p.id_vendedor where fecha='2021-08-17' group by v.apellido;
SELECT count(p.id_cliente),c.id,c.apellido,c.nombre FROM ventas.clientes as c JOIN ventas.pedidos as p on p.id_cliente=c.id group by p.id_cliente;
SELECT count(p.id_cliente) as cant_pedido,c.id,c.apellido,c.nombre,p.fecha FROM ventas.clientes as c JOIN ventas.pedidos as p on p.id_cliente=c.id WHERE fecha like '2020%' group by p.id_cliente;
SELECT max(cantidad),fecha FROM ventas.pedidos group by year(fecha) order by fecha asc;
SELECT count(id),fecha FROM ventas.pedidos group by year(fecha) order by fecha asc;
SELECT count(p.id_cliente),c.apellido FROM ventas.clientes as c LEFT JOIN ventas.pedidos as p on p.id_cliente=c.id WHERE c.nombre='Adela' and c.apellido='Salas';
SELECT count(p.id_vendedor),v.apellido FROM ventas.vendedores as v LEFT JOIN ventas.pedidos as p on p.id_cliente=v.id WHERE v.nombre='Daniel' and v.apellido='Sáez';
SELECT max(p.cantidad),c.nombre FROM ventas.pedidos as p LEFT JOIN ventas.clientes as c ON p.id_cliente=c.id WHERE p.fecha like '2020%';
SELECT max(p.cantidad),p.fecha FROM ventas.pedidos as p LEFT JOIN ventas.clientes as c ON p.id_cliente=c.id WHERE c.nombre='Pepe' and c.apellido='Ruiz';
SELECT concat_ws(' ',c.nombre,c.apellido) as Cliente FROM clientes c WHERE c.id not in (SELECT p.id_cliente FROM pedidos p);
SELECT v.nombre FROM ventas.vendedores as v WHERE v.id not in (SELECT p.id_vendedor FROM ventas.pedidos as p);
SELECT concat_ws(' ',c.nombre,c.apellido) as Cliente, c.id FROM clientes c where not exists (SELECT * FROM pedidos p where c.id = p.id_cliente);
SELECT concat_ws(' ',v.nombre,v.apellido) as Vendedor, v.id FROM clientes v where not exists (SELECT * FROM pedidos p where v.id = p.id_vendedor);


