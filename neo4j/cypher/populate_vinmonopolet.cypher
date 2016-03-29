// Indeks p� liquor type
CREATE INDEX ON :LiquorType(name);

// Indeks p� liquor category
CREATE INDEX ON :Category(name);

// Indeks p� producer
CREATE INDEX ON :Producer(name);

// Indeks p� origin
CREATE INDEX ON :Origin(name);

// Indeks p� container size
CREATE INDEX ON :ContainerSize(name);

// Indeks p� packaging
CREATE INDEX ON :Packaging(name);

// Indeks p� varenummer
CREATE INDEX ON :Product(varenummer);

//Les inn produktkatalogen til vinmonopolet
USING PERIODIC COMMIT
//LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/bekkopen/databasekurs/neo4j/neo4j/data/vinmonopolet_vasket.csv" AS csv
LOAD CSV WITH HEADERS FROM "https://github.com/bekkopen/databasekurs/blob/master/neo4j/data/vinmonopolet-utf8.csv" AS csv

CREATE (unit:Product {
   varenummer: csv.Varenummer,
   description: toFloat(csv.Volum) * 1000 + "ml " + csv.Emballasjetype + " of " + csv.Varenavn,
   price: toFloat(csv.Pris),
   url: csv.Vareurl,
   pricePerLiter: toFloat(csv.Literpris),
   abv: toFloat(csv.Alkohol)
  })

FOREACH(Varenavn IN (CASE WHEN csv.Varenavn <> "" THEN [csv.Varenavn] ELSE [] END) |
    MERGE (liquorType:LiquorType { name: Varenavn })
    CREATE (unit)-[:IS_OF_TYPE]->(liquorType)
)
FOREACH(Varetype IN (CASE WHEN csv.Varetype <> "" THEN [csv.Varetype] ELSE [] END) |
    MERGE (cPrim:Category { name:Varetype})
    CREATE (unit)-[:IS_OF_CATEGORY {qualifier:"primary"}]->(cPrim)
)
FOREACH(produsent IN (CASE WHEN csv.Produsent <> "" THEN [csv.Produsent] ELSE [] END) |
    MERGE (producer:Producer { name:produsent })
    CREATE (unit)-[:PRODUCED_BY]->(producer)
)
FOREACH(Land IN (CASE WHEN csv.Land <> "" THEN [csv.Land] ELSE [] END) |
    MERGE (origin:Origin { name:Land, country:Land, district:csv.Distrikt, subDistrict:csv.Underdistrikt})
    CREATE (unit)-[:ORIGINATES_IN]->(origin)
)
FOREACH(Volum IN (CASE WHEN csv.Volum <> "" THEN [csv.Volum] ELSE [] END) |
    MERGE (size:ContainerSize { name:toFloat(Volum) * 1000})
    CREATE (unit)-[:SIZE_OF_CONTAINER]->(size)
)
FOREACH(Emballasjetype IN (CASE WHEN csv.Emballasjetype <> "" THEN [csv.Emballasjetype] ELSE [] END) |
    MERGE (package:Packaging { name: Emballasjetype})
    CREATE (unit)-[:PACKAGED_IN]->(package)
);