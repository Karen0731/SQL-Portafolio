USE [DB_BI_Gpo01_24];
---- Crear la tabla DIM_RESPONSABLE
-- El query a continuación es anidado, requiere de la información
-- existente en TT_Accidentes03 y posteriormente se le adiciona su
-- identificador de manera ordenada.
SELECT ROW_NUMBER()
OVER(ORDER BY SEXO) as ID_RESPONSABLE, SELECTED_TABLE.*
INTO DIM_RESPONSABLE
FROM (SELECT DISTINCT SEXO FROM [dbo].[TT_Accidentes03]) AS SELECTED_TABLE;
---- Crear la tabla DIM_DETALLE_RESPONSABLE
-- El query a continuación es anidado, requiere de la información
-- existente en TT_Accidentes03 y posteriormente se le adiciona su
-- identificador de manera ordenada.
SELECT ROW_NUMBER()
OVER(ORDER BY RESP_EBRIEDAD) as ID_DETALLE_RESPONSABLE, SELECTED_TABLE.*
INTO DIM_DETALLE_RESPONSABLE
FROM (SELECT DISTINCT RESP_EBRIEDAD, RESP_CINTURON, FUGA FROM [dbo].[TT_Accidentes03])
AS SELECTED_TABLE;
---- Crear la tabla DIM_EDAD_RESPONSABLE
-- El query a continuación es anidado, requiere de la información
-- existente en TT_Accidentes03 y posteriormente se le adiciona su
-- identificador de manera ordenada.
SELECT ROW_NUMBER()
OVER(ORDER BY RANGO_EDAD) as ID_EDAD_RESPONSABLE, SELECTED_TABLE.*
INTO DIM_EDAD_RESPONSABLE
FROM (SELECT DISTINCT RESP_ADULTO,RANGO_EDAD FROM [dbo].[TT_Accidentes03]) AS
SELECTED_TABLE;
---- Crear la tabla DIM_DETALLE_ACCIDENTE
-- El query a continuación es anidado, requiere de la información
-- existente en TT_Accidentes03 y posteriormente se le adiciona su
-- identificador de manera ordenada.
SELECT ROW_NUMBER()
OVER(ORDER BY CLASIFICACION) as ID_DETALLE_ACCIDENTE, SELECTED_TABLE.*
INTO DIM_DETALLE_ACCIDENTE
FROM (SELECT DISTINCT TIPO_ACCIDENTE, CAUSA, CLASIFICACION FROM
[dbo].[TT_Accidentes03]) AS SELECTED_TABLE;
---- Crear la tabla DIM_FECHA
-- El query a continuación es anidado, requiere de la información
-- existente en TT_Accidentes03 y posteriormente se le adiciona su
-- identificador de manera ordenada.
SELECT ROW_NUMBER()
OVER(ORDER BY FECHA) as ID_FECHA, SELECTED_TABLE.*
INTO DIM_FECHA
FROM (SELECT DISTINCT AÑO, MES, DIA, DIASEMANA, TIPO_DIA, FECHA FROM
[dbo].[TT_Accidentes03]) AS SELECTED_TABLE;
---- Crear la tabla DIM_HORA_MINUTO
-- El query a continuación es anidado, requiere de la información
-- existente en TT_Accidentes03 y posteriormente se le adiciona su
-- identificador de manera ordenada.
SELECT ROW_NUMBER()
OVER(ORDER BY HORA, MINUTO) as ID_HORA_MINUTO, SELECTED_TABLE.*
INTO DIM_HORA_MINUTO
FROM (SELECT DISTINCT HORA, MINUTO, RANGO_HORA FROM [dbo].[TT_Accidentes03]) AS
SELECTED_TABLE;
---- Crear la tabla DIM_ESTADO
-- El query a continuación es anidado, requiere de la información
-- existente en TT_Accidentes03 y posteriormente se le adiciona su
-- identificador de manera ordenada.
SELECT ROW_NUMBER()
OVER(ORDER BY ENTIDAD, MUNICIPIO) as ID_ESTADO, SELECTED_TABLE.*
INTO DIM_ESTADO
FROM (SELECT DISTINCT ENTIDAD, MUNICIPIO, SEGURO_REQUERIDO FROM
[dbo].[TT_Accidentes03]) AS SELECTED_TABLE;
---- Crear la tabla DIM_ZONA
-- El query a continuación es anidado, requiere de la información
-- existente en TT_Accidentes03 y posteriormente se le adiciona su
-- identificador de manera ordenada.
SELECT ROW_NUMBER()
OVER(ORDER BY ZONA, TIPO_SUPERFICIE) as ID_ZONA, SELECTED_TABLE.*
INTO DIM_ZONA
FROM (SELECT DISTINCT ZONA, DETALLES_ZONA,TIPO_SUPERFICIE FROM
[dbo].[TT_Accidentes03]) AS SELECTED_TABLE;
-- Crear la tabla de hechos FT_Accidentes
-- 1) Añadir las métricas.
SELECT
RP.ID_RESPONSABLE,
DR.ID_DETALLE_RESPONSABLE,
ER.ID_EDAD_RESPONSABLE,
DA.ID_DETALLE_ACCIDENTE,
FH.ID_FECHA,
HM.ID_HORA_MINUTO,
ET.ID_ESTADO,
ZN.ID_ZONA,
NO_AUTOS,
NO_CAMIONETAPASAJ,
NO_MICROBUS,
NO_CAMIONPASAJ,
NO_OMNIBUS,
NO_TRANVIA,
NO_CAMIONETA,
NO_CAMION,
NO_TRACTOR,
NO_FERROCARRIL,
NO_MOTOCICLETA,
NO_BICICLETA,
NO_OTROVEHICULO,
NO_CONDMUERTO,
NO_CONDHERIDO,
NO_PASAMUERTO,
NO_PASAHERIDO,
NO_PEATHERIDO,
NO_PEATMUERTO,
NO_CICLMUERTO,
NO_CICLHERIDO,
NO_OTROMUERTO,
NO_OTROHERIDO,
NO_NEMUERTO,
NO_NEHERIDO,
NO_HERIDOS,
NO_DEFUNCIONES,
RESP_EDAD
INTO FT_Accidentes
FROM TT_Accidentes03 AS MET
-- 2) Añadir IDs de las dimensiones externas
-- Añadir ID_RESPONSABLE de DIM_RESPONSABLE
LEFT OUTER JOIN
DIM_RESPONSABLE as RP
ON
RP.SEXO = MET.SEXO
-- Añadir ID_DETALLE_RESPONSABLE de DIM_DETALLE_RESPONSABLE
LEFT OUTER JOIN
DIM_DETALLE_RESPONSABLE as DR
ON
DR.RESP_EBRIEDAD = MET.RESP_EBRIEDAD AND
DR.RESP_CINTURON = MET.RESP_CINTURON AND
DR.FUGA = MET.FUGA
-- Añadir ID_EDAD_RESPONSABLE de DIM_EDAD_RESPONSABLE
LEFT OUTER JOIN
DIM_EDAD_RESPONSABLE as ER
ON
ER.RANGO_EDAD = MET.RANGO_EDAD AND
ER.RESP_ADULTO = MET.RESP_ADULTO
-- Añadir ID_DETALLE_ACCIDENTE de DIM_DETALLE ACCIDENTE
LEFT OUTER JOIN
DIM_DETALLE_ACCIDENTE as DA
ON
DA.TIPO_ACCIDENTE = MET.TIPO_ACCIDENTE AND
DA.CAUSA = MET.CAUSA AND
DA.CLASIFICACION = MET.CLASIFICACION
-- Añadir ID_FECHA de DIM_FECHA
LEFT OUTER JOIN
DIM_FECHA as FH
ON
FH.AÑO = MET.AÑO AND
FH.DIA = MET.DIA AND
FH.DIASEMANA = MET.DIASEMANA AND
FH.TIPO_DIA = MET.TIPO_DIA AND
FH.FECHA = MET.FECHA
-- Añadir ID_HORA_MINUTO de DIM_HORA_MINUTO
LEFT OUTER JOIN
DIM_HORA_MINUTO as HM
ON
HM.HORA = MET.HORA AND
HM.MINUTO = MET.MINUTO AND
HM.RANGO_HORA = MET.RANGO_HORA
-- Añadir ID_ESTADO de DIM_ESTADO
LEFT OUTER JOIN
DIM_ESTADO as ET
ON
ET.ENTIDAD = MET.ENTIDAD AND
ET.MUNICIPIO = MET.MUNICIPIO AND
ET.SEGURO_REQUERIDO = MET.SEGURO_REQUERIDO
-- Añadir ID_ZONA de DIM_ZONA
LEFT OUTER JOIN
DIM_ZONA as ZN
ON
ZN.ZONA = MET.ZONA AND
ZN.DETALLES_ZONA = MET.DETALLES_ZONA AND
ZN.TIPO_SUPERFICIE = MET.TIPO_SUPERFICIE
-- Descripción del modelo
SELECT * FROM DIM_RESPONSABLE;
SELECT * FROM DIM_DETALLE_RESPONSABLE;
SELECT * FROM DIM_EDAD_RESPONSABLE;
SELECT * FROM DIM_DETALLE_ACCIDENTE;
SELECT * FROM DIM_FECHA;
SELECT * FROM DIM_HORA_MINUTO;
SELECT * FROM DIM_ESTADO;
SELECT * FROM DIM_ZONA;
--Comprobación del modelo
SELECT COUNT(*) FROM dbo.ST_Accidentes;
SELECT COUNT(*) FROM dbo.FT_Accidentes;
