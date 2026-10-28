// Execute no Neo4j Browser com os CSVs na pasta import da instância.
// Cada MERGE usa uma chave estável para facilitar reexecuções sem duplicar nós.
LOAD CSV WITH HEADERS FROM 'file:///pessoas.csv' AS row
MERGE (p:Pessoa {id: row.id})
SET p.nome = row.nome,
    p.cidade = row.cidade;

LOAD CSV WITH HEADERS FROM 'file:///filmes.csv' AS row
MERGE (f:Filme {id: row.id})
SET f.titulo = row.titulo,
    f.genero = row.genero,
    f.ano = toInteger(row.ano);

LOAD CSV WITH HEADERS FROM 'file:///assistiu.csv' AS row
MATCH (p:Pessoa {id: row.pessoa_id})
MATCH (f:Filme {id: row.filme_id})
MERGE (p)-[r:ASSISTIU]->(f)
SET r.nota = toInteger(row.nota);
