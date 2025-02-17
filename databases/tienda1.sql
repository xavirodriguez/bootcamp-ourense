CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15)
);
 
-- Tabla de Pedidos (1:N con Clientes)
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_pedido DATE NOT NULL,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);
 
-- Tabla de Productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);
 
-- Tabla intermedia Pedido_Producto (N:M entre Pedidos y Productos)
CREATE TABLE pedido_producto (
    id_pedido INT,
    id_producto INT,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON DELETE CASCADE
);
 
INSERT INTO clientes (nombre, email, telefono) VALUES
('Rasta sin Rastro', 'sinrastro@orégano.com', '666420666'),
('Juanito Papelillo', 'papelillo420@humo.com', '420420420'),
('María Juana', 'mariajuana@verde.com', '654321987'),
('El que dice "tu tranqui q yo controlo"', 'nocontrolo@npi.com', '999888777'),
('Tío que nunca pone pa pillar', 'meolvido@pago.com', '555555555'),
('Sativa Lovers', 'altovoltaje@relax.com', '333777999'),
('La que dice "ya no fumo"', 'mentira@otra.com', '666999333'),
('El que se comió el brownie sin saberlo', 'tripeando@ayuda.com', '777111888');


INSERT INTO productos (nombre, precio, stock) VALUES
('Bong de emergencia con botella de 2L', 9.99, 25),
('Papel de liar tamaño sábana', 4.50, 100),
('Encendedor que siempre desaparece', 2.00, 75),
('Galletas espaciales (con sorpresa)', 12.00, 30),
('Ojo Rojo Gotas Milagrosas', 7.99, 50),
('Grinder con compartimento secreto (para que no lo pierdas)', 15.00, 40),
('Camiseta "Yo no fumo, inhalo conocimiento"', 19.99, 20),
('Cenicero con GPS (porque siempre desaparece)', 10.00, 30),
('Set de camuflaje: bolsita de "orégano" para despistar', 5.50, 60),
('Pipa con forma de USB (por si te pillan en la oficina)', 22.00, 15),
('Kit de supervivencia post-fumada (agua, chuches y excusa prehecha)', 8.00, 40);

INSERT INTO pedidos (id_cliente, fecha_pedido, total) VALUES
(1, '2024-02-10', 50.00),
(2, '2024-02-11', 75.00),
(3, '2024-02-12', 120.50),
(4, '2024-02-13', 45.00),
(5, '2024-02-14', 200.00);

INSERT INTO pedido_producto (id_pedido, id_producto, cantidad) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 2, 1),
(2, 3, 1),
(3, 4, 1),
(3, 5, 2),
(4, 6, 1),
(4, 7, 5),
(5, 1, 2),
(5, 3, 3),
(5, 5, 1);
