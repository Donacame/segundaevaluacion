
CREATE TABLE IF NOT EXISTS clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT NOT NULL,
    nombre TEXT NOT NULL,
    telefono TEXT NOT NULL,
    direccion TEXT NOT NULL,
    ip TEXT NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS eventos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo_evento TEXT NOT NULL CHECK(tipo_evento IN ('boda', 'fiesta', 'corporativo')),
    cliente_email TEXT NOT NULL,
    fecha_evento DATE NOT NULL,
    ubicacion TEXT NOT NULL,
    numero_invitados INTEGER NOT NULL CHECK(numero_invitados > 0),
    presupuesto REAL NOT NULL CHECK(presupuesto > 0),
    estado TEXT NOT NULL DEFAULT 'pendiente' CHECK(estado IN ('pendiente', 'confirmado', 'cancelado')),
    ip TEXT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_email) REFERENCES clientes(email)
);

CREATE INDEX IF NOT EXISTS idx_clientes_email ON clientes(email);
CREATE INDEX IF NOT EXISTS idx_eventos_fecha ON eventos(fecha_evento);
