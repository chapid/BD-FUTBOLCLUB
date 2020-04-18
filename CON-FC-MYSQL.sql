use futbolclub;
-- punto 1
-- consultar todos los empleados registrados
SELECT NOMBRE_EMPLEADO 
FROM EMPLEADOS;
-- punto 2
-- consultar todos los clubes registrados
SELECT NOMBRE_CLUB 
FROM CLUBES;
-- punto 3
-- consultar todos los trabajos
SELECT NOMBRE_TRABAJO 
FROM TRABAJOS;
-- punto 4
-- consultar todos los empleados que empiecen por la letra 'A'
SELECT NOMBRE_EMPLEADO 
FROM EMPLEADOS 
WHERE NOMBRE_EMPLEADO LIKE'A%';
-- punto 5
-- consultar todos los clubes que empiecen por la letra 'B'
SELECT NOMBRE_CLUB 
FROM CLUBES 
WHERE NOMBRE_CLUB LIKE'B%';
-- punto 6
-- consultar los empleados contratados despues del año 2010
SELECT NOMBRE_EMPLEADO, FECHA_CONTRATO 
FROM EMPLEADOS 
WHERE YEAR(FECHA_CONTRATO) > 2010;
-- punto 7
-- consultar el nombre de los empleados y su respectivo salario ordenado ascendentemente por salario
SELECT NOMBRE_EMPLEADO, SALARIO_EMPLEADO 
FROM EMPLEADOS 
ORDER BY SALARIO_EMPLEADO ASC;
-- punto 8
-- consultar el empleado con el salario mas alto y el empleado con el salario mas bajo.
SELECT NOMBRE_EMPLEADO, SALARIO_EMPLEADO
FROM EMPLEADOS
WHERE SALARIO_EMPLEADO = ( SELECT MAX(SALARIO_EMPLEADO)
						   FROM EMPLEADOS)
UNION
SELECT NOMBRE_EMPLEADO, SALARIO_EMPLEADO
FROM EMPLEADOS
WHERE SALARIO_EMPLEADO = ( SELECT MIN(SALARIO_EMPLEADO)
						   FROM EMPLEADOS);
-- punto 9
-- obtener el jugador con el salario mas alto y el jugador con el salario mas bajo.
SELECT NOMBRE_EMPLEADO, SALARIO_EMPLEADO
FROM EMPLEADOS
WHERE SALARIO_EMPLEADO = ( SELECT MAX(SALARIO_EMPLEADO)
						   FROM EMPLEADOS
                           WHERE TRABAJOS_ID_TRABAJO = 1)
AND TRABAJOS_ID_TRABAJO = 1                           
UNION
SELECT NOMBRE_EMPLEADO, SALARIO_EMPLEADO
FROM EMPLEADOS
WHERE SALARIO_EMPLEADO = ( SELECT MIN(SALARIO_EMPLEADO)
						   FROM EMPLEADOS
                           WHERE TRABAJOS_ID_TRABAJO = 1)
AND TRABAJOS_ID_TRABAJO = 1;
-- punto 10
-- obtener el salario promedio solo de los jugadores
SELECT ROUND(AVG(SALARIO_EMPLEADO),2) AS 'PROMEDIO SALARIO JUGADORES'
FROM EMPLEADOS
WHERE TRABAJOS_ID_TRABAJO = 1;
-- punto 11
-- obtener el numero de clubes registrados por pais ( si no hay clubes registrados devolver 0)
SELECT NOMBRE_PAIS AS CONTINENTE, COUNT(ID_CLUB) AS 'NO. CLUBES'
FROM (UBICACIONES U LEFT JOIN CLUBES C
	ON U.ID_UBICACION = C.UBICACIONES_ID_UBICACION)
    RIGHT JOIN PAISES P
    ON P.ID_PAIS = U.PAISES_ID_PAIS
GROUP BY NOMBRE_PAIS;
-- punto 12
-- obtener el numero de clubes registrados por continente ( si no hay clubes registrados devolver 0)
SELECT NOMBRE_CONTINENTE AS CONTINENTE, COUNT(ID_CLUB) AS 'NO. CLUBES'
FROM ((UBICACIONES U LEFT JOIN CLUBES C
	ON U.ID_UBICACION = C.UBICACIONES_ID_UBICACION)
    RIGHT JOIN PAISES P
    ON P.ID_PAIS = U.PAISES_ID_PAIS)
    RIGHT JOIN CONTINENTES CO
    ON CO.ID_CONTINENTE = P.CONTINENTES_ID_CONTINENTE
GROUP BY NOMBRE_CONTINENTE;