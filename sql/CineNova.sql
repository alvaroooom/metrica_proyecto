/* Para crear la bnase de datos
alter session set "_ORACLE_SCRIPT"=true;
create user CineNova identified by CineNova;
GRANT RESOURCE TO CineNova;
grant create session to CineNova;
grant unlimited tablespace to CineNova;
*/

--drop user CineNova cascade;

CREATE TABLE persona (
    id_persona NUMBER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    apellidos VARCHAR2(50) NOT NULL,
    correo VARCHAR2(100) UNIQUE NOT NULL,
    contrasena VARCHAR2(50) NOT NULL,
    tipo VARCHAR2(20) NOT NULL,
    es_empleado BOOLEAN NOT NULL
);

CREATE TABLE pelicula (
    id_pelicula NUMBER PRIMARY KEY,
    titulo VARCHAR2(50) NOT NULL,
    duracion NUMBER NOT NULL, -- en minutos
    genero VARCHAR2(50) NOT NULL,
    clasificacion_edad VARCHAR2(10) NOT NULL,
    descripcion VARCHAR2(500)
);

CREATE TABLE sala (
    id_sala NUMBER PRIMARY KEY,
    numero NUMBER NOT NULL UNIQUE,
    aforo NUMBER NOT NULL,
    tipo VARCHAR2(20) NOT NULL
);

CREATE TABLE sesion (
    id_sesion NUMBER PRIMARY KEY,
    id_pelicula NUMBER,
    id_sala NUMBER,
    fecha DATE NOT NULL,
    hora VARCHAR2(5) NOT NULL, -- formato 'HH:MM'
    precio NUMBER(10) NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES pelicula(id_pelicula),
    FOREIGN KEY (id_sala) REFERENCES sala(id_sala)
);

CREATE TABLE entrada (
    id_entrada NUMBER PRIMARY KEY,
    id_sesion NUMBER,
    id_persona NUMBER,
    asiento VARCHAR2(10) NOT NULL,
    precio_final NUMBER(10) NOT NULL,
    fecha_compra DATE DEFAULT SYSDATE,
    FOREIGN KEY (id_sesion) REFERENCES sesion(id_sesion),
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona)
);
