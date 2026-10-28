// Exemplos didáticos. Execute somente em uma base de teste.

// Atualizar uma propriedade.
MATCH (p:Pessoa {id: 'P001'})
SET p.cidade = 'Sao Paulo';

// Remover somente um relacionamento específico, mantendo os nós.
MATCH (p:Pessoa {id: 'P001'})-[r:ASSISTIU]->(f:Filme {id: 'F001'})
DELETE r;

// Remover um label sem apagar o nó, suas propriedades ou relacionamentos.
MATCH (p:Pessoa {id: 'P001'})
REMOVE p: PessoaTemporaria;

// CUIDADO: remove o nó e TODOS os seus relacionamentos conectados.
// Descomente apenas se tiver certeza e estiver em uma base descartável.
// MATCH (p:Pessoa {id: 'P005'}) DETACH DELETE p;
