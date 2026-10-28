// Crie restrições de unicidade antes de carregar os CSVs.
CREATE CONSTRAINT pessoa_id IF NOT EXISTS FOR (p:Pessoa) REQUIRE p.id IS UNIQUE;
CREATE CONSTRAINT filme_id IF NOT EXISTS FOR (f:Filme) REQUIRE f.id IS UNIQUE;
