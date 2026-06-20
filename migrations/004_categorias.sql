-- 004_categorias.sql
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE video_categorias (
    id_video INT NOT NULL REFERENCES videos(id_video) ON DELETE CASCADE,
    id_categoria INT NOT NULL REFERENCES categorias(id_categoria) ON DELETE CASCADE,
    PRIMARY KEY (id_video, id_categoria)
);