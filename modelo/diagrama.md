erDiagram
    usuarios {
        INT id_usuario PK
        VARCHAR nome_completo
        VARCHAR email
        VARCHAR senha_hash
        TIMESTAMP data_criacao
    }

    canais {
        INT id_canal PK
        INT id_usuario FK UK
        VARCHAR nome_canal
        TEXT descricao
        TIMESTAMP data_criacao
    }

    videos {
        INT id_video PK
        INT id_canal FK
        VARCHAR titulo
        VARCHAR url_video
        INT duracao_segundos
        TIMESTAMP data_publicacao
    }

    comentarios {
        INT id_comentario PK
        INT id_video FK
        INT id_usuario FK
        TEXT conteudo
        TIMESTAMP data_comentario
    }

    inscricoes {
        INT id_usuario PK FK
        INT id_canal PK FK
        TIMESTAMP data_inscricao
    }

    usuarios ||--o| canais : "possui"
    canais ||--o{ videos : "publica"
    videos ||--o{ comentarios : "recebe"
    usuarios ||--o{ comentarios : "escreve"
    usuarios }o--o{ inscricoes : "realiza"
    canais }o--o{ inscricoes : "recebe"
