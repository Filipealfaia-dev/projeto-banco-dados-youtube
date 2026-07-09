CREATE TABLE public.comentarios (
    id_comentario SERIAL PRIMARY KEY,
    id_video INT NOT NULL REFERENCES public.videos(id_video) ON DELETE CASCADE,
    id_usuario INT NOT NULL REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE,
    conteudo TEXT NOT NULL,
    data_comentario TIMESTAMP DEFAULT NOW()
);
CREATE INDEX idx_comentarios_video ON public.comentarios(id_video);
