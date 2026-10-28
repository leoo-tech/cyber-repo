// Restrições de unicidade para identificadores das entidades.
CREATE CONSTRAINT ouvinte_id IF NOT EXISTS FOR (o:Ouvinte) REQUIRE o.id IS UNIQUE;
CREATE CONSTRAINT musica_id IF NOT EXISTS FOR (m:Musica) REQUIRE m.id IS UNIQUE;
CREATE CONSTRAINT artista_id IF NOT EXISTS FOR (a:Artista) REQUIRE a.id IS UNIQUE;
