# Modelagem do Banco de Dados - MVP YouTube Simplificado

Este repositório contém a modelagem de banco de dados relacional para um MVP (Produto Mínimo Viável) simplificado da plataforma YouTube. O projeto foi desenvolvido como componente da avaliação final da disciplina Banco de Dados I na Faculdade de Computação (FACOMP) da Universidade Federal do Pará (UFPA).

## Sistema Escolhido e Escopo
Para garantir alta coesão, consistência conceitual e viabilidade de indexação em cenários de alta leitura, o escopo foi deliberadamente limitado ao núcleo de execução do YouTube, composto por 5 entidades principais. Deixamos de fora tabelas periféricas (como notificações e históricos) para mitigar o custo de processamento de junções (JOINs) complexas na camada de persistência.

### Ferramentas Utilizadas
* **BrModeloWeb:** Desenho do Diagrama de Entidade-Relacionamento (DER).
* **Supabase:** Hospedagem, execução de DDLs e testes de integridade (PostgreSQL).
* **Git e GitHub:** Controle de versionamento acadêmico e gerência de migrações.

---

### Discentes:
* Filipe dos Anjos Alfaia

---

### Modelagem do DER:
<img width="1121" height="791" alt="diagrama_youtube_bd" src="https://github.com/user-attachments/assets/3fb4f796-6211-49a1-8e79-47575d6c6535" />

---

### Estrutura do Projeto

```text
youtube-database-mvp/
│
├── migrations/
│   ├── 001_usuarios.sql
│   ├── 002_canais.sql
│   ├── 003_videos.sql
│   ├── 004_comentarios.sql
│   ├── 005_inscricoes.sql
│   └── 006_seed_data.sql
│
└── README.md
