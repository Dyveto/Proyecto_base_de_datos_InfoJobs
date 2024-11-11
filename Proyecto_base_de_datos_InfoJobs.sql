-- Tabla Usuario
CREATE TABLE Usuario (
    ID_usuario SERIAL PRIMARY KEY,
    Nombre_completo VARCHAR(255) NOT NULL,
    Correo VARCHAR(255) NOT NULL,
    Telefono INTEGER NOT NULL
);

-- Tabla Candidato
CREATE TABLE Candidato (
    ID_usuario INTEGER PRIMARY KEY,
    CONSTRAINT fk_usuario FOREIGN KEY(ID_usuario) REFERENCES Usuario(ID_usuario)
);

-- Tabla Administrador
CREATE TABLE Administrador (
    ID_usuario INTEGER PRIMARY KEY,
    CONSTRAINT fk_usuario_admin FOREIGN KEY(ID_usuario) REFERENCES Usuario(ID_usuario)
);

-- Tabla Empleador
CREATE TABLE Empleador (
    ID_Empresa SERIAL PRIMARY KEY,
    Nombre_empresa VARCHAR(255) NOT NULL,
    Sector VARCHAR(255) NOT NULL,
    Ubicacion VARCHAR(255)
);

-- Tabla Oferta_de_empleo
CREATE TABLE Oferta_de_empleo (
    ID_Oferta SERIAL PRIMARY KEY,
    Descripcion VARCHAR(255) NOT NULL,
    Fecha_publicacion DATE NOT NULL,
    Requisitos VARCHAR(255) NOT NULL,
    Salario INTEGER NOT NULL,
    ID_Empresa INTEGER NOT NULL,
    CONSTRAINT fk_empresa FOREIGN KEY(ID_Empresa) REFERENCES Empleador(ID_Empresa)
);

-- Tabla Beneficio_laboral
CREATE TABLE Beneficio_laboral (
    ID_Beneficio SERIAL PRIMARY KEY,
    Nombre_del_beneficio VARCHAR(255) NOT NULL,
    Descripcion VARCHAR(255)
);

-- Tabla Contrato
CREATE TABLE Contrato (
    ID_Contrato SERIAL PRIMARY KEY,
    Tipo_de_contrato VARCHAR(255) NOT NULL,
    Fecha_inicio DATE NOT NULL,
    Fecha_fin DATE,
    ID_Oferta INTEGER NOT NULL,
    CONSTRAINT fk_oferta FOREIGN KEY(ID_Oferta) REFERENCES Oferta_de_empleo(ID_Oferta)
);

-- Tabla Actividad
CREATE TABLE Actividad (
    ID_Actividad SERIAL PRIMARY KEY,
    Descripcion VARCHAR(255) NOT NULL,
    Fecha DATE NOT NULL
);

-- Tabla Bloqueo
CREATE TABLE Bloqueo (
    ID_Bloqueo SERIAL PRIMARY KEY,
    Razon VARCHAR(255) NOT NULL,
    Fecha_de_bloqueo DATE NOT NULL,
    ID_Empleador INTEGER NOT NULL,
    CONSTRAINT fk_empleador FOREIGN KEY(ID_Empleador) REFERENCES Empleador(ID_Empresa)
);

-- Tabla Contacto_RRHH
CREATE TABLE Contacto_RRHH (
    ID_Contacto SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Telefono INTEGER NOT NULL,
    Correo_electronico VARCHAR(255) NOT NULL,
    ID_Empresa INTEGER UNIQUE,
    CONSTRAINT fk_contacto_empresa FOREIGN KEY(ID_Empresa) REFERENCES Empleador(ID_Empresa)
);

-- Tabla Reporte
CREATE TABLE Reporte (
    ID_Reporte SERIAL PRIMARY KEY,
    Fecha_reporte DATE NOT NULL,
    Motivo VARCHAR(255) NOT NULL,
    ID_Candidato INTEGER NOT NULL,
    CONSTRAINT fk_candidato_reporte FOREIGN KEY(ID_Candidato) REFERENCES Candidato(ID_usuario)
);

-- Tabla FAQ
CREATE TABLE FAQ (
    Identificador SERIAL PRIMARY KEY,
    Pregunta VARCHAR(255) NOT NULL,
    Respuesta VARCHAR(255) NOT NULL
);

-- Tabla Idioma
CREATE TABLE Idioma (
    ID_Idioma SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Nivel_dominio INTEGER NOT NULL,
    ID_Candidato INTEGER NOT NULL,
    CONSTRAINT fk_idioma_candidato FOREIGN KEY(ID_Candidato) REFERENCES Candidato(ID_usuario)
);

-- Tabla Referencia
CREATE TABLE Referencia (
    ID_Referencia SERIAL PRIMARY KEY,
    Nombre_de_contacto VARCHAR(255) NOT NULL,
    ID_Candidato INTEGER NOT NULL,
    CONSTRAINT fk_referencia_candidato FOREIGN KEY(ID_Candidato) REFERENCES Candidato(ID_usuario)
);

-- Tabla Certificacion
CREATE TABLE Certificacion (
    ID_Certificacion SERIAL PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Institucion VARCHAR(255) NOT NULL,
    Año_obtencion DATE NOT NULL,
    Descripcion VARCHAR(255),
    ID_Candidato INTEGER NOT NULL,
    CONSTRAINT fk_certificacion_candidato FOREIGN KEY(ID_Candidato) REFERENCES Candidato(ID_usuario)
);

-- Tabla Habilidad
CREATE TABLE Habilidad (
    ID_Habilidad SERIAL PRIMARY KEY,
    Descripcion VARCHAR(255) NOT NULL,
    Nivel_competencia INTEGER NOT NULL,
    ID_Candidato INTEGER NOT NULL,
    CONSTRAINT fk_habilidad_candidato FOREIGN KEY(ID_Candidato) REFERENCES Candidato(ID_usuario)
);

-- Tabla Postulacion
CREATE TABLE Postulacion (
    ID_Postulacion SERIAL PRIMARY KEY,
    Fecha_postulacion DATE NOT NULL,
    Estado VARCHAR(255) NOT NULL,
    ID_Candidato INTEGER NOT NULL,
    ID_Oferta INTEGER NOT NULL,
    CONSTRAINT fk_postulacion_candidato FOREIGN KEY(ID_Candidato) REFERENCES Candidato(ID_usuario),
    CONSTRAINT fk_postulacion_oferta FOREIGN KEY(ID_Oferta) REFERENCES Oferta_de_empleo(ID_Oferta)
);

-- Tabla Historial_laboral
CREATE TABLE Historial_laboral (
    ID_Historial SERIAL PRIMARY KEY,
    Nombre_empresa VARCHAR(255) NOT NULL,
    Cargo VARCHAR(255) NOT NULL,
    Fecha_inicio DATE NOT NULL,
    Fecha_fin DATE,
    Descripcion VARCHAR(255),
    ID_Candidato INTEGER NOT NULL,
    CONSTRAINT fk_historial_candidato FOREIGN KEY(ID_Candidato) REFERENCES Candidato(ID_usuario)
);

-- Tabla Evaluacion_candidatos
CREATE TABLE Evaluacion_candidatos (
    ID_Evaluacion SERIAL PRIMARY KEY,
    Comentarios VARCHAR(255) NOT NULL,
    Calificacion VARCHAR(255) NOT NULL,
    ID_Postulacion INTEGER NOT NULL,
    CONSTRAINT fk_evaluacion_postulacion FOREIGN KEY(ID_Postulacion) REFERENCES Postulacion(ID_Postulacion)
);

-- Tabla Empleador_Beneficio
CREATE TABLE Empleador_Beneficio (
    ID_Empresa INTEGER NOT NULL,
    ID_Beneficio INTEGER NOT NULL,
    PRIMARY KEY(ID_Empresa, ID_Beneficio),
    CONSTRAINT fk_empleador_beneficio_empresa FOREIGN KEY(ID_Empresa) REFERENCES Empleador(ID_Empresa),
    CONSTRAINT fk_empleador_beneficio_beneficio FOREIGN KEY(ID_Beneficio) REFERENCES Beneficio_laboral(ID_Beneficio)
);

-- Tabla Actividad_Empleador
CREATE TABLE Actividad_Empleador (
    ID_Actividad INTEGER NOT NULL,
    ID_Empresa INTEGER NOT NULL,
    PRIMARY KEY(ID_Actividad, ID_Empresa),
    CONSTRAINT fk_actividad_empleador_actividad FOREIGN KEY(ID_Actividad) REFERENCES Actividad(ID_Actividad),
    CONSTRAINT fk_actividad_empleador_empresa FOREIGN KEY(ID_Empresa) REFERENCES Empleador(ID_Empresa)
);

-- Tabla Contrato_Contacto
CREATE TABLE Contrato_Contacto (
    ID_Contrato INTEGER NOT NULL,
    ID_Contacto INTEGER NOT NULL,
    PRIMARY KEY(ID_Contrato, ID_Contacto),
    CONSTRAINT fk_contrato_contacto_contrato FOREIGN KEY(ID_Contrato) REFERENCES Contrato(ID_Contrato),
    CONSTRAINT fk_contrato_contacto_contacto FOREIGN KEY(ID_Contacto) REFERENCES Contacto_RRHH(ID_Contacto)
);

-- Tabla Feedback
CREATE TABLE Feedback (
    ID_Feedback SERIAL PRIMARY KEY,
    Comentario VARCHAR(255) NOT NULL,
    Evaluacion INTEGER NOT NULL,
    ID_usuario INTEGER NOT NULL,
    CONSTRAINT fk_feedback_usuario FOREIGN KEY(ID_usuario) REFERENCES Usuario(ID_usuario)
);

-- Tabla Preferencia_laboral
CREATE TABLE Preferencia_laboral (
    ID_Preferencia SERIAL PRIMARY KEY,
    Tipo_de_empleo VARCHAR(255) NOT NULL,
    Jornada_deseada VARCHAR(255) NOT NULL,
    ID_usuario INTEGER NOT NULL,
    CONSTRAINT fk_preferencia_usuario FOREIGN KEY(ID_usuario) REFERENCES Usuario(ID_usuario)
);

-- Tabla Candidato_Oferta
CREATE TABLE Candidato_Oferta (
    ID_usuario INTEGER NOT NULL,
    ID_Oferta INTEGER NOT NULL,
    PRIMARY KEY(ID_usuario, ID_Oferta),
    CONSTRAINT fk_candidato_oferta_candidato FOREIGN KEY(ID_usuario) REFERENCES Candidato(ID_usuario),
    CONSTRAINT fk_candidato_oferta_oferta FOREIGN KEY(ID_Oferta) REFERENCES Oferta_de_empleo(ID_Oferta)
);

-- Tabla Candidato_Preferencia
CREATE TABLE Candidato_Preferencia (
    ID_usuario INTEGER NOT NULL,
    ID_Preferencia INTEGER NOT NULL,
    PRIMARY KEY(ID_usuario, ID_Preferencia),
    CONSTRAINT fk_candidato_preferencia_usuario FOREIGN KEY(ID_usuario) REFERENCES Usuario(ID_usuario),
    CONSTRAINT fk_candidato_preferencia_preferencia FOREIGN KEY(ID_Preferencia) REFERENCES Preferencia_laboral(ID_Preferencia)
);

-- Tabla Reporte_Oferta
CREATE TABLE Reporte_Oferta (
    ID_Reporte INTEGER NOT NULL,
    ID_Oferta INTEGER NOT NULL,
    PRIMARY KEY(ID_Reporte, ID_Oferta),
    CONSTRAINT fk_reporte_oferta_reporte FOREIGN KEY(ID_Reporte) REFERENCES Reporte(ID_Reporte),
    CONSTRAINT fk_reporte_oferta_oferta FOREIGN KEY(ID_Oferta) REFERENCES Oferta_de_empleo(ID_Oferta)
);

-- Tabla Reporte_Empleador
CREATE TABLE Reporte_Empleador (
    ID_Reporte INTEGER NOT NULL,
    ID_Empresa INTEGER NOT NULL,
    PRIMARY KEY(ID_Reporte, ID_Empresa),
    CONSTRAINT fk_reporte_empleador_reporte FOREIGN KEY(ID_Reporte) REFERENCES Reporte(ID_Reporte),
    CONSTRAINT fk_reporte_empleador_empresa FOREIGN KEY(ID_Empresa) REFERENCES Empleador(ID_Empresa)
);

-- Tabla Feedback_Candidato
CREATE TABLE Feedback_Candidato (
    ID_Feedback INTEGER NOT NULL,
    ID_usuario INTEGER NOT NULL,
    PRIMARY KEY(ID_Feedback, ID_usuario),
    CONSTRAINT fk_feedback_candidato_feedback FOREIGN KEY(ID_Feedback) REFERENCES Feedback(ID_Feedback),
    CONSTRAINT fk_feedback_candidato_usuario FOREIGN KEY(ID_usuario) REFERENCES Candidato(ID_usuario)
);
