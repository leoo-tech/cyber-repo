// 1. Explorar o grafo completo.
MATCH (p:Pessoa)-[r:ASSISTIU]->(f:Filme)
RETURN p, r, f;

// 2. Filmes mais bem avaliados pela média das notas.
MATCH (:Pessoa)-[r:ASSISTIU]->(f:Filme)
RETURN f.titulo AS filme, round(avg(r.nota) * 100) / 100.0 AS media, count(r) AS avaliacoes
ORDER BY media DESC, avaliacoes DESC;

// 3. Filmes que uma pessoa ainda não assistiu (altere o ID conforme necessário).
MATCH (p:Pessoa {id: 'P001'}), (f:Filme)
WHERE NOT (p)-[:ASSISTIU]->(f)
RETURN p.nome AS pessoa, f.titulo AS filme
ORDER BY filme;

// 4. Recomendações de pessoas que a pessoa P001 segue.
// A consulta retorna filmes vistos por pessoas seguidas e ainda não vistos por P001.
MATCH (alvo:Pessoa {id: 'P001'})-[:SEGUE]->(seguido:Pessoa)-[:ASSISTIU]->(f:Filme)
WHERE NOT (alvo)-[:ASSISTIU]->(f)
RETURN f.titulo AS sugestao, collect(DISTINCT seguido.nome) AS recomendadoPor
ORDER BY sugestao;

// 5. Visualizar o esquema de labels e relacionamentos.
CALL db.schema.visualization();
