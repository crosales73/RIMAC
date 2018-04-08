select a.Estado, departamento, (CASE A.PRODUCTO_A_OFRECER WHEN 'Renta Hospitalaria' THEN 'Renta' else '' end) [Nueva Columna],
CAIDA+b.CLIENTE as suma from
[dbo].[CONSOLIDADO_BD_RENTA_PROTE] as a
inner join [dbo].[CONSOLIDADO_GESTIONES_RENTA] as b
on a.NDOC_IDENT=b.NDOC_IDENT
--where a.N_TARJETA='************0987'
where a.N_TARJETA like '%3__'
and b.CONTRATO_AHORRO like '%8'


--insert into dbo.prueba2 (nombre, id, telefono) values ('mil',1000,10001000)

declare @x table (id int,nombre varchar(max), telefono int)
insert into @x (nombre, id, telefono) values ('mil',1000,10001000)
select * from @x

insert into Prueba
select * from @x

update prueba 
set id=1001
where nombre='mil'

delete from Prueba
where id=1001
select * from Prueba

SELECT COUNT(1) FROM Prueba

