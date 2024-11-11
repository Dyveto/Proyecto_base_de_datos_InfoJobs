-- 1. Insertar datos en la tabla Usuario (Usuarios genéricos de la plataforma: candidatos y empleadores)
INSERT INTO Usuario (Nombre_completo, Correo, Telefono)
VALUES 
('Carlos López', 'carlos.lopez@mail.com', 3112345678),
('Ana García', 'ana.garcia@mail.com', 3123456789),
('Juan Pérez', 'juan.perez@mail.com', 3134567890),
('María Rodríguez', 'maria.rodriguez@mail.com', 3145678901),
('Pedro Sánchez', 'pedro.sanchez@mail.com', 3156789012),
('Sofía Morales', 'sofia.morales@mail.com', 3167890123),
('Luis Gómez', 'luis.gomez@mail.com', 3178901234),
('Laura Torres', 'laura.torres@mail.com', 3189012345),
('Jorge Ramírez', 'jorge.ramirez@mail.com', 3190123456),
('Daniela Fernández', 'daniela.fernandez@mail.com', 3201234567),
('Raúl Castro', 'raul.castro@mail.com', 3113456789),
('Andrea Pineda', 'andrea.pineda@mail.com', 3124567890),
('Miguel Castillo', 'miguel.castillo@mail.com', 3135678901),
('Elena Ríos', 'elena.rios@mail.com', 3146789012),
('David Vargas', 'david.vargas@mail.com', 3157890123),
('Lucía Medina', 'lucia.medina@mail.com', 3168901234),
('Manuel Herrera', 'manuel.herrera@mail.com', 3179012345),
('Carolina Fuentes', 'carolina.fuentes@mail.com', 3180123456),
('Felipe Martínez', 'felipe.martinez@mail.com', 3191234567),
('Gabriela Reyes', 'gabriela.reyes@mail.com', 3202345678);

-- 2. Insertar datos en la tabla Candidato (Usuarios registrados como candidatos)
INSERT INTO Candidato (ID_usuario)
VALUES 
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

-- 3. Insertar datos en la tabla Administrador (Usuarios registrados como administradores)
INSERT INTO Administrador (ID_usuario)
VALUES 
(11), (12);

-- 4. Insertar datos en la tabla Empleador (Empresas que publican ofertas de empleo)
INSERT INTO Empleador (Nombre_empresa, Sector, Ubicacion)
VALUES 
('TechSolutions', 'Tecnología', 'Madrid'),
('HealthCare Corp', 'Salud', 'Barcelona'),
('Fintech Innovators', 'Finanzas', 'Londres'),
('EduFuture', 'Educación', 'Madrid'),
('EcoEnergy', 'Energía', 'Berlín'),
('RetailCo', 'Retail', 'Nueva York'),
('TransportPro', 'Logística', 'París'),
('FoodPlus', 'Alimentos', 'Roma'),
('AutoTech', 'Automotriz', 'Tokio'),
('MediLife', 'Medicina', 'Lisboa');

-- 5. Insertar datos en la tabla Oferta_de_empleo (Ofertas de empleo publicadas por empleadores)
INSERT INTO Oferta_de_empleo (Descripcion, Fecha_publicacion, Requisitos, Salario, ID_Empresa)
VALUES 
('Desarrollador Backend', '2024-11-01', 'Experiencia en Node.js, SQL, Git', 3500, 1),
('Analista de Datos', '2024-10-28', 'Manejo de Python, SQL, Power BI', 3000, 2),
('Especialista en Blockchain', '2024-11-02', 'Conocimiento en criptomonedas, contratos inteligentes', 6000, 3),
('Profesor de Matemáticas', '2024-10-30', 'Licenciatura en Matemáticas', 2500, 4),
('Ingeniero Energético', '2024-11-05', 'Conocimiento en energías renovables', 5000, 5),
('Gerente de Marketing', '2024-10-31', 'Experiencia en e-commerce y marketing digital', 4500, 6),
('Conductor de Camiones', '2024-11-03', 'Licencia de conducción C+E', 2800, 7),
('Chef Profesional', '2024-11-04', 'Experiencia en cocina internacional', 4000, 8),
('Ingeniero Mecánico', '2024-11-06', 'Conocimiento en diseño automotriz', 5500, 9),
('Médico General', '2024-11-07', 'Título en Medicina General', 5000, 10);

-- 6. Insertar datos en la tabla Beneficio_laboral (Beneficios laborales ofrecidos por empleadores)
INSERT INTO Beneficio_laboral (Nombre_del_beneficio, Descripcion)
VALUES 
('Seguro Médico', 'Cobertura médica privada'),
('Plan de Pensiones', 'Aporte a fondo de pensiones privado'),
('Teletrabajo', 'Posibilidad de trabajar desde casa'),
('Bono de Productividad', 'Bonificación según objetivos alcanzados'),
('Vacaciones Extra', 'Días adicionales de vacaciones anuales');

-- 7. Insertar datos en la tabla Empleador_Beneficio (Relación entre empleadores y beneficios)
INSERT INTO Empleador_Beneficio (ID_Empresa, ID_Beneficio)
VALUES 
(1, 1), (1, 2), (2, 1), (2, 3), (3, 4), (4, 5), (5, 1), (6, 2), (7, 3), (8, 4);

-- 8. Insertar datos en la tabla Contrato (Contratos asociados a las ofertas de empleo)
INSERT INTO Contrato (Tipo_de_contrato, Fecha_inicio, Fecha_fin, ID_Oferta)
VALUES 
('Indefinido', '2024-12-01', NULL, 1),
('Temporal', '2024-11-15', '2025-05-15', 2),
('Indefinido', '2024-12-10', NULL, 3),
('Temporal', '2024-11-20', '2025-03-20', 4),
('Indefinido', '2024-12-01', NULL, 5),
('Indefinido', '2024-11-25', NULL, 6),
('Temporal', '2024-12-01', '2025-06-01', 7),
('Indefinido', '2024-12-05', NULL, 8),
('Indefinido', '2024-12-10', NULL, 9),
('Indefinido', '2024-12-15', NULL, 10);

-- 9. Insertar datos en la tabla Actividad (Actividades de la plataforma)
INSERT INTO Actividad (Descripcion, Fecha)
VALUES 
('Postulación a oferta de empleo', '2024-11-01'),
('Revisión de perfil de candidato', '2024-11-02'),
('Actualización de información de empresa', '2024-11-03'),
('Publicación de nueva oferta de empleo', '2024-11-04'),
('Recepción de postulaciones', '2024-11-05'),
('Revisión de presupuesto', '2024-11-06'),
('Lanzamiento de campaña', '2024-11-07'),
('Evaluación de nuevos candidatos', '2024-11-08'),
('Planificación de marketing', '2024-11-09'),
('Desarrollo de nuevos productos', '2024-11-10');

-- 10. Insertar datos en la tabla Bloqueo (Registros de bloqueo de empleadores)
INSERT INTO Bloqueo (Razon, Fecha_de_bloqueo, ID_Empleador)
VALUES 
('Incumplimiento de normas de publicación', '2024-11-01', 7),
('Reporte de actividades fraudulentas', '2024-11-03', 8);

-- 11. Insertar datos en la tabla Contacto_RRHH (Contactos de RRHH de las empresas)
INSERT INTO Contacto_RRHH (Nombre, Telefono, Correo_electronico, ID_Empresa)
VALUES 
('Sara Martínez', 3141234567, 'sara.martinez@techsolutions.com', 1),
('Luis Domínguez', 3152345678, 'luis.dominguez@healthcare.com', 2),
('Elena Blanco', 3163456789, 'elena.blanco@fintech.com', 3),
('Pedro Navarro', 3174567890, 'pedro.navarro@edufuture.com', 4),
('Ana Gutiérrez', 3185678901, 'ana.gutierrez@ecoenergy.com', 5),
('Carolina Ruiz', 3196789012, 'carolina.ruiz@retailco.com', 6),
('Jorge Fernández', 3207890123, 'jorge.fernandez@transportpro.com', 7),
('Laura Sánchez', 3218901234, 'laura.sanchez@foodplus.com', 8),
('Carlos Gómez', 3229012345, 'carlos.gomez@autotech.com', 9),
('Daniel Pérez', 3230123456, 'daniel.perez@medilife.com', 10);

-- 12. Insertar datos en la tabla Postulacion (Registros de postulaciones a ofertas)
INSERT INTO Postulacion (Fecha_postulacion, Estado, ID_Candidato, ID_Oferta)
VALUES 
('2024-11-01', 'Pendiente', 1, 1),
('2024-11-01', 'Pendiente', 2, 2),
('2024-11-02', 'Pendiente', 3, 3),
('2024-11-02', 'Pendiente', 4, 4),
('2024-11-03', 'Pendiente', 5, 5),
('2024-11-03', 'Pendiente', 6, 6),
('2024-11-04', 'Pendiente', 7, 7),
('2024-11-04', 'Pendiente', 8, 8),
('2024-11-05', 'Pendiente', 9, 9),
('2024-11-05', 'Pendiente', 10, 10);

/*
Explicación de las inserciones:
Usuarios, Candidatos, Administradores, Empleadores: Primero se insertan los usuarios genéricos, luego se asocian con sus roles específicos (candidatos, administradores, empleadores).
Ofertas de empleo: Las ofertas están relacionadas con los empleadores.
Beneficios laborales: Se insertan los beneficios y luego se relacionan con las empresas mediante la tabla Empleador_Beneficio.
Contratos: Cada oferta de empleo tiene un contrato asociado.
Bloqueos: Se registran empleadores bloqueados.
Contactos de RRHH: Cada empleador tiene su contacto de recursos humanos.
Postulaciones: Candidatos postulados a las ofertas disponibles.
*/

-- 13. Insertar datos en la tabla Reporte (Registros de reportes realizados por candidatos)
INSERT INTO Reporte (Fecha_reporte, Motivo, ID_Candidato)
VALUES 
('2024-11-05', 'Discriminación en proceso de selección', 1),
('2024-11-06', 'Falsa oferta de empleo', 2),
('2024-11-07', 'Ofrecimiento de empleo fraudulento', 3),
('2024-11-08', 'Irregularidades en entrevista', 4),
('2024-11-09', 'Malas condiciones laborales', 5),
('2024-11-10', 'Incumplimiento de salario', 6),
('2024-11-11', 'Falta de contrato formal', 7),
('2024-11-12', 'Prácticas ilegales', 8),
('2024-11-13', 'Publicidad engañosa', 9),
('2024-11-14', 'Proceso de selección manipulado', 10);

-- 14. Insertar datos en la tabla FAQ (Preguntas frecuentes)
INSERT INTO FAQ (Pregunta, Respuesta)
VALUES 
('¿Cómo postularse a una oferta de empleo?', 'Debes registrarte como candidato y completar tu perfil antes de postularte.'),
('¿Qué documentos necesito subir?', 'Sube tu CV actualizado y cualquier otro documento que respalde tu experiencia.'),
('¿Cómo puedo modificar mis datos personales?', 'Ingresa a tu perfil y selecciona la opción "Editar datos personales".'),
('¿Cómo contacto con una empresa?', 'No puedes contactar directamente a una empresa, solo puedes aplicar a sus ofertas.'),
('¿Cómo denunciar una oferta fraudulenta?', 'Utiliza el botón de "Denunciar" disponible en cada oferta de empleo.');

-- 15. Insertar datos en la tabla Idioma (Idiomas conocidos por los candidatos)
INSERT INTO Idioma (Nombre, Nivel_dominio, ID_Candidato)
VALUES 
('Inglés', 4, 1), ('Francés', 3, 2), ('Alemán', 2, 3), ('Inglés', 5, 4), ('Italiano', 3, 5),
('Inglés', 5, 6), ('Chino', 1, 7), ('Portugués', 2, 8), ('Ruso', 3, 9), ('Japonés', 2, 10);

-- 16. Insertar datos en la tabla Referencia (Referencias profesionales de los candidatos)
INSERT INTO Referencia (Nombre_de_contacto, ID_Candidato)
VALUES 
('Javier Gómez', 1), ('Laura Sánchez', 2), ('Raúl Martínez', 3), ('Ana Fernández', 4), 
('Carlos Rivera', 5), ('María López', 6), ('José Pineda', 7), ('Sofía Gómez', 8), 
('Luis Ramírez', 9), ('Pedro Castro', 10);

-- 17. Insertar datos en la tabla Certificacion (Certificaciones de los candidatos)
INSERT INTO Certificacion (Titulo, Institucion, Año_obtencion, Descripcion, ID_Candidato)
VALUES 
('Certified Java Developer', 'Oracle', '2022-05-01', 'Certificación en desarrollo Java', 1),
('Data Analyst Professional', 'Coursera', '2023-06-15', 'Certificación en análisis de datos', 2),
('AWS Certified Solutions Architect', 'Amazon', '2021-08-20', 'Certificación en arquitecturas AWS', 3),
('Project Management Professional (PMP)', 'PMI', '2020-09-10', 'Gestión de proyectos', 4),
('Certified Ethical Hacker', 'EC-Council', '2023-10-25', 'Certificación en ciberseguridad', 5),
('Google Cloud Professional', 'Google', '2022-03-12', 'Certificación en soluciones Google Cloud', 6),
('Certified Scrum Master', 'Scrum Alliance', '2023-02-18', 'Certificación en metodologías ágiles', 7),
('Salesforce Administrator', 'Salesforce', '2021-07-01', 'Administración de Salesforce', 8),
('Machine Learning Specialist', 'edX', '2023-11-02', 'Especialización en aprendizaje automático', 9),
('Python for Data Science', 'edX', '2024-01-05', 'Certificación en Python para ciencia de datos', 10);

-- 18. Insertar datos en la tabla Habilidad (Habilidades de los candidatos)
INSERT INTO Habilidad (Descripcion, Nivel_competencia, ID_Candidato)
VALUES 
('Programación en Python', 5, 1), ('Análisis de datos', 4, 2), ('Desarrollo en Java', 5, 3),
('Gestión de proyectos', 4, 4), ('Ciberseguridad', 5, 5), ('Cloud Computing', 4, 6), 
('Metodologías ágiles', 5, 7), ('Administración de CRM', 3, 8), ('Aprendizaje automático', 4, 9), 
('Desarrollo en R', 3, 10);

-- 19. Insertar datos en la tabla Historial_laboral (Experiencia laboral de los candidatos)
INSERT INTO Historial_laboral (Nombre_empresa, Cargo, Fecha_inicio, Fecha_fin, Descripcion, ID_Candidato)
VALUES 
('Tech Corp', 'Desarrollador Full Stack', '2021-05-01', '2023-06-30', 'Desarrollo de aplicaciones web', 1),
('Data Solutions', 'Analista de Datos', '2020-01-15', '2023-05-01', 'Análisis de grandes volúmenes de datos', 2),
('Finance Co.', 'Desarrollador Backend', '2021-03-01', '2024-05-01', 'Desarrollo de APIs para banca', 3),
('EduTech', 'Gestor de Proyectos', '2019-09-01', '2024-10-01', 'Gestión de proyectos educativos', 4),
('CyberSecurity Ltd.', 'Especialista en Ciberseguridad', '2020-11-01', '2024-07-01', 'Implementación de seguridad en redes', 5),
('Cloud Innovators', 'Ingeniero de Cloud', '2022-02-01', '2024-08-01', 'Diseño de soluciones en la nube', 6),
('Agile Solutions', 'Scrum Master', '2021-06-01', '2024-10-01', 'Liderazgo de equipos ágiles', 7),
('CRM Systems', 'Administrador de CRM', '2020-05-01', '2023-04-01', 'Gestión de clientes con CRM', 8),
('AI Research Lab', 'Especialista en Machine Learning', '2022-03-01', '2024-09-01', 'Investigación en IA', 9),
('Data Science Lab', 'Científico de Datos', '2023-01-01', NULL, 'Desarrollo de modelos de datos', 10);

-- 20. Insertar datos en la tabla Evaluacion_candidatos (Evaluaciones de candidatos por parte de empleadores)
INSERT INTO Evaluacion_candidatos (Comentarios, Calificacion, ID_Postulacion)
VALUES 
('Buen manejo de tecnologías, recomendado', '8/10', 1),
('Falta de experiencia en análisis avanzado', '6/10', 2),
('Excelente conocimiento de blockchain', '9/10', 3),
('Poca experiencia en el sector educativo', '5/10', 4),
('Buen manejo de energías renovables', '8/10', 5),
('Gran capacidad de liderazgo', '9/10', 6),
('Cumple con los requisitos, pero podría mejorar', '7/10', 7),
('Alta competencia en habilidades de cocina', '8/10', 8),
('Muy buen ingeniero, con amplio conocimiento', '9/10', 9),
('Profesional altamente capacitado en medicina', '9/10', 10);

-- 21. Insertar datos en la tabla Feedback (Comentarios y evaluaciones dejados por usuarios)
INSERT INTO Feedback (Comentario, Evaluacion, ID_usuario)
VALUES 
('La plataforma es fácil de usar', 9, 1),
('No pude contactar con ninguna empresa', 5, 2),
('Excelente plataforma, pero falta soporte', 7, 3),
('Encontré empleo en pocos días', 10, 4),
('El proceso de postulación es confuso', 6, 5),
('Buena experiencia general, pero faltan ofertas', 8, 6),
('Muchas ofertas interesantes, pero poco soporte', 7, 7),
('La navegación podría mejorar', 6, 8),
('Muy fácil encontrar ofertas', 9, 9),
('El soporte es muy lento', 5, 10);

-- 22. Insertar datos en la tabla Preferencia_laboral (Preferencias laborales de los usuarios)
INSERT INTO Preferencia_laboral (Tipo_de_empleo, Jornada_deseada, ID_usuario)
VALUES 
('Tiempo completo', 'Mañana', 1), ('Freelance', 'Tarde', 2), ('Medio tiempo', 'Mañana', 3),
('Tiempo completo', 'Tarde', 4), ('Prácticas', 'Mañana', 5), ('Freelance', 'Noche', 6),
('Medio tiempo', 'Noche', 7), ('Tiempo completo', 'Tarde', 8), ('Prácticas', 'Mañana', 9), 
('Tiempo completo', 'Mañana', 10);

/* 
Explicación de las inserciones:
Reporte: Se insertan denuncias realizadas por los candidatos sobre problemas en las ofertas de empleo.
FAQ: Preguntas frecuentes relevantes para la plataforma.
Idioma: Idiomas que manejan los candidatos con sus respectivos niveles.
Referencia: Contactos de referencia profesional para cada candidato.
Certificación: Certificaciones obtenidas por los candidatos.
Habilidad: Habilidades técnicas o blandas de los candidatos.
Historial laboral: Experiencias profesionales de los candidatos.
Evaluación de candidatos: Evaluaciones de los candidatos que han postulado a ofertas.
Feedback: Comentarios y evaluaciones generales de los usuarios sobre la plataforma.
Preferencia laboral: Preferencias de empleo (tipo de empleo, jornada deseada) de los usuarios. */

-- 23. Insertar datos en la tabla Candidato_Oferta (Relación entre candidatos y ofertas)
INSERT INTO Candidato_Oferta (ID_usuario, ID_Oferta)
VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 2), (2, 3), (3, 4), (4, 5), (5, 6),
(6, 7), (7, 8), (8, 9), (9, 10), (10, 1);

-- 24. Insertar datos en la tabla Candidato_Preferencia (Relación entre candidatos y sus preferencias laborales)
INSERT INTO Candidato_Preferencia (ID_usuario, ID_Preferencia)
VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 3), (2, 4), (3, 5), (4, 6), (5, 7),
(6, 8), (7, 9), (8, 10), (9, 1), (10, 2);

-- 25. Insertar datos en la tabla Reporte_Oferta (Relación entre reportes y ofertas de empleo)
INSERT INTO Reporte_Oferta (ID_Reporte, ID_Oferta)
VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 2), (2, 3), (3, 4), (4, 5), (5, 6),
(6, 7), (7, 8), (8, 9), (9, 10), (10, 1);

-- 26. Insertar datos en la tabla Reporte_Empleador (Relación entre reportes y empleadores)
INSERT INTO Reporte_Empleador (ID_Reporte, ID_Empresa)
VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 2), (2, 3), (3, 4), (4, 5), (5, 6),
(6, 7), (7, 8), (8, 9), (9, 10), (10, 1);

-- 27. Insertar datos en la tabla Feedback_Candidato (Relación entre feedback de usuarios y candidatos)
INSERT INTO Feedback_Candidato (ID_Feedback, ID_usuario)
VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 2), (2, 3), (3, 4), (4, 5), (5, 6),
(6, 7), (7, 8), (8, 9), (9, 10), (10, 1);

-- 28. Insertar datos en la tabla Empleador_Beneficio (Relación entre empleadores y los beneficios que ofrecen)
INSERT INTO Empleador_Beneficio (ID_Empresa, ID_Beneficio)
VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 3), (2, 4), (3, 5), (4, 6), (5, 7),
(6, 8), (7, 9), (8, 1), (9, 2), (10, 3);

-- 29. Insertar datos en la tabla Actividad_Empleador (Relación entre empleadores y las actividades que realizan)
INSERT INTO Actividad_Empleador (ID_Actividad, ID_Empresa)
VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 2), (2, 3), (3, 4), (4, 5), (5, 6),
(6, 7), (7, 8), (8, 9), (9, 10), (10, 1);

/* 
Explicación de las inserciones:
Candidato_Oferta: Esta tabla establece la relación entre los candidatos y las ofertas de empleo a las que se han postulado. Los candidatos pueden postularse a varias ofertas, y cada oferta puede tener varios postulantes.
Candidato_Preferencia: Relaciona a cada candidato con sus preferencias laborales (por ejemplo, tipo de empleo o jornada deseada). Cada candidato puede tener varias preferencias.
Reporte_Oferta: Conecta los reportes realizados por los candidatos con las ofertas de empleo relacionadas con esos reportes. Cada reporte puede estar asociado a una o más ofertas.
Reporte_Empleador: Relaciona los reportes de los candidatos con las empresas que publicaron las ofertas, lo que permite ver qué empleadores están siendo reportados.
Feedback_Candidato: Relaciona el feedback que los usuarios dejan sobre la plataforma con los candidatos involucrados. Esto permite tener una evaluación de cómo los candidatos están experimentando el proceso. 
Empleador_Beneficio: Relaciona a cada empleador con los beneficios que ofrecen a los empleados. Los beneficios pueden variar entre las empresas y son asociados a través de esta tabla.
Actividad_Empleador: Establece la relación entre las actividades realizadas por los empleadores y las empresas que las llevan a cabo. Las actividades podrían incluir cosas como eventos de reclutamiento, sesiones de capacitación, entre otros.
*/

