-- Equipe Youtube
-- Filipe dos Anjos Alfaia - Matrícula: 202511140019
-- Matheus Hiago dos Santos Vinagre - Matrícula: 202511140008

SELECT canais.nome_canal, COUNT(shorts_view.id_video) AS total_shorts
FROM canais
JOIN shorts_view ON canais.id_canal = shorts_view.id_canal
GROUP BY canais.nome_canal
ORDER BY total_shorts DESC
LIMIT 5;

WITH Top5Canais AS (
    SELECT canais.id_canal, canais.nome_canal
    FROM canais
    JOIN inscricoes ON canais.id_canal = inscricoes.id_canal
    GROUP BY canais.id_canal, canais.nome_canal
    ORDER BY COUNT(inscricoes.id_usuario) DESC
    LIMIT 5
)
SELECT Top5Canais.nome_canal, videos.titulo, COUNT(comentarios.id_comentario) AS popularidade_engajamento
FROM videos
JOIN Top5Canais ON videos.id_canal = Top5Canais.id_canal
LEFT JOIN comentarios ON videos.id_video = comentarios.id_video
WHERE videos.data_publicacao >= '2026-01-01 00:00:00'
GROUP BY Top5Canais.nome_canal, videos.titulo
ORDER BY popularidade_engajamento DESC
LIMIT 5;
