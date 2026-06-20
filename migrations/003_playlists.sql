-- 003_playlists.sql
CREATE TABLE playlists (
    id_playlist SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    titulo VARCHAR(100) NOT NULL,
    publica BOOLEAN DEFAULT TRUE,
    data_criacao TIMESTAMP DEFAULT NOW()
);

CREATE TABLE playlist_videos (
    id_playlist INT NOT NULL REFERENCES playlists(id_playlist) ON DELETE CASCADE,
    id_video INT NOT NULL REFERENCES videos(id_video) ON DELETE CASCADE,
    posicao INT NOT NULL CHECK (posicao >= 1),
    data_adicao TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id_playlist, id_video),
    UNIQUE (id_playlist, posicao)
);