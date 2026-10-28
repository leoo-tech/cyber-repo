// Exemplos didáticos. Execute somente em uma base de teste.

// Atualizar uma propriedade.
MATCH (p:Pessoa {id: 'P001'})
SET p.cidade = 'Sao Paulo';

// Remover somente um relacionamento específico, mantendo os nós.
// Confira o MATCH antes de executar a exclusão.
MATCH (p:Pessoa {id: 'P001'})-[r:ASSISTIU]->(f:Filme {id: 'F001'})
DELETE r;

// Demonstrar REMOVE: primeiro adicione um label temporário e depois o retire.
MATCH (p:Pessoa {id: 'P001'})
SET p:PessoaTemporaria;

MATCH (p:Pessoa {id: 'P001'})
REMOVE p:PessoaTemporaria;

// CUIDADO: remove o nó e TODOS os seus relacionamentos conectados.
// Descomente apenas se tiver certeza e estiver em uma base descartável.
// MATCH (p:Pessoa {id: 'P005'}) DETACH DELETE p;
