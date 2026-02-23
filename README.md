# Streaming-Graph-Model

📚 Contexto Acadêmico

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

Tipo	    Quantidade
Usuários	10
Filmes	  6
Séries	  4
Gêneros	  6
Atores	  8
Diretores	5
Nós	      39
Relações	44
