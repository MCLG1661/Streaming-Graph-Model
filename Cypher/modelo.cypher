// =============================================
// STREAMING SERVICE GRAPH DATABASE MODEL
// Constraints and Sample Data
// =============================================

// 1. CRIAR CONSTRAINTS (Unique constraints para IDs)
CREATE CONSTRAINT user_id_unique IF NOT EXISTS FOR (u:User) REQUIRE u.userId IS UNIQUE;
CREATE CONSTRAINT movie_id_unique IF NOT EXISTS FOR (m:Movie) REQUIRE m.movieId IS UNIQUE;
CREATE CONSTRAINT series_id_unique IF NOT EXISTS FOR (s:Series) REQUIRE s.seriesId IS UNIQUE;
CREATE CONSTRAINT genre_id_unique IF NOT EXISTS FOR (g:Genre) REQUIRE g.genreId IS UNIQUE;
CREATE CONSTRAINT actor_id_unique IF NOT EXISTS FOR (a:Actor) REQUIRE a.actorId IS UNIQUE;
CREATE CONSTRAINT director_id_unique IF NOT EXISTS FOR (d:Director) REQUIRE d.directorId IS UNIQUE;

// 2. POPULAR O BANCO COM DADOS DE EXEMPLO

// 2.1 Criar Gêneros
CREATE (g1:Genre {genreId: 1, name: 'Action'})
CREATE (g2:Genre {genreId: 2, name: 'Comedy'})
CREATE (g3:Genre {genreId: 3, name: 'Drama'})
CREATE (g4:Genre {genreId: 4, name: 'Sci-Fi'})
CREATE (g5:Genre {genreId: 5, name: 'Thriller'})
CREATE (g6:Genre {genreId: 6, name: 'Horror'});

// 2.2 Criar Usuários (10 usuários)
CREATE (u1:User {userId: 101, name: 'Ana Silva', email: 'ana.silva@email.com'})
CREATE (u2:User {userId: 102, name: 'João Santos', email: 'joao.santos@email.com'})
CREATE (u3:User {userId: 103, name: 'Maria Oliveira', email: 'maria.oliveira@email.com'})
CREATE (u4:User {userId: 104, name: 'Pedro Costa', email: 'pedro.costa@email.com'})
CREATE (u5:User {userId: 105, name: 'Carla Souza', email: 'carla.souza@email.com'})
CREATE (u6:User {userId: 106, name: 'Lucas Mendes', email: 'lucas.mendes@email.com'})
CREATE (u7:User {userId: 107, name: 'Patrícia Lima', email: 'patricia.lima@email.com'})
CREATE (u8:User {userId: 108, name: 'Roberto Alves', email: 'roberto.alves@email.com'})
CREATE (u9:User {userId: 109, name: 'Fernanda Rocha', email: 'fernanda.rocha@email.com'})
CREATE (u10:User {userId: 110, name: 'Carlos Pereira', email: 'carlos.pereira@email.com'});

// 2.3 Criar Filmes (6 filmes)
CREATE (m1:Movie {movieId: 201, title: 'Matrix Origins', releaseYear: 2021})
CREATE (m2:Movie {movieId: 202, title: 'Comedy Nights', releaseYear: 2022})
CREATE (m3:Movie {movieId: 203, title: 'Deep Water', releaseYear: 2023})
CREATE (m4:Movie {movieId: 204, title: 'Space Odyssey', releaseYear: 2022})
CREATE (m5:Movie {movieId: 205, title: 'The Last Laugh', releaseYear: 2023})
CREATE (m6:Movie {movieId: 206, title: 'Dark Forest', releaseYear: 2021});

// 2.4 Criar Séries (4 séries)
CREATE (s1:Series {seriesId: 301, title: 'Digital Crimes', releaseYear: 2022, seasons: 3})
CREATE (s2:Series {seriesId: 302, title: 'Family Ties', releaseYear: 2023, seasons: 2})
CREATE (s3:Series {seriesId: 303, title: 'Beyond Reality', releaseYear: 2021, seasons: 4})
CREATE (s4:Series {seriesId: 304, title: 'Medical Center', releaseYear: 2022, seasons: 5});

// 2.5 Criar Atores (8 atores)
CREATE (a1:Actor {actorId: 401, name: 'Leonardo DiCaprio'})
CREATE (a2:Actor {actorId: 402, name: 'Scarlett Johansson'})
CREATE (a3:Actor {actorId: 403, name: 'Tom Holland'})
CREATE (a4:Actor {actorId: 404, name: 'Viola Davis'})
CREATE (a5:Actor {actorId: 405, name: 'Keanu Reeves'})
CREATE (a6:Actor {actorId: 406, name: 'Margot Robbie'})
CREATE (a7:Actor {actorId: 407, name: 'Denzel Washington'})
CREATE (a8:Actor {actorId: 408, name: 'Natalie Portman'});

// 2.6 Criar Diretores (5 diretores)
CREATE (d1:Director {directorId: 501, name: 'Christopher Nolan'})
CREATE (d2:Director {directorId: 502, name: 'Greta Gerwig'})
CREATE (d3:Director {directorId: 503, name: 'Jordan Peele'})
CREATE (d4:Director {directorId: 504, name: 'Denis Villeneuve'})
CREATE (d5:Director {directorId: 505, name: 'Jane Campion'});

// 3. CRIAR RELACIONAMENTOS

// 3.1 Relacionar Filmes com Gêneros (IN_GENRE)
MATCH (m:Movie {movieId: 201}), (g:Genre {genreId: 4}) CREATE (m)-[:IN_GENRE]->(g); // Matrix - Sci-Fi
MATCH (m:Movie {movieId: 202}), (g:Genre {genreId: 2}) CREATE (m)-[:IN_GENRE]->(g); // Comedy Nights - Comedy
MATCH (m:Movie {movieId: 203}), (g:Genre {genreId: 3}) CREATE (m)-[:IN_GENRE]->(g); // Deep Water - Drama
MATCH (m:Movie {movieId: 204}), (g:Genre {genreId: 4}) CREATE (m)-[:IN_GENRE]->(g); // Space - Sci-Fi
MATCH (m:Movie {movieId: 205}), (g:Genre {genreId: 2}) CREATE (m)-[:IN_GENRE]->(g); // Last Laugh - Comedy
MATCH (m:Movie {movieId: 206}), (g:Genre {genreId: 6}) CREATE (m)-[:IN_GENRE]->(g); // Dark Forest - Horror

// 3.2 Relacionar Séries com Gêneros (IN_GENRE)
MATCH (s:Series {seriesId: 301}), (g:Genre {genreId: 5}) CREATE (s)-[:IN_GENRE]->(g); // Digital Crimes - Thriller
MATCH (s:Series {seriesId: 302}), (g:Genre {genreId: 2}) CREATE (s)-[:IN_GENRE]->(g); // Family Ties - Comedy
MATCH (s:Series {seriesId: 303}), (g:Genre {genreId: 4}) CREATE (s)-[:IN_GENRE]->(g); // Beyond Reality - Sci-Fi
MATCH (s:Series {seriesId: 304}), (g:Genre {genreId: 3}) CREATE (s)-[:IN_GENRE]->(g); // Medical Center - Drama

// 3.3 Relacionar Atores com Filmes (ACTED_IN)
MATCH (a:Actor {actorId: 405}), (m:Movie {movieId: 201}) CREATE (a)-[:ACTED_IN]->(m); // Keanu em Matrix
MATCH (a:Actor {actorId: 402}), (m:Movie {movieId: 202}) CREATE (a)-[:ACTED_IN]->(m); // Scarlett em Comedy
MATCH (a:Actor {actorId: 403}), (m:Movie {movieId: 202}) CREATE (a)-[:ACTED_IN]->(m); // Tom em Comedy
MATCH (a:Actor {actorId: 404}), (m:Movie {movieId: 203}) CREATE (a)-[:ACTED_IN]->(m); // Viola em Deep Water
MATCH (a:Actor {actorId: 401}), (m:Movie {movieId: 204}) CREATE (a)-[:ACTED_IN]->(m); // Leonardo em Space
MATCH (a:Actor {actorId: 406}), (m:Movie {movieId: 205}) CREATE (a)-[:ACTED_IN]->(m); // Margot em Last Laugh
MATCH (a:Actor {actorId: 408}), (m:Movie {movieId: 206}) CREATE (a)-[:ACTED_IN]->(m); // Natalie em Dark Forest

// 3.4 Relacionar Atores com Séries (ACTED_IN)
MATCH (a:Actor {actorId: 401}), (s:Series {seriesId: 301}) CREATE (a)-[:ACTED_IN]->(s); // Leonardo em Digital Crimes
MATCH (a:Actor {actorId: 407}), (s:Series {seriesId: 302}) CREATE (a)-[:ACTED_IN]->(s); // Denzel em Family Ties
MATCH (a:Actor {actorId: 402}), (s:Series {seriesId: 303}) CREATE (a)-[:ACTED_IN]->(s); // Scarlett em Beyond Reality
MATCH (a:Actor {actorId: 404}), (s:Series {seriesId: 304}) CREATE (a)-[:ACTED_IN]->(s); // Viola em Medical Center

// 3.5 Relacionar Diretores com Filmes (DIRECTED)
MATCH (d:Director {directorId: 501}), (m:Movie {movieId: 201}) CREATE (d)-[:DIRECTED]->(m); // Nolan em Matrix
MATCH (d:Director {directorId: 502}), (m:Movie {movieId: 202}) CREATE (d)-[:DIRECTED]->(m); // Gerwig em Comedy
MATCH (d:Director {directorId: 505}), (m:Movie {movieId: 203}) CREATE (d)-[:DIRECTED]->(m); // Campion em Deep Water
MATCH (d:Director {directorId: 504}), (m:Movie {movieId: 204}) CREATE (d)-[:DIRECTED]->(m); // Villeneuve em Space
MATCH (d:Director {directorId: 502}), (m:Movie {movieId: 205}) CREATE (d)-[:DIRECTED]->(m); // Gerwig em Last Laugh
MATCH (d:Director {directorId: 503}), (m:Movie {movieId: 206}) CREATE (d)-[:DIRECTED]->(m); // Peele em Dark Forest

// 3.6 Relacionar Diretores com Séries (DIRECTED)
MATCH (d:Director {directorId: 504}), (s:Series {seriesId: 301}) CREATE (d)-[:DIRECTED]->(s); // Villeneuve em Digital Crimes
MATCH (d:Director {directorId: 502}), (s:Series {seriesId: 302}) CREATE (d)-[:DIRECTED]->(s); // Gerwig em Family Ties
MATCH (d:Director {directorId: 501}), (s:Series {seriesId: 303}) CREATE (d)-[:DIRECTED]->(s); // Nolan em Beyond Reality
MATCH (d:Director {directorId: 505}), (s:Series {seriesId: 304}) CREATE (d)-[:DIRECTED]->(s); // Campion em Medical Center

// 3.7 Relacionar Usuários com Filmes (WATCHED com ratings)
MATCH (u:User {userId: 101}), (m:Movie {movieId: 201}) CREATE (u)-[:WATCHED {rating: 5}]->(m);
MATCH (u:User {userId: 102}), (m:Movie {movieId: 201}) CREATE (u)-[:WATCHED {rating: 4}]->(m);
MATCH (u:User {userId: 103}), (m:Movie {movieId: 202}) CREATE (u)-[:WATCHED {rating: 5}]->(m);
MATCH (u:User {userId: 104}), (m:Movie {movieId: 202}) CREATE (u)-[:WATCHED {rating: 3}]->(m);
MATCH (u:User {userId: 105}), (m:Movie {movieId: 203}) CREATE (u)-[:WATCHED {rating: 5}]->(m);
MATCH (u:User {userId: 106}), (m:Movie {movieId: 203}) CREATE (u)-[:WATCHED {rating: 4}]->(m);
MATCH (u:User {userId: 107}), (m:Movie {movieId: 204}) CREATE (u)-[:WATCHED {rating: 5}]->(m);
MATCH (u:User {userId: 108}), (m:Movie {movieId: 204}) CREATE (u)-[:WATCHED {rating: 4}]->(m);
MATCH (u:User {userId: 109}), (m:Movie {movieId: 205}) CREATE (u)-[:WATCHED {rating: 5}]->(m);
MATCH (u:User {userId: 110}), (m:Movie {movieId: 206}) CREATE (u)-[:WATCHED {rating: 3}]->(m);

// 3.8 Relacionar Usuários com Séries (WATCHED com ratings)
MATCH (u:User {userId: 101}), (s:Series {seriesId: 301}) CREATE (u)-[:WATCHED {rating: 4}]->(s);
MATCH (u:User {userId: 102}), (s:Series {seriesId: 302}) CREATE (u)-[:WATCHED {rating: 5}]->(s);
MATCH (u:User {userId: 103}), (s:Series {seriesId: 303}) CREATE (u)-[:WATCHED {rating: 5}]->(s);
MATCH (u:User {userId: 104}), (s:Series {seriesId: 304}) CREATE (u)-[:WATCHED {rating: 4}]->(s);
MATCH (u:User {userId: 105}), (s:Series {seriesId: 301}) CREATE (u)-[:WATCHED {rating: 5}]->(s);
MATCH (u:User {userId: 106}), (s:Series {seriesId: 302}) CREATE (u)-[:WATCHED {rating: 3}]->(s);

// 4. QUERIES DE VERIFICAÇÃO (opcional - não executar junto com o CREATE)
// :exit

// Para verificar os dados depois:
// MATCH (n) RETURN n LIMIT 100;
// MATCH (u:User)-[w:WATCHED]->(m:Movie) RETURN u.name, m.title, w.rating;
