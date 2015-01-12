LOAD CSV WITH HEADERS FROM "file:E:/dropbox/My Dropbox/work/NOSQL-kurs/Neo4J/cypher/testdata1.csv" AS csv
MERGE (unit:Unit {description: csv.size_in_ml + "ml " + csv.package_type + " of " + csv.name })

MERGE (liquorType:LiquorType { name: csv.name })
MERGE (unit)-[:IS_OF_TYPE]->(liquorType)


MERGE (cPrim:Category {name:csv.primary_category})
MERGE (unit)-[:IS_OF_CATEGORY {qualifier:"primary"}]->(cPrim)

MERGE (cSec:Category {name:csv.secondary_category})
MERGE (unit)-[:IS_OF_CATEGORY {qualifier:"secondary"}]->(cSec)

MERGE (cTert:Category {name:csv.tertiary_category})
MERGE (unit)-[:IS_OF_CATEGORY {qualifier:"tertiary"}]->(cTert)

MERGE(cPrim)<-[:SUBCATEGORY_OF]-(cSec)<-[:SUBCATEGORY_OF]-(cTert)

MERGE(producer:Producer {name:csv.producer})
MERGE(unit)-[:PRODUCED_BY]->(producer)

MERGE(origin:Origin {name:csv.origin})
MERGE(unit)-[:ORIGINATES_IN]->(origin)

MERGE(size:ContainerSize {name:csv.size_in_ml})
MERGE(unit)-[:SIZE_OF_CONTAINER]->(size)

MERGE (package:Packaging { name: csv.package_type})
MERGE (unit)-[:PACKAGED_IN]->(package)

