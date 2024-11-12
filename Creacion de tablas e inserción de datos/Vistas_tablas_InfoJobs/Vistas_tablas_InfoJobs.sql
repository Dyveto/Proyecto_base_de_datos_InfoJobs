/* 1. Vista de Información de Usuario 
Explicación: Esta vista proporciona los datos básicos de los usuarios, incluyendo su nombre, correo electrónico y teléfono.*/
CREATE OR REPLACE VIEW vistaUsuario AS
SELECT ID_usuario, Nombre_completo, Correo, Telefono
FROM Usuario;


/* 2. Vista de Candidatos
Explicación: Muestra los datos de los usuarios que son candidatos, uniendo las tablas Usuario y Candidato. */
CREATE OR REPLACE VIEW vistaCandidatos AS
SELECT u.ID_usuario, u.Nombre_completo, u.Correo, u.Telefono
FROM Candidato c
JOIN Usuario u ON c.ID_usuario = u.ID_usuario;


/* 3. Vista de Empleadores
Explicación: Proporciona información sobre las empresas que son empleadores en la plataforma. */
CREATE OR REPLACE VIEW vistaEmpleadores AS
SELECT e.ID_Empresa, e.Nombre_empresa, e.Sector, e.Ubicacion
FROM Empleador e;


/* 4. Vista de Ofertas de Empleo
Explicación: Muestra las ofertas de empleo junto con la información sobre la empresa que las publica. */
CREATE OR REPLACE VIEW vistaOfertas AS
SELECT o.ID_Oferta, o.Descripcion, o.Fecha_publicacion, o.Salario, e.Nombre_empresa, o.Requisitos
FROM Oferta_de_empleo o
JOIN Empleador e ON o.ID_Empresa = e.ID_Empresa;


/* 5. Vista de Contratos
Explicación: Muestra los contratos asociados a las ofertas de empleo, con información sobre el tipo de contrato y las fechas. */
CREATE OR REPLACE VIEW vistaContratos AS
SELECT c.ID_Contrato, c.Tipo_de_contrato, c.Fecha_inicio, c.Fecha_fin, o.Descripcion AS Oferta
FROM Contrato c
JOIN Oferta_de_empleo o ON c.ID_Oferta = o.ID_Oferta;


/* 6. Vista de Actividades
Explicación: Proporciona información sobre las actividades registradas en el sistema. */
CREATE OR REPLACE VIEW vistaActividades AS
SELECT a.ID_Actividad, a.Descripcion, a.Fecha
FROM Actividad a;


/* 7. Vista de Bloqueos de Empleadores
Explicación: Muestra los bloqueos de empleadores junto con las razones y las fechas de bloqueo. */
CREATE OR REPLACE VIEW vistaBloqueos AS
SELECT b.ID_Bloqueo, b.Razon, b.Fecha_de_bloqueo, e.Nombre_empresa
FROM Bloqueo b
JOIN Empleador e ON b.ID_Empleador = e.ID_Empresa;


/* 8. Vista de Contactos RRHH
Explicación: Muestra la información de los contactos de recursos humanos de las empresas, incluyendo el nombre, teléfono y correo electrónico.*/
CREATE OR REPLACE VIEW vistaContactosRRHH AS
SELECT c.ID_Contacto, c.Nombre, c.Telefono, c.Correo_electronico, e.Nombre_empresa
FROM Contacto_RRHH c
JOIN Empleador e ON c.ID_Empresa = e.ID_Empresa;


/* 9. Vista de Reportes
Explicación: Muestra los reportes realizados por los candidatos, junto con los motivos y la fecha del reporte.*/
CREATE OR REPLACE VIEW vistaReportes AS
SELECT r.ID_Reporte, r.Fecha_reporte, r.Motivo, u.Nombre_completo AS Candidato
FROM Reporte r
JOIN Candidato c ON r.ID_Candidato = c.ID_usuario
JOIN Usuario u ON c.ID_usuario = u.ID_usuario;


/* 10. Vista de Idiomas de Candidatos
Explicación: Muestra los idiomas y el nivel de dominio de los candidatos, junto con sus nombres.*/
CREATE OR REPLACE VIEW vistaIdiomasCandidatos AS
SELECT i.ID_Idioma, i.Nombre, i.Nivel_dominio, u.Nombre_completo AS Candidato
FROM Idioma i
JOIN Candidato c ON i.ID_Candidato = c.ID_usuario
JOIN Usuario u ON c.ID_usuario = u.ID_usuario;


/* 11. Vista de Referencias de Candidatos
Explicación: Muestra las referencias laborales de los candidatos, incluyendo el nombre de contacto y el nombre del candidato.*/
CREATE OR REPLACE VIEW vistaReferenciasCandidatos AS
SELECT r.ID_Referencia, r.Nombre_de_contacto, u.Nombre_completo AS Candidato
FROM Referencia r
JOIN Candidato c ON r.ID_Candidato = c.ID_usuario
JOIN Usuario u ON c.ID_usuario = u.ID_usuario;


/* 12. Vista de Certificaciones de Candidatos
Explicación: Muestra las certificaciones de los candidatos, con los detalles de la certificación y el candidato asociado.*/
CREATE OR REPLACE VIEW vistaCertificacionesCandidatos AS
SELECT c.ID_Certificacion, c.Titulo, c.Institucion, c.Año_obtencion, c.Descripcion, u.Nombre_completo AS Candidato
FROM Certificacion c
JOIN Candidato ca ON c.ID_Candidato = ca.ID_usuario
JOIN Usuario u ON ca.ID_usuario = u.ID_usuario;


/* 13. Vista de Habilidades de Candidatos
Explicación: Muestra las habilidades de los candidatos, incluyendo la descripción y el nivel de competencia.*/
CREATE OR REPLACE VIEW vistaHabilidadesCandidatos AS
SELECT h.ID_Habilidad, h.Descripcion, h.Nivel_competencia, u.Nombre_completo AS Candidato
FROM Habilidad h
JOIN Candidato ca ON h.ID_Candidato = ca.ID_usuario
JOIN Usuario u ON ca.ID_usuario = u.ID_usuario;


/* 14. Vista de Postulaciones de Candidatos
Explicación: Muestra las postulaciones de los candidatos, junto con la oferta, la fecha y el estado de la postulación.*/
CREATE OR REPLACE VIEW vistaPostulaciones AS
SELECT p.ID_Postulacion, p.Fecha_postulacion, p.Estado, o.Descripcion AS Oferta, u.Nombre_completo AS Candidato
FROM Postulacion p
JOIN Oferta_de_empleo o ON p.ID_Oferta = o.ID_Oferta
JOIN Candidato c ON p.ID_Candidato = c.ID_usuario
JOIN Usuario u ON c.ID_usuario = u.ID_usuario;


/* 15. Vista de Historial Laboral de Candidatos
Explicación: Muestra el historial laboral de los candidatos, con la empresa, el cargo, las fechas de inicio y fin, y la descripción.*/
CREATE OR REPLACE VIEW vistaHistorialLaboral AS
SELECT h.ID_Historial, h.Nombre_empresa, h.Cargo, h.Fecha_inicio, h.Fecha_fin, h.Descripcion, u.Nombre_completo AS Candidato
FROM Historial_laboral h
JOIN Candidato c ON h.ID_Candidato = c.ID_usuario
JOIN Usuario u ON c.ID_usuario = u.ID_usuario;


/* 16. Vista de Evaluaciones de Candidatos
Explicación: Muestra las evaluaciones realizadas a los candidatos, con los comentarios y la calificación.*/
CREATE OR REPLACE VIEW vistaEvaluacionesCandidatos AS
SELECT e.ID_Evaluacion, e.Comentarios, e.Calificacion, p.ID_Postulacion, o.Descripcion AS Oferta
FROM Evaluacion_candidatos e
JOIN Postulacion p ON e.ID_Postulacion = p.ID_Postulacion
JOIN Oferta_de_empleo o ON p.ID_Oferta = o.ID_Oferta;


/* 17. Vista de Beneficios Laborales de Empleadores
Explicación: Muestra los beneficios laborales ofrecidos por las empresas, con sus descripciones.*/
CREATE OR REPLACE VIEW vistaBeneficiosLaborales AS
SELECT e.ID_Empresa, e.Nombre_empresa, b.Nombre_del_beneficio, b.Descripcion
FROM Empleador_Beneficio eb
JOIN Empleador e ON eb.ID_Empresa = e.ID_Empresa
JOIN Beneficio_laboral b ON eb.ID_Beneficio = b.ID_Beneficio;

/* 18. Vista de Actividades de Empleadores
Explicación: Muestra las actividades relacionadas con los empleadores.*/
CREATE OR REPLACE VIEW vistaActividadesEmpleadores AS
SELECT a.ID_Actividad, a.Descripcion, a.Fecha, e.Nombre_empresa
FROM Actividad_Empleador ae
JOIN Actividad a ON ae.ID_Actividad = a.ID_Actividad
JOIN Empleador e ON ae.ID_Empresa = e.ID_Empresa;

/* 19. Vista de Feedback de Usuarios
Explicación: Muestra los comentarios y evaluaciones dejados por los usuarios en la plataforma.*/
CREATE OR REPLACE VIEW vistaFeedbackUsuarios AS
SELECT f.ID_Feedback, f.Comentario, f.Evaluacion, u.Nombre_completo AS Usuario
FROM Feedback f
JOIN Usuario u ON f.ID_usuario = u.ID_usuario;


/* 20. Vista de Preferencias Laborales de Candidatos
Explicación: Muestra las preferencias laborales de los candidatos, con el tipo de empleo y la jornada deseada.*/
CREATE OR REPLACE VIEW vistaPreferenciasLaborales AS
SELECT p.Tipo_de_empleo, p.Jornada_deseada, u.Nombre_completo AS Candidato
FROM Preferencia_laboral p
JOIN Usuario u ON p.ID_usuario = u.ID_usuario;
