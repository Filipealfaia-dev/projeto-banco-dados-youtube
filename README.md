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
### Discentes:
* Filipe dos Anjos Alfaia - Matrícula: 202511140019
* Matheus Hiago dos Santos Vinagre - Matrícula: 202511140008
---
### Consultas da Avaliação
As consultas solicitadas pelo professor estão disponíveis no arquivo `consultas.sql` na raiz do repositório.
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
## Engenharia de Migrações (Tomadas de Decisão Arquitetural)

As migrações foram estruturadas em ordem cronológica de dependência de chaves estrangeiras (FK), implementando restrições de integridade diretamente no motor do banco de dados (PostgreSQL):

1. **`001_usuarios.sql`**: Define a entidade de autenticação global. Implementa uma restrição de domínio via `CHECK` utilizando expressões regulares (`REGEX`) para validação sintática estrita de e-mails em nível de tabela.
2. **`002_canais.sql`**: Cria a entidade de criadores de conteúdo. Aplica uma restrição `UNIQUE` na FK `id_usuario` para garantir o relacionamento 1:1 (um usuário possui apenas um canal), separando dados de autenticação de dados de exibição pública.
3. **`003_videos.sql`**: Garante a consistência dos metadados de mídia. Contém uma constraint de validação para impedir que a duração (`duracao_segundos`) assuma valores menores ou iguais a zero.
4. **`004_comentarios.sql`**: Persiste as interações textuais. Esta tabela recebe um Índice B-Tree (`idx_comentarios_video`) na coluna `id_video`. Como o YouTube é uma plataforma orientada à leitura, indexar essa chave estrangeira reduz a complexidade de busca de O(N) para O(log N) no carregamento de páginas de vídeos populares.
5. **`005_inscricoes.sql`**: Resolve a relação N:N (Muitos para Muitos) entre Usuários e Canais. Utiliza uma **Chave Primária Composta** (`PRIMARY KEY (id_usuario, id_canal)`) para impedir logicamente a duplicidade de inscrições e garantir a consistência das métricas de contagem de inscritos.
7. `007_view_shorts.sql` - Criação da view para análise de vídeos curtos.

*Nota técnica: Todas as chaves estrangeiras implementam o comportamento `ON DELETE CASCADE`. Optou-se por essa abordagem para manter a integridade referencial estrita no escopo acadêmico, limpando registros órfãos de forma atômica.*

---

## Como Executar as Migrações

1. Clone este repositório no seu ambiente local.
2. Acesse o painel do seu projeto criado no **Supabase**.
3. Navegue até o **SQL Editor**.
4. Copie e execute os scripts localizados na pasta `migrations/` respeitando rigidamente a ordem numérica dos arquivos para evitar violações de chaves estrangeiras.
