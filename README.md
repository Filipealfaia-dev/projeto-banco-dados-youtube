# Projeto Final — Banco de Dados I (2026)

## Sistema Escolhido: YouTube

Este projeto apresenta a modelagem de um banco de dados relacional inspirado no ecossistema do YouTube. O objetivo foi representar as principais funcionalidades da plataforma utilizando conceitos de modelagem conceitual, lógica e física, aplicando normalização, integridade referencial e resolução de relacionamentos.

---

## Integrantes

* Filipe dos Anjos Alfaia
* Matheus Hiago dos Santos Vinagre

---

## Tecnologias Utilizadas

* PostgreSQL
* Supabase
* BRModelo Web
* GitHub

---

## Objetivo do Projeto

Modelar um banco de dados capaz de armazenar e gerenciar:

* Usuários
* Canais
* Vídeos
* Comentários
* Inscrições em canais
* Curtidas e avaliações
* Playlists
* Categorias
* Histórico de visualizações
* Notificações

O projeto foi desenvolvido seguindo os princípios da Terceira Forma Normal (3FN), buscando reduzir redundâncias e garantir a consistência dos dados.

---

## Entidades Principais

| Entidade                | Descrição                                      |
| ----------------------- | ---------------------------------------------- |
| usuarios                | Armazena os dados dos usuários da plataforma.  |
| canais                  | Representa os canais criados pelos usuários.   |
| videos                  | Contém os vídeos publicados nos canais.        |
| comentarios             | Armazena comentários e respostas em vídeos.    |
| playlists               | Listas de reprodução criadas pelos usuários.   |
| categorias              | Categorias utilizadas para classificar vídeos. |
| notificacoes            | Notificações recebidas pelos usuários.         |
| historico_visualizacoes | Registro das visualizações realizadas.         |

---

## Relacionamentos

### Usuários e Canais

* Um usuário pode possuir vários canais.
* Um canal pertence a um único usuário.

Relacionamento: **1:N**

### Canais e Vídeos

* Um canal pode publicar vários vídeos.
* Um vídeo pertence a um único canal.

Relacionamento: **1:N**

### Vídeos e Comentários

* Um vídeo pode possuir vários comentários.
* Um comentário pertence a um único vídeo.

Relacionamento: **1:N**

### Usuários e Comentários

* Um usuário pode realizar vários comentários.
* Um comentário é realizado por um único usuário.

Relacionamento: **1:N**

### Comentários e Respostas

A tabela `comentarios` possui um auto-relacionamento através do atributo:

```sql
id_comentario_pai
```

permitindo respostas a comentários.

### Usuários e Canais (Inscrições)

Relacionamento N:N resolvido pela tabela:

```text
inscricoes
```

### Usuários e Vídeos (Curtidas)

Relacionamento N:N resolvido pela tabela:

```text
curtidas_video
```

### Usuários e Comentários (Curtidas)

Relacionamento N:N resolvido pela tabela:

```text
curtidas_comentario
```

### Playlists e Vídeos

Relacionamento N:N resolvido pela tabela:

```text
playlist_videos
```

### Vídeos e Categorias

Relacionamento N:N resolvido pela tabela:

```text
video_categorias
```

### Usuários e Vídeos (Histórico)

Um usuário pode visualizar o mesmo vídeo diversas vezes.

Por esse motivo foi criada a tabela:

```text
historico_visualizacoes
```

com chave primária própria:

```sql
id_historico SERIAL PRIMARY KEY
```

---

## Estrutura das Migrações

```text
migrations/

001_init.sql
002_likes.sql
003_playlists.sql
004_categorias.sql
005_historico.sql
006_notificacoes.sql
007_indexes.sql
```

---

## Índices Utilizados

Foram criados índices para melhorar o desempenho das consultas mais frequentes:

```sql
CREATE INDEX idx_usuarios_email ON usuarios(email);

CREATE INDEX idx_videos_canal ON videos(id_canal);

CREATE INDEX idx_comentarios_video ON comentarios(id_video);
```

---

## Execução no Supabase

1. Criar um projeto no Supabase.
2. Abrir o SQL Editor.
3. Executar as migrações na ordem numérica.
4. Executar o arquivo `seed_data.sql`.
5. Realizar consultas para validar o funcionamento do banco.

---

## Conclusão

O projeto modela os principais componentes de uma plataforma de compartilhamento de vídeos semelhante ao YouTube, utilizando conceitos fundamentais de Banco de Dados Relacional, incluindo normalização, integridade referencial, cardinalidades, auto-relacionamentos e resolução de relacionamentos N:N através de entidades associativas.
