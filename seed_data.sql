-- Inserir Usuários
INSERT INTO usuarios (nome, email, senha_hash) VALUES
('Filipe Alfaia', 'filipe@ufpa.br', 'hash_filipe'),
('Matheus Vinagre', 'matheus@ufpa.br', 'hash_matheus'),
('Visitante', 'visitante@email.com', 'hash_visit');

-- Inserir Canais
INSERT INTO canais (id_usuario, nome, descricao) VALUES
(1, 'Alfaia Tech', 'Canal de programação pragmática.'),
(2, 'Matheus Plays', 'Gameplays de Dark Souls e mais.');

-- Inserir Categorias
INSERT INTO categorias (nome) VALUES ('Educação'), ('Games'), ('Tecnologia');

-- Inserir Vídeos
INSERT INTO videos (id_canal, titulo, url_video, duracao_segundos) VALUES
(1, 'Aprenda Java O.O em 10 Minutos', 'youtube.com/v/123', 600),
(2, 'Derrotando o Boss Final - Dark Souls 3', 'youtube.com/v/456', 1200);

-- Mapear Categorias
INSERT INTO video_categorias (id_video, id_categoria) VALUES
(1, 1), (1, 3), (2, 2);

-- Inserir Comentários (com uma resposta)
INSERT INTO comentarios (id_video, id_usuario, conteudo) VALUES
(1, 2, 'Muito eficiente, direto ao ponto!');
INSERT INTO comentarios (id_video, id_usuario, id_comentario_pai, conteudo) VALUES
(1, 1, 1, 'Valeu Matheus!');

-- Inscrições e Curtidas
INSERT INTO inscricoes (id_usuario, id_canal) VALUES (2, 1), (3, 1), (1, 2);
INSERT INTO curtidas_video (id_usuario, id_video, eh_like) VALUES (2, 1, TRUE), (3, 1, FALSE);