CREATE TABLE public.inscricoes (
    id_usuario INT NOT NULL REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE,
    id_canal INT NOT NULL REFERENCES public.canais(id_canal) ON DELETE CASCADE,
    data_inscricao TIMESTAMP DEFAULT NOW(),

    PRIMARY KEY (id_usuario, id_canal)
);
