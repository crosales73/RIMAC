SELECT * FROM #base
WHERE [N�mero de identificaci�n] IN (SELECT * FROM #ANT)
 
  
SELECT DISTINCT [N�mero de identificaci�n] INTO #ANT FROM CONSOLIDADO_BASES_ONCO WHERE FEC_INIC <> '201804'
 
SELECT * into #base FROM CONSOLIDADO_BASES_ONCO
WHERE FEC_INIC = '201804'
 
 
SELECT * FROM CONSOLIDADO_BASES_ONCO
WHERE FEC_INIC = '201804' AND ESTADO = 'NO CARGA'
 
 
IF OBJECT_ID('TEMPDB..#BASES') < 0 BEGIN DROP TABLE #BASES END
 
SELECT * INTO #BASES
FROM OPENROWSET ('MICROSOFT.ACE.OLEDB.12.0','EXCEL 12.0;DATABASE=\\172.60.12.202\informacion\04 RIMAC_onco\2018\ABRIL\404_4091_cuentas_Tab.xlsx',
'select * from [BASE$]')
 
SELECT * FROM #BASES 
 
DELETE FROM CONSOLIDADO_BASES_ONCO WHERE FEC_INIC = '201804'
 
SELECT * FROM #BASES WHERE FEC_INIC = '201804' 
 
SELECT Departamento,COUNT(*) FROM CONSOLIDADO_BASES_ONCO 
WHERE FEC_INIC = '201804' AND ESTADO = 'CARGA'
GROUP BY Departamento
ORDER BY 1
 