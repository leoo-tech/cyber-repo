// Exemplos didáticos. Execute somente em uma base de teste.

// Atualizar uma propriedade de ouvinte.
MATCH (o:Ouvinte {id: 'O001'})
SET o.cidade = 'Sao Paulo';

// Remover apenas uma escuta específica, mantendo os nós.
MATCH (o:Ouvinte {id: 'O001'})-[r:OUVIU]->(m:Musica {id: 'M001'})
DELETE r;

// Demonstrar REMOVE: adicione um label temporário e depois retire-o.
MATCH (o:Ouvinte {id: 'O001'})
SET o:OuvinteTemporario;

MATCH (o:Ouvinte {id: 'O001'})
REMOVE o:OuvinteTemporario;

// CUIDADO: remove o nó e TODOS os relacionamentos conectados.
// Descomente apenas em uma base descartável.
// MATCH (o:Ouvinte {id: 'O005'}) DETACH DELETE o;
