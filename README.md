# Streaming-Graph-Model

# 📚 Contexto Acadêmico

Disciplina: Análise de Dados com Grafos

Professor: [Nome do professor]

Semestre: [Primeiro Semestre/2026]

Curso: [Bootcamp Neo4j]


# Conceitos Aplicados

- Modelagem de dados em grafos (paradigma NoSQL)
- Cypher Query Language (Neo4j)
- Constraints e índices em banco de dados de grafos
- Relacionamentos com propriedades
- Consultas complexas e recomendações

# 🏗️ Estrutura do Modelo

Entidades (Nós)

- User	Usuários da plataforma	userId (único), name, email
- Movie	Filmes disponíveis	movieId (único), title, releaseYear
- Series	Séries disponíveis	seriesId (único), title, releaseYear, seasons
- Genre	Gêneros de conteúdo	genreId (único), name
- Actor	Atores/atrizes	actorId (único), name
- Director	Diretores	directorId (único), name 

# Relacionamentos

- WATCHED	Usuário assistiu conteúdo	rating (nota de 1 a 5)
- ACTED_IN	Ator atuou no conteúdo	
- DIRECTED	Diretor dirigiu o conteúdo
- IN_GENRE	Conteúdo pertence ao gênero

# Cardinalidades

- Um Usuário pode assistir vários filmes/séries
- Um Filme/Série pode ser assistido por vários usuários
- Um Ator pode atuar em vários filmes/séries
- Um Filme/Série pode ter vários atores
- Um Diretor pode dirigir vários filmes/séries
- Um Filme/Série tem um ou mais gêneros
- Um Gênero pode estar em vários filmes/séries

 # 📊 Dados do Dataset

O modelo foi populado com:

- 10 Usuários
- 6 Filmes
- 4 Séries
- 6 Gêneros
- 8 Atores
- 5 Diretores
- 39 Nós
- 44 Relacionamentos

# 🛠️ Tecnologias Utilizadas

- Neo4j (versão 4.x/5.x) - Banco de dados de grafos
- Cypher - Linguagem de consulta
- Arrows - Ferramenta de diagramação
- Git/GitHub - Controle de versão e entrega

# 📁 Arquivos do Projeto

- modelo.cypher :	Script completo com constraints e população do banco
- Diagrama.png	: Diagrama visual do modelo de grafos
- README.md	: Documentação do projeto
- Consultas.cypher (Opcional) :	Script abaixo com consultas de exemplos

1. Filmes assistidos por um usuário com notas
MATCH (u:User {name: 'Ana Silva'})-[w:WATCHED]->(m:Movie)
RETURN u.name, m.title, w.rating

2. Recomendação por gênero (baseado no que gostou)
MATCH (u:User {userId: 101})-[:WATCHED {rating: 5}]->(m:Movie)-[:IN_GENRE]->(g:Genre)
MATCH (recomendacao:Movie)-[:IN_GENRE]->(g)
WHERE NOT EXISTS((u)-[:WATCHED]->(recomendacao))
RETURN recomendacao.title AS Recomendacao, g.name AS Genero

3. Diretores e seus filmes com avaliações
MATCH (d:Director)-[:DIRECTED]->(m:Movie)<-[w:WATCHED]-(u:User)
RETURN d.name AS Diretor, m.title AS Filme, AVG(w.rating) AS MediaAvaliacoes

4. Elenco de um filme
MATCH (a:Actor)-[:ACTED_IN]->(m:Movie {title: 'Matrix Origins'})
RETURN a.name AS Ator  

# 📌 Observações

- O modelo pode ser estendido para incluir outras entidades (ex: Episódios, Premiações, Estúdios)
- As avaliações (ratings) são de 1 a 5 estrelas
- Todos os IDs são únicos (garantido por constraints)
- O script cria o banco do zero (pode ser executado múltiplas vezes sem duplicar dados)

# 🏁 Como Executar o Projeto

- Instale o Neo4j Desktop ou use o Neo4j AuraDB (nuvem)
- Crie um novo banco de dados
- Execute o script modelo.cypher no Neo4j Browser
- Explore os dados com as consultas fornecidas

# Autor
- [Marcus Guedes]
- Linkedin : https://www.linkedin.com/in/marcusguedes/
- GitHub : https://github.com/MCLG1661

📅 Data de Entrega
[23/02/2026] 

 
