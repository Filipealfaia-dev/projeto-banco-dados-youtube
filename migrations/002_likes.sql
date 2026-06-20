-- 002_likes.sql
CREATE TABLE curtidas_video (
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_video INT NOT NULL REFERENCES videos(id_video) ON DELETE CASCADE,
    eh_like BOOLEAN NOT NULL, -- TRUE para Like, FALSE para Dislike
    data_interacao TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id_usuario, id_video)
);

CREATE TABLE curtidas_comentario (
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_comentario INT NOT NULL REFERENCES comentarios(id_comentario) ON DELETE CASCADE,
    eh_like BOOLEAN NOT NULL,
    data_interacao TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id_usuario, id_comentario)
);