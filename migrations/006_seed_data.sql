INSERT INTO public.usuarios (nome_completo, email, senha_hash) VALUES
('Filipe Alfaia', 'filipe@ufpa.br', 'hash_filipe'),
('Matheus Vinagre', 'matheus@ufpa.br', 'hash_matheus'),
('Visitante', 'visitante@email.com', 'hash_visit');

INSERT INTO public.canais (id_usuario, nome_canal, descricao) VALUES
(1, 'Alfaia Tech', 'Canal de tecnologia e programação pragmática.'),
(2, 'Matheus Plays', 'Gameplays focados em action-RPGs hardcore.');

INSERT INTO public.videos (id_canal, titulo, url_video, duracao_segundos) VALUES
(1, 'Modelagem de Dados na Prática', 'youtube.com/v/12345', 600),
(2, 'No-Hit Run Boss Final - Dark Souls 3', 'youtube.com/v/67890', 1500);

INSERT INTO public.comentarios (id_video, id_usuario, conteudo) VALUES
(1, 2, 'Modelo bem enxuto, direto ao ponto!'),
(2, 1, 'Build excelente, qual arma você usou?');

INSERT INTO public.inscricoes (id_usuario, id_canal) VALUES 
(2, 1), 
(3, 1), 
(1, 2);
