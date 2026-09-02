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
