// 1. Visualizar o histórico de escuta e suas músicas.
MATCH (o:Ouvinte)-[r:OUVIU]->(m:Musica)
RETURN o, r, m;

// 2. Músicas com as melhores notas médias.
MATCH (:Ouvinte)-[r:OUVIU]->(m:Musica)
RETURN m.titulo AS musica, round(avg(r.nota) * 100) / 100.0 AS media, count(r) AS avaliacoes
ORDER BY media DESC, avaliacoes DESC;

// 3. Músicas que a ouvinte O001 ainda não ouviu.
MATCH (o:Ouvinte {id: 'O001'}), (m:Musica)
WHERE NOT (o)-[:OUVIU]->(m)
RETURN o.nome AS ouvinte, m.titulo AS musica, m.genero AS genero
ORDER BY genero, musica;

// 4. Exemplo de rede social: Ana segue Bruno e Carla.
// MERGE evita criar o mesmo relacionamento duas vezes.
MATCH (ana:Ouvinte {id: 'O001'}), (bruno:Ouvinte {id: 'O002'})
MERGE (ana)-[:SEGUE]->(bruno);
MATCH (ana:Ouvinte {id: 'O001'}), (carla:Ouvinte {id: 'O003'})
MERGE (ana)-[:SEGUE]->(carla);

// 5. Recomendação: músicas bem avaliadas por pessoas seguidas, ainda não ouvidas por Ana.
MATCH (alvo:Ouvinte {id: 'O001'})-[:SEGUE]->(seguido:Ouvinte)-[escuta:OUVIU]->(m:Musica)
WHERE escuta.nota >= 4 AND NOT (alvo)-[:OUVIU]->(m)
RETURN m.titulo AS recomendacao,
       m.genero AS genero,
       round(avg(escuta.nota) * 100) / 100.0 AS nota_media,
       collect(DISTINCT seguido.nome) AS baseada_nos_gostos_de
ORDER BY nota_media DESC, recomendacao;

// 6. Quais artistas criaram quais músicas?
MATCH (a:Artista)-[:CRIOU]->(m:Musica)
RETURN a.nome AS artista, collect(m.titulo) AS musicas
ORDER BY artista;

// 7. Visualizar o esquema do grafo.
CALL db.schema.visualization();
