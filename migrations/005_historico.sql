-- 005_historico.sql
CREATE TABLE historico_visualizacoes (
    id_historico SERIAL PRIMARY KEY, -- Necessita PK isolada, pois o mesmo usuario vê o mesmo video varias vezes
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_video INT NOT NULL REFERENCES videos(id_video) ON DELETE CASCADE,
    data_visualizacao TIMESTAMP DEFAULT NOW()
);