CREATE TABLE alumnos (
    rutalumno                  INTEGER NOT NULL,
    nombrealumno               VARCHAR2(50 CHAR),
    primerapellidoalumno       VARCHAR2(50 CHAR),
    segundoapellidoalumno      VARCHAR2(50 CHAR),
    testid                     INTEGER,
    cursoid                    INTEGER,
    rutalumno1                 INTEGER,
    evaluaciones_evaluacionid  INTEGER NOT NULL,
    test_testid                INTEGER NOT NULL
);

ALTER TABLE alumnos ADD CONSTRAINT alumnos_pk PRIMARY KEY ( rutalumno );

CREATE TABLE cursos (
    cursoid            INTEGER NOT NULL,
    nombrecurso        VARCHAR2(100 CHAR),
    alumnos_rutalumno  INTEGER NOT NULL
);

ALTER TABLE cursos ADD CONSTRAINT cursos_pk PRIMARY KEY ( cursoid );

CREATE TABLE evaluaciones (
    evaluacionid          INTEGER NOT NULL,
    rutalumno             INTEGER,
    pregunta1             INTEGER NOT NULL,
    pregunta1r50          INTEGER,
    pregunta1r100         INTEGER,
    pregunta2             INTEGER NOT NULL,
    pregunta2r50          INTEGER,
    pregunta2r100         INTEGER,
    pregunta3             INTEGER NOT NULL,
    pregunta3r50          INTEGER,
    pregunta3r100         INTEGER,
    pregunta4             INTEGER NOT NULL,
    pregunta4r50          INTEGER,
    pregunta4r100         INTEGER,
    pregunta5             INTEGER NOT NULL,
    pregunta5r50          INTEGER,
    pregunta5r100         INTEGER,
    pregunta6             INTEGER NOT NULL,
    pregunta6r50          INTEGER,
    pregunta6r100         INTEGER,
    pregunta7             INTEGER NOT NULL,
    pregunta7r50          INTEGER,
    pregunta7r100         INTEGER,
    rutalumno1            INTEGER NOT NULL,
    evaluacionid1         INTEGER NOT NULL,
    preguntas_preguntaid  INTEGER NOT NULL
);

CREATE TABLE preguntas (
    preguntaid  INTEGER NOT NULL,
    testid      INTEGER,
    enunciado   VARCHAR2(255 CHAR) NOT NULL,
    respuesta1  VARCHAR2(255 CHAR),
    respuesta2  VARCHAR2(255 CHAR),
    respuesta3  VARCHAR2(255 CHAR),
    respuesta4  VARCHAR2(255 CHAR),
    puntaje100  INTEGER,
    puntaje50   INTEGER,
    opcion1     CHAR(1),
    opcion2     CHAR(1)
);

ALTER TABLE preguntas ADD CONSTRAINT preguntas_pk PRIMARY KEY ( preguntaid );

CREATE TABLE test (
    testid                INTEGER NOT NULL,
    nombretest            VARCHAR2(150 CHAR),
    descripcion           VARCHAR2(255 CHAR),
    programa              VARCHAR2(150 CHAR),
    unidad                VARCHAR2(50 CHAR),
    autor                 VARCHAR2(50 CHAR),
    fechacreacion         DATE,
    preguntas_preguntaid  INTEGER
);

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( testid );

ALTER TABLE alumnos
    ADD CONSTRAINT alumnos_test_fk FOREIGN KEY ( test_testid )
        REFERENCES test ( testid );

ALTER TABLE cursos
    ADD CONSTRAINT cursos_alumnos_fk FOREIGN KEY ( alumnos_rutalumno )
        REFERENCES alumnos ( rutalumno );

ALTER TABLE evaluaciones
    ADD CONSTRAINT evaluaciones_preguntas_fk FOREIGN KEY ( pregunta1 )
        REFERENCES preguntas ( preguntaid );

ALTER TABLE evaluaciones
    ADD CONSTRAINT evaluaciones_preguntas_fkv2 FOREIGN KEY ( pregunta2 )
        REFERENCES preguntas ( preguntaid );

ALTER TABLE evaluaciones
    ADD CONSTRAINT evaluaciones_preguntas_fkv3 FOREIGN KEY ( pregunta3 )
        REFERENCES preguntas ( preguntaid );

ALTER TABLE evaluaciones
    ADD CONSTRAINT evaluaciones_preguntas_fkv4 FOREIGN KEY ( pregunta4 )
        REFERENCES preguntas ( preguntaid );

ALTER TABLE evaluaciones
    ADD CONSTRAINT evaluaciones_preguntas_fkv5 FOREIGN KEY ( pregunta5 )
        REFERENCES preguntas ( preguntaid );

ALTER TABLE evaluaciones
    ADD CONSTRAINT evaluaciones_preguntas_fkv6 FOREIGN KEY ( pregunta6 )
        REFERENCES preguntas ( preguntaid );

ALTER TABLE evaluaciones
    ADD CONSTRAINT evaluaciones_preguntas_fkv7 FOREIGN KEY ( pregunta7 )
        REFERENCES preguntas ( preguntaid );

ALTER TABLE test
    ADD CONSTRAINT test_preguntas_fk FOREIGN KEY ( preguntas_preguntaid )
        REFERENCES preguntas ( preguntaid );
