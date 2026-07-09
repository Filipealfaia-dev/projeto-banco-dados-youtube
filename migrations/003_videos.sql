CREATE TABLE public.videos (
    id_video SERIAL PRIMARY KEY,
    id_canal INT NOT NULL REFERENCES public.canais(id_canal) ON DELETE CASCADE,
    titulo VARCHAR(150) NOT NULL,
    url_video VARCHAR(255) UNIQUE NOT NULL,
    duracao_segundos INT NOT NULL,
    data_publicacao TIMESTAMP DEFAULT NOW(),
    CONSTRAINT validar_duracao CHECK (duracao_segundos > 0)
);
