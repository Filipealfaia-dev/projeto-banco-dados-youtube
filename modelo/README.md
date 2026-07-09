erDiagram
    USUARIO {
        int id
        string nome
        string email
    }
    CANAL {
        int id
        string nome
    }
    VIDEO {
        int id
        string titulo
    }
    COMENTARIO {
        int id
    }

    USUARIO ||--|| CANAL : "possui"
    CANAL ||--o{ VIDEO : "publica"
    VIDEO ||--o{ COMENTARIO : "recebe"
    USUARIO ||--o{ COMENTARIO : "escreve"
    USUARIO }o--o{ CANAL : "inscreve-se em"
