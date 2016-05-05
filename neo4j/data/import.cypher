cypher

MATCH(n)
DETACH DELETE n;

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/product.node.graph.csv' AS line FIELDTERMINATOR ';'
CREATE (:Product { productId: toInt(line.productId), name: line.name, pricePerLiter: toFloat(line.pricePerLiter), url: line.url });

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/country.node.graph.csv' AS line FIELDTERMINATOR ';'
CREATE (:Country { countryId: line.countryId, name: line.name });

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/productType.node.graph.csv' AS line FIELDTERMINATOR ';'
CREATE (:ProductType { productTypeId: line.productTypeId, productType: line.productType });

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/region.node.graph.csv' AS line FIELDTERMINATOR ';'
CREATE (:Region { regionId: line.regionId, name: line.name });

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/volume.node.graph.csv' AS line FIELDTERMINATOR ';'
CREATE (:Volume { liter: toFloat(line.volume) });

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/abv.node.graph.csv' AS line FIELDTERMINATOR ';'
CREATE (:ABV { abv: toFloat(line.abv) });

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/packaging.node.graph.csv' AS line FIELDTERMINATOR ';'
CREATE (:Packaging { packagingId: line.packagingId, packaging: line.packaging });

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/producer.node.graph.csv' AS line FIELDTERMINATOR ';'
CREATE (:Producer { producerId: line.producerId, name: line.name });

CREATE INDEX ON :Product(productId);
CREATE INDEX ON :Country(countryId);
CREATE INDEX ON :ProductType(productTypeId);
CREATE INDEX ON :Region(regionId);
CREATE INDEX ON :Volume(volume);
CREATE INDEX ON :ABV(abv);
CREATE INDEX ON :Packaging(packagingId);
CREATE INDEX ON :Producer(producerId);

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/product.region.relation.graph.csv' AS line FIELDTERMINATOR ';'
MATCH (product:Product { productId: toInt(line.productId)}), (region:Region { regionId: line.regionId })
CREATE (product)-[:HAS_ORIGIN]->(region);

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/region.country.relation.graph.csv' AS line FIELDTERMINATOR ';'
MATCH (region:Region { regionId: line.regionId}), (country:Country { countryId: line.countryId })
CREATE (region)-[:IS_IN]->(country);

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/product.productType.relation.graph.csv' AS line FIELDTERMINATOR ';'
MATCH (product:Product { productId: toInt(line.productId) }), (productType:ProductType { productTypeId: line.productTypeId })
CREATE (product)-[:IS_TYPE_OF]->(productType);

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/product.volume.relation.graph.csv' AS line FIELDTERMINATOR ';'
MATCH (product:Product { productId: toInt(line.productId) }), (volume:Volume { liter: toFloat(line.volume) })
CREATE (product)-[:HAS]->(volume);

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/product.abv.relation.graph.csv' AS line FIELDTERMINATOR ';'
MATCH (product:Product { productId: toInt(line.productId) }), (abv:ABV { abv: toFloat(line.abv) })
CREATE (product)-[:HAS]->(abv);

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/product.packaging.relation.graph.csv' AS line FIELDTERMINATOR ';'
MATCH (product:Product { productId: toInt(line.productId) }), (packaging:Packaging { packagingId: line.packagingId })
CREATE (product)-[:IS_IN]->(packaging);

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/packaging.volume.relation.graph.csv' AS line FIELDTERMINATOR ';'
MATCH (packaging:Packaging { packagingId: line.packagingId }), (volume:Volume { liter: toFloat(line.volume) })
CREATE (packaging)-[:CONTAINS]->(volume);

LOAD CSV WITH HEADERS FROM 'http://localhost:8000/csv/product.producer.relation.graph.csv' AS line FIELDTERMINATOR ';'
MATCH (product:Product { productId: toInt(line.productId) }), (producer:Producer { producerId: line.producerId })
CREATE (product)-[:IS_PRODUCED_BY]->(producer);