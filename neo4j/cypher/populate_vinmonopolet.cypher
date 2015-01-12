//CREATE INDEX ON :LiquorType(name);
//CREATE INDEX ON :Category(name);
//CREATE INDEX ON :Producer(name);
//CREATE INDEX ON :Origin(name);
//CREATE INDEX ON :ContainerSize(name);
//CREATE INDEX ON :Packaging(name);


USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:E:/dropbox/My Dropbox/work/NOSQL-kurs/Neo4J/data/vinmonopolet_vask2.csv" AS csv

MERGE (liquorType:LiquorType { name: coalesce(csv.Varenavn, "Ukjent") })
MERGE (cPrim:Category {name:coalesce(csv.Varetype, "Ukjent")})
MERGE(producer:Producer {name:coalesce(csv.Produsent, "Ukjent")})
MERGE(origin:Origin {name:coalesce(csv.Land, "Ukjent"), country:csv.Land, district:csv.Distrikt, subDistrict:csv.Underdistrikt})
MERGE(size:ContainerSize {name:coalesce(toFloat(csv.Volum) * 1000, 0)})
MERGE (package:Packaging { name: coalesce(csv.Emballasjetype, "Ukjent")})

CREATE (unit:Product {
   description: toFloat(csv.Volum) * 1000 + "ml " + csv.Emballasjetype + " of " + csv.Varenavn,
   price: toFloat(csv.Pris),
   url: csv.Vareurl,
   pricePerLiter: toFloat(csv.Literpris),
   abv: toFloat(csv.Alkohol)
  })

CREATE (unit)-[:IS_OF_TYPE]->(liquorType)
CREATE (unit)-[:IS_OF_CATEGORY {qualifier:"primary"}]->(cPrim)
CREATE (unit)-[:PRODUCED_BY]->(producer)
CREATE (unit)-[:ORIGINATES_IN]->(origin)
CREATE (unit)-[:SIZE_OF_CONTAINER]->(size)
CREATE (unit)-[:PACKAGED_IN]->(package)