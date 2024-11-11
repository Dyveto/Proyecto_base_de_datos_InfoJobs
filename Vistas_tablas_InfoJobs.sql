/* 1. Vista de Categorías de Empleo (vistaCategorias)
Propósito: Muestra todas las categorías de empleo disponibles en la plataforma, con su ID, nombre y descripción.
Utilidad: Esta vista es útil para conocer qué categorías de empleo existen en la plataforma y acceder rápidamente a ellas sin necesidad de consultar varias tablas. */
CREATE OR REPLACE VIEW vistaCategorias AS
SELECT categoria.idCategoria,
       categoria.nombre AS "categoria",
       categoria.descripcion AS "descripcion"
FROM Categorias categoria
ORDER BY categoria.idCategoria;

/* 2. Vista de Empresas (vistaEmpresas)
Propósito: Muestra información básica de las empresas que publican ofertas de empleo, como su ID, nombre, descripción y ubicación.
Utilidad: Permite obtener una lista de las empresas con sus datos esenciales para analizarlas o buscarlas en la plataforma. */
CREATE OR REPLACE VIEW vistaEmpresas AS
SELECT empresa.idEmpresa,
       empresa.nombre AS "nombre_empresa",
       empresa.descripcion AS "descripcion_empresa",
       empresa.ubicacion AS "ubicacion"
FROM Empresas empresa
ORDER BY empresa.idEmpresa;

/* 3. Vista de Ofertas de Empleo (vistaOfertas)
Propósito: Muestra detalles de las ofertas de empleo publicadas, como el título de la oferta, descripción, salario, fecha de publicación, ID de la empresa que la ofrece y la categoría del empleo.
Utilidad: Permite consultar las ofertas activas y obtener una visión general de las oportunidades de empleo, además de saber a qué empresa y categoría pertenecen.*/
CREATE OR REPLACE VIEW vistaOfertas AS
SELECT oferta.idOferta,
       oferta.titulo AS "titulo_oferta",
       oferta.descripcion AS "descripcion_oferta",
       oferta.salario AS "salario",
       oferta.fechaPublicacion AS "fecha_publicacion",
       empresa.idEmpresa AS "id_empresa",
       categoria.idCategoria AS "id_categoria"
FROM Ofertas oferta
LEFT JOIN Empresas empresa ON oferta.idEmpresa = empresa.idEmpresa
LEFT JOIN Categorias categoria ON oferta.idCategoria = categoria.idCategoria
ORDER BY oferta.idOferta;

/* 4. Vista de Candidatos (vistaCandidatos)
Propósito: Presenta los datos básicos de los candidatos registrados, como su ID, nombre completo, correo electrónico, teléfono y fecha de nacimiento.
Utilidad: Es útil para tener una lista rápida de todos los candidatos y acceder a su información básica para futuras interacciones. */
CREATE OR REPLACE VIEW vistaCandidatos AS
SELECT candidato.idCandidato,
       CONCAT(candidato.primerNombre, ' ', candidato.primerApellido) AS "nombre_completo",
       candidato.correoElectronico AS "correo",
       candidato.telefono AS "telefono",
       candidato.fechaNacimiento AS "fecha_nacimiento"
FROM Candidatos candidato
ORDER BY candidato.idCandidato;

/* 5. Vista de Aplicaciones a Ofertas (vistaAplicaciones)
Propósito: Muestra las aplicaciones de los candidatos a las ofertas de empleo, incluyendo la fecha de aplicación, el ID del candidato y el ID de la oferta.
Utilidad: Facilita el análisis de las aplicaciones recibidas por cada oferta, permitiendo saber quién se postuló a qué oferta. */
CREATE OR REPLACE VIEW vistaAplicaciones AS
SELECT aplicacion.idAplicacion,
       aplicacion.fechaAplicacion AS "fecha_aplicacion",
       candidato.idCandidato AS "id_candidato",
       oferta.idOferta AS "id_oferta"
FROM Aplicaciones aplicacion
LEFT JOIN Candidatos candidato ON aplicacion.idCandidato = candidato.idCandidato
LEFT JOIN Ofertas oferta ON aplicacion.idOferta = oferta.idOferta
ORDER BY aplicacion.idAplicacion;

/* 6. Vista de Postulaciones Recientes (vistaPostulacionesRecientes)
Propósito: Muestra las postulaciones realizadas en los últimos 7 días, incluyendo la fecha de la aplicación, el nombre del candidato y el título de la oferta.
Utilidad: Ayuda a ver rápidamente las postulaciones recientes para hacer un seguimiento de las últimas aplicaciones y actuar en consecuencia. */
CREATE OR REPLACE VIEW vistaPostulacionesRecientes AS
SELECT aplicacion.idAplicacion,
       aplicacion.fechaAplicacion AS "fecha_aplicacion",
       oferta.titulo AS "titulo_oferta",
       CONCAT(candidato.primerNombre, ' ', candidato.primerApellido) AS "nombre_candidato"
FROM Aplicaciones aplicacion
LEFT JOIN Ofertas oferta ON aplicacion.idOferta = oferta.idOferta
LEFT JOIN Candidatos candidato ON aplicacion.idCandidato = candidato.idCandidato
WHERE aplicacion.fechaAplicacion > NOW() - INTERVAL '7 days'
ORDER BY aplicacion.fechaAplicacion DESC;

/* 7. Vista de Empresas con Ofertas Activas (vistaEmpresasConOfertas)
Propósito: Muestra las empresas que tienen ofertas activas y cuántas ofertas han publicado.
Utilidad: Esta vista es útil para identificar las empresas que están contratando en el momento y cuántas oportunidades laborales están ofreciendo. */
CREATE OR REPLACE VIEW vistaEmpresasConOfertas AS
SELECT empresa.idEmpresa,
       empresa.nombre AS "nombre_empresa",
       COUNT(oferta.idOferta) AS "ofertas_activas"
FROM Empresas empresa
LEFT JOIN Ofertas oferta ON empresa.idEmpresa = oferta.idEmpresa
WHERE oferta.estado = 'activo'
GROUP BY empresa.idEmpresa
ORDER BY empresa.idEmpresa;

/* 8. Vista de Candidatos por Oferta (vistaCandidatosPorOferta)
Propósito: Muestra la cantidad de candidatos que han postulado a cada oferta, junto con el título de la oferta.
Utilidad: Permite ver la competencia de cada oferta de empleo, es decir, cuántos candidatos se han postulado a una oferta en particular.*/
CREATE OR REPLACE VIEW vistaCandidatosPorOferta AS
SELECT oferta.idOferta,
       oferta.titulo AS "titulo_oferta",
       COUNT(aplicacion.idAplicacion) AS "num_candidatos"
FROM Ofertas oferta
LEFT JOIN Aplicaciones aplicacion ON oferta.idOferta = aplicacion.idOferta
GROUP BY oferta.idOferta
ORDER BY oferta.idOferta;

/* 9. Vista de Candidatos Rechazados (vistaCandidatosRechazados)
Propósito: Muestra los candidatos que han sido rechazados en sus aplicaciones a ofertas, junto con la oferta a la que postularon.
Utilidad: Permite hacer un seguimiento de los candidatos rechazados, facilitando la gestión de la comunicación con estos.*/
CREATE OR REPLACE VIEW vistaCandidatosRechazados AS
SELECT candidato.idCandidato,
       CONCAT(candidato.primerNombre, ' ', candidato.primerApellido) AS "nombre_completo",
       aplicacion.fechaAplicacion AS "fecha_aplicacion",
       oferta.titulo AS "titulo_oferta"
FROM Aplicaciones aplicacion
LEFT JOIN Candidatos candidato ON aplicacion.idCandidato = candidato.idCandidato
LEFT JOIN Ofertas oferta ON aplicacion.idOferta = oferta.idOferta
WHERE aplicacion.estado = 'rechazado'
ORDER BY aplicacion.fechaAplicacion DESC;

/* 10. Vista de Candidatos Contratados (vistaCandidatosContratados)
Propósito: Muestra los candidatos que han sido contratados para ofertas específicas, incluyendo el nombre del candidato y la oferta a la que se postuló.
Utilidad: Facilita la visualización de los candidatos seleccionados para los trabajos, lo cual es útil para seguimiento y análisis de contratación.*/
CREATE OR REPLACE VIEW vistaCandidatosContratados AS
SELECT candidato.idCandidato,
       CONCAT(candidato.primerNombre, ' ', candidato.primerApellido) AS "nombre_completo",
       oferta.titulo AS "titulo_oferta",
       aplicacion.fechaAplicacion AS "fecha_aplicacion"
FROM Aplicaciones aplicacion
LEFT JOIN Candidatos candidato ON aplicacion.idCandidato = candidato.idCandidato
LEFT JOIN Ofertas oferta ON aplicacion.idOferta = oferta.idOferta
WHERE aplicacion.estado = 'contratado'
ORDER BY aplicacion.fechaAplicacion DESC;

/* 11. Vista de Ofertas por Salario (vistaOfertasPorSalario)
Propósito: Muestra las ofertas de empleo ordenadas por el salario que ofrecen, junto con el nombre de la empresa que las publica.
Utilidad: Permite filtrar y analizar las ofertas en función del salario ofrecido, lo cual es útil para los candidatos que buscan mejores compensaciones.*/
CREATE OR REPLACE VIEW vistaOfertasPorSalario AS
SELECT oferta.idOferta,
       oferta.titulo AS "titulo_oferta",
       oferta.salario AS "salario",
       empresa.nombre AS "nombre_empresa"
FROM Ofertas oferta
LEFT JOIN Empresas empresa ON oferta.idEmpresa = empresa.idEmpresa
ORDER BY oferta.salario DESC;

/* 12. Vista de Ofertas con Fecha de Expiración (vistaOfertasConExpiracion)
Propósito: Muestra las ofertas de empleo cuya fecha de expiración aún no ha pasado, junto con la empresa que las publica y la fecha de expiración.
Utilidad: Permite a los usuarios conocer las ofertas vigentes y las que pronto caducarán, lo que es útil para no perder oportunidades.*/
CREATE OR REPLACE VIEW vistaOfertasConExpiracion AS
SELECT oferta.idOferta,
       oferta.titulo AS "titulo_oferta",
       oferta.fechaExpiracion AS "fecha_expiracion",
       empresa.nombre AS "nombre_empresa"
FROM Ofertas oferta
LEFT JOIN Empresas empresa ON oferta.idEmpresa = empresa.idEmpresa
WHERE oferta.fechaExpiracion > NOW()
ORDER BY oferta.fechaExpiracion;

/* 13. Vista de Candidatos en Espera (vistaCandidatosEnEspera)
Propósito: Muestra los candidatos cuya solicitud está en espera (no aceptada ni rechazada), junto con la oferta a la que postularon.
Utilidad: Ayuda a gestionar las solicitudes que aún están siendo evaluadas, lo cual es clave para las empresas que están en proceso de selección.*/
CREATE OR REPLACE VIEW vistaCandidatosEnEspera AS
SELECT candidato.idCandidato,
       CONCAT(candidato.primerNombre, ' ', candidato.primerApellido) AS "nombre_completo",
       oferta.titulo AS "titulo_oferta",
       aplicacion.fechaAplicacion AS "fecha_aplicacion"
FROM Aplicaciones aplicacion
LEFT JOIN Candidatos candidato ON aplicacion.idCandidato = candidato.idCandidato
LEFT JOIN Ofertas oferta ON aplicacion.idOferta = oferta.idOferta
WHERE aplicacion.estado = 'espera'
ORDER BY aplicacion.fechaAplicacion DESC;

/* 14. Vista de Empresas con Más Candidatos (vistaEmpresasMasCandidatos)
Propósito: Muestra las empresas que han recibido la mayor cantidad de aplicaciones, junto con el número de ofertas activas que tienen.
Utilidad: Proporciona una visión de las empresas más populares o las que están recibiendo más atención de los candidatos.*/
CREATE OR REPLACE VIEW vistaEmpresasMasCandidatos AS
SELECT empresa.idEmpresa,
       empresa.nombre AS "nombre_empresa",
       COUNT(aplicacion.idAplicacion) AS "num_candidatos"
FROM Empresas empresa
LEFT JOIN Ofertas oferta ON empresa.idEmpresa = oferta.idEmpresa
LEFT JOIN Aplicaciones aplicacion ON oferta.idOferta = aplicacion.idOferta
GROUP BY empresa.idEmpresa
ORDER BY COUNT(aplicacion.idAplicacion) DESC;

/* 15. Vista de Ofertas por Ubicación (vistaOfertasPorUbicacion)
Propósito: Muestra las ofertas de empleo filtradas por la ubicación de la empresa, junto con su título y la empresa que las publica.
Utilidad: Permite a los usuarios encontrar ofertas basadas en una ubicación geográfica específica, lo que es útil para candidatos que buscan empleo en un área determinada.*/
CREATE OR REPLACE VIEW vistaOfertasPorUbicacion AS
SELECT oferta.idOferta,
       oferta.titulo AS "titulo_oferta",
       empresa.ubicacion AS "ubicacion_empresa",
       empresa.nombre AS "nombre_empresa"
FROM Ofertas oferta
LEFT JOIN Empresas empresa ON oferta.idEmpresa = empresa.idEmpresa
ORDER BY empresa.ubicacion, oferta.idOferta;

/* 16. Vista de Candidatos por Edad (vistaCandidatosPorEdad)
Propósito: Muestra los candidatos ordenados por su edad, calculada a partir de su fecha de nacimiento.
Utilidad: Esta vista es útil para ver la distribución de edades de los candidatos y realizar análisis demográficos.*/
CREATE OR REPLACE VIEW vistaCandidatosPorEdad AS
SELECT candidato.idCandidato,
       CONCAT(candidato.primerNombre, ' ', candidato.primerApellido) AS "nombre_completo",
       candidato.fechaNacimiento AS "fecha_nacimiento",
       EXTRACT(YEAR FROM AGE(candidato.fechaNacimiento)) AS "edad"
FROM Candidatos candidato
ORDER BY edad DESC;

/* 17. Vista de Candidatos con Más de una Aplicación (vistaCandidatosConVariasAplicaciones)
Propósito: Muestra los candidatos que han postulado a más de una oferta, junto con la cantidad de aplicaciones realizadas.
Utilidad: Permite identificar a los candidatos más activos en la plataforma, lo cual puede ser útil para las empresas que buscan candidatos comprometidos.*/
CREATE OR REPLACE VIEW vistaCandidatosConVariasAplicaciones AS
SELECT candidato.idCandidato,
       CONCAT(candidato.primerNombre, ' ', candidato.primerApellido) AS "nombre_completo",
       COUNT(aplicacion.idAplicacion) AS "num_aplicaciones"
FROM Candidatos candidato
LEFT JOIN Aplicaciones aplicacion ON candidato.idCandidato = aplicacion.idCandidato
GROUP BY candidato.idCandidato
HAVING COUNT(aplicacion.idAplicacion) > 1
ORDER BY COUNT(aplicacion.idAplicacion) DESC;

/* 18. Vista de Ofertas con Más de un Candidato (vistaOfertasConMasDeUnCandidato)
Propósito: Muestra las ofertas que han recibido más de una aplicación, junto con la cantidad de postulaciones.
Utilidad: Ayuda a las empresas a ver cuáles ofertas están atrayendo más candidatos, lo que puede indicar un interés alto por esas posiciones.*/
CREATE OR REPLACE VIEW vistaOfertasConMasDeUnCandidato AS
SELECT oferta.idOferta,
       oferta.titulo AS "titulo_oferta",
       COUNT(aplicacion.idAplicacion) AS "num_candidatos"
FROM Ofertas oferta
LEFT JOIN Aplicaciones aplicacion ON oferta.idOferta = aplicacion.idOferta
GROUP BY oferta.idOferta
HAVING COUNT(aplicacion.idAplicacion) > 1
ORDER BY COUNT(aplicacion.idAplicacion) DESC;

/* 19. Vista de Empresas con Ofertas y Candidatos (vistaEmpresasConOfertasYCandidatos)
Propósito: Muestra las empresas con el número de ofertas activas que tienen y la cantidad de candidatos que han postulado a esas ofertas.
Utilidad: Permite obtener un panorama de las empresas más activas tanto en términos de ofertas como de atracción de candidatos.*/
CREATE OR REPLACE VIEW vistaEmpresasConOfertasYCandidatos AS
SELECT empresa.idEmpresa,
       empresa.nombre AS "nombre_empresa",
       COUNT(oferta.idOferta) AS "num_ofertas",
       COUNT(aplicacion.idAplicacion) AS "num_candidatos"
FROM Empresas empresa
LEFT JOIN Ofertas oferta ON empresa.idEmpresa = oferta.idEmpresa
LEFT JOIN Aplicaciones aplicacion ON oferta.idOferta = aplicacion.idOferta
GROUP BY empresa.idEmpresa
ORDER BY empresa.idEmpresa;

/* 20. Vista de Candidatos Rechazados en el Último Mes (vistaCandidatosRechazadosMes)
Propósito: Muestra los candidatos rechazados en el último mes, junto con la oferta a la que se postularon y la fecha de la aplicación.
Utilidad: Proporciona una visión de los rechazos recientes, lo cual puede ser útil para análisis de desempeño de candidatos y para la retroalimentación en procesos de selección.*/
CREATE OR REPLACE VIEW vistaCandidatosRechazadosMes AS
SELECT candidato.idCandidato,
       CONCAT(candidato.primerNombre, ' ', candidato.primerApellido) AS "nombre_completo",
       aplicacion.fechaAplicacion AS "fecha_aplicacion",
       oferta.titulo AS "titulo_oferta"
FROM Aplicaciones aplicacion
LEFT JOIN Candidatos candidato ON aplicacion.idCandidato = candidato.idCandidato
LEFT JOIN Ofertas oferta ON aplicacion.idOferta = oferta.idOferta
WHERE aplicacion.estado = 'rechazado' AND aplicacion.fechaAplicacion > NOW() - INTERVAL '1 month'
ORDER BY aplicacion.fechaAplicacion DESC;
