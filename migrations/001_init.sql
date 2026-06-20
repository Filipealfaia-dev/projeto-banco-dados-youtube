-- 001_init.sql

CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nome_usuario VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    data_criacao TIMESTAMP DEFAULT NOW()
);

CREATE TABLE canais (
    id_canal SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT,
    data_criacao TIMESTAMP DEFAULT NOW()
);

CREATE TABLE videos (
    id_video SERIAL PRIMARY KEY,
    id_canal INT NOT NULL REFERENCES canais(id_canal) ON DELETE CASCADE,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    url_video VARCHAR(255) UNIQUE NOT NULL,
    duracao_segundos INT NOT NULL CHECK (duracao_segundos > 0),
    data_publicacao TIMESTAMP DEFAULT NOW()
);

CREATE TABLE comentarios (
    id_comentario SERIAL PRIMARY KEY,
    id_video INT NOT NULL REFERENCES videos(id_video) ON DELETE CASCADE,
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_comentario_pai INT REFERENCES comentarios(id_comentario) ON DELETE CASCADE,
    conteudo TEXT NOT NULL,
    data_comentario TIMESTAMP DEFAULT NOW()
);

CREATE TABLE inscricoes (
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_canal INT NOT NULL REFERENCES canais(id_canal) ON DELETE CASCADE,
    data_inscricao TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id_usuario, id_canal)
);