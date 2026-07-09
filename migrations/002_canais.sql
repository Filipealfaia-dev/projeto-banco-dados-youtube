CREATE TABLE public.canais (
    id_canal SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL UNIQUE REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE,
    nome_canal VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT,
    data_criacao TIMESTAMP DEFAULT NOW()
);
