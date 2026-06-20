-- 006_notificacoes.sql
CREATE TABLE notificacoes (
    id_notificacao SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    mensagem TEXT NOT NULL,
    lida BOOLEAN DEFAULT FALSE,
    data_notificacao TIMESTAMP DEFAULT NOW()
);