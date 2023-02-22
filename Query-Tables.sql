create database bicistar;
use bicistar;
#drop database bicistar;

CREATE TABLE productos (
  id INT NOT NULL AUTO_INCREMENT primary key,
  nombre VARCHAR(255) NOT NULL,
  descripcion TEXT,
  precio FLOAT NOT NULL,
  cantidad INT NOT NULL
)ENGINE=INNODB;

CREATE TABLE proveedores (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  telefono VARCHAR(50)
)ENGINE=INNODB;

CREATE TABLE compras (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  producto_id INT NOT NULL,
  proveedor_id INT NOT NULL,
  cantidad INT NOT NULL,
  fecha_compra DATE NOT NULL,
  precio_unitario FLOAT NOT NULL,
  FOREIGN KEY (producto_id) REFERENCES productos(id),
  FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
)ENGINE=INNODB;

CREATE TABLE ventas (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL,
  fecha_venta DATE NOT NULL,
  precio_unitario FLOAT NOT NULL,
  FOREIGN KEY (producto_id) REFERENCES productos(id)
)ENGINE=INNODB;

CREATE TABLE puntos_de_venta (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  direccion VARCHAR(255),
  ciudad VARCHAR(255) NOT NULL
)ENGINE=INNODB;


CREATE TABLE roles (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  descripcion TEXT
)ENGINE=INNODB;

CREATE TABLE permisos (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  descripcion TEXT
)ENGINE=INNODB;

CREATE TABLE permisos_a_roles (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  rol_id INT NOT NULL,
  permiso_id INT NOT NULL,
  FOREIGN KEY (rol_id) REFERENCES roles(id),
  FOREIGN KEY (permiso_id) REFERENCES permisos(id)
)ENGINE=INNODB;

CREATE TABLE usuarios (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  apellido VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  punto_venta_id INT NOT NULL,
  rol_permisos INT NOT NULL,
  FOREIGN KEY (rol_permisos) REFERENCES permisos_a_roles(id),
  FOREIGN KEY (punto_venta_id) REFERENCES puntos_de_venta(id)
)ENGINE=INNODB;
