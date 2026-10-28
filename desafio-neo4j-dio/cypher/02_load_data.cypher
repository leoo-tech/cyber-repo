// Execute com os CSVs na pasta import da instância Neo4j local.

LOAD CSV WITH HEADERS FROM 'file:///ouvintes.csv' AS row
MERGE (o:Ouvinte {id: row.id})
SET o.nome = row.nome,
    o.cidade = row.cidade;

LOAD CSV WITH HEADERS FROM 'file:///artistas.csv' AS row
MERGE (a:Artista {id: row.id})
SET a.nome = row.nome;

LOAD CSV WITH HEADERS FROM 'file:///musicas.csv' AS row
MATCH (a:Artista {id: row.artista_id})
MERGE (m:Musica {id: row.id})
SET m.titulo = row.titulo,
    m.genero = row.genero,
    m.ano = toInteger(row.ano)
MERGE (a)-[:CRIOU]->(m);

LOAD CSV WITH HEADERS FROM 'file:///reproducoes.csv' AS row
MATCH (o:Ouvinte {id: row.ouvinte_id})
MATCH (m:Musica {id: row.musica_id})
MERGE (o)-[r:OUVIU]->(m)
SET r.nota = toInteger(row.nota);
