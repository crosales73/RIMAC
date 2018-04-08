select a.Estado, departamento, (CASE A.PRODUCTO_A_OFRECER WHEN 'Renta Hospitalaria' THEN 'Renta' else '' end) [Producto],
CAIDA+b.CLIENTE as suma from  --Cuando en una suma los dos valores no son numericos, se concatenan.
[dbo].[CONSOLIDADO_BD_RENTA_PROTE] as a --Se le asigna un nombre a la base para ahorrar tiempo.
inner join [dbo].[CONSOLIDADO_GESTIONES_RENTA] as b
on a.NDOC_IDENT=b.NDOC_IDENT
--where a.N_TARJETA='************0987'
--where a.N_TARJETA like '%3__'
--and b.CONTRATO_AHORRO like '%8'

union all
select a.Estado, departamento, (CASE A.PRODUCTO_A_OFRECER WHEN 'Protección Multiple' THEN 'Prote' else '' end) as [Producto],
CAIDA+c.CLIENTE as suma from  --Cuando en una suma los dos valores no son numericos, se concatenan.
[dbo].[CONSOLIDADO_BD_RENTA_PROTE] as a --Se le asigna un nombre a la base para ahorrar tiempo.
inner join [dbo].[CONSOLIDADO_GESTIONES_PROTE] as c
on a.NDOC_IDENT=c.NDOC_IDENT

select HORA, FECHA from CONSOLIDADO_GESTIONES_RENTA
where FECHA = '06/04/2018'


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

SELECT COUNT(1) FROM Prueba

