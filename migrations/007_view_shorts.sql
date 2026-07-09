CREATE OR REPLACE VIEW public.shorts_view AS
SELECT 
    id_video,
    id_canal,
    titulo,
    duracao_segundos,
    data_publicacao
FROM public.videos
WHERE duracao_segundos <= 60;
