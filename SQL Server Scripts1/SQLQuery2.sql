select a.Estado, departamento, (CASE A.PRODUCTO_A_OFRECER WHEN 'Renta Hospitalaria' THEN 'Renta' else '' end) [Producto],
CAIDA+b.CLIENTE as suma from  --Cuando en una suma los dos valores no son numericos, se concatenan.
[dbo].[CONSOLIDADO_BD_RENTA_PROTE] as a --Se le asigna un nombre a la base para ahorrar tiempo.
inner join [dbo].[CONSOLIDADO_GESTIONES_RENTA] as b
on a.NDOC_IDENT=b.NDOC_IDENT
--where a.N_TARJETA='************0987' --Condicionales--
--where a.N_TARJETA like '%3__' --% se usa como comodin de todos los digitos que hay--
--and b.CONTRATO_AHORRO like '%8' --_ se usa para indicar 1 digitos adicional--

union all
select a.Estado, departamento, (CASE A.PRODUCTO_A_OFRECER WHEN 'Protección Multiple' THEN 'Prote' else '' end) as [Producto],
CAIDA+c.CLIENTE as suma from  --Cuando en una suma los dos valores no son numericos, se concatenan.
[dbo].[CONSOLIDADO_BD_RENTA_PROTE] as a --Se le asigna un nombre a la base para ahorrar tiempo.
inner join [dbo].[CONSOLIDADO_GESTIONES_PROTE] as c
on a.NDOC_IDENT=c.NDOC_IDENT


--EJECUTAR PARA SACAR DATOS DE ONCOLÓGICO--
select b.NRO_DE_DOCUMENTO, b.MOTIVO, b.NOMBRE_OPERADOR, b.SEGMENTO, b.FECHA_DE_CAPTURA, a.SEXO, a.DEPARTAMENTO, a.DISTRITO, a.ZONAL, a.EDAD, c.ESTADO, (CASE a.[Grupo Analytics] when 'TIPO:CLIENTES|TIENE_SALUD:NO|TARJETAHABIENTE:NO' then 'NO' else 'SI' end) [Tarjeta Habiente]  --Cuando en una suma los dos valores no son numericos, se concatenan.
from [dbo].[CONSOLIDADO_BD_ONCOLOGICO] as a --Se le asigna un nombre a la base para ahorrar tiempo.
inner join [dbo].[CONSOLIDADO_GESTIONES_ONCOLÓGICO] as b
on a.[Número de identificación]=b.NRO_DE_DOCUMENTO
inner join [dbo].[TIPIFICACIONES_ONCOLOGICO] c
on b.motivo=c.sistema
ORDER BY b.FECHA_DE_CAPTURA


--CONSULTAR LAS TABLAS--
use RimacProte1
select * from [dbo].[CONSOLIDADO_BD_ONCOLOGICO]
select * from [dbo].[CONSOLIDADO_GESTIONES_ONCOLÓGICO]
where FECHA_DE_CAPTURA like '2018-04-06%'

--where FECHA lile '%2018-04-07%'


--insert into dbo.prueba2 (nombre, id, telefono) values ('mil',1000,10001000)

declare @x table (id int,nombre varchar(max), telefono int)
insert into @x (nombre, id, telefono) values ('mil',1000,10001000)
select * from @x

insert into Prueba
select * from @x

update prueba 
set id=1001
where nombre='milsfgsdtsd'

delete from Prueba
where id=1001
select * from Prueba

SELECT COUNT(1) FROM [dbo].[CONSOLIDADO_GESTIONES_ONCOLÓGICO]