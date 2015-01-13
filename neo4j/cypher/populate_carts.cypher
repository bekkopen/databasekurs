//Indeks på Shopping Cart ID
CREATE INDEX ON :ShoppingCart(cartId);

//Les kjøp
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:E:/Workspace/Jobber og Prosjekter/databasekurs/neo4j/test-data-generation/generated/carts.csv" AS csv

MERGE (cart:ShoppingCart {cartId: csv.cart_id})
MERGE (user:User {username: csv.username})
MERGE (product:Product {varenummer: csv.varenummer})
MERGE (cart)-[:WAS_PURCHASED_BY]->(user)
CREATE (cart)<-[:WAS_PART_OF_CART]-(product)
