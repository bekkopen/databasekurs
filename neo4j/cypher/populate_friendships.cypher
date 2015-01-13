//Les venner
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:E:/Workspace/Jobber og Prosjekter/databasekurs/neo4j/test-data-generation/generated/friendships.csv" AS csv

MATCH (u1:User{username:csv.username1}), (u2:User{username:csv.username2})
MERGE (u1)-[:IS_FRIEND_OF]->(u2)