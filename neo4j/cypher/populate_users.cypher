// Indeks på username
CREATE INDEX ON :User(username);

//Les brukere
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:E:/Workspace/Jobber og Prosjekter/databasekurs/neo4j/test-data-generation/generated/users.csv" AS csv

MERGE(user:User{username:csv.username})
ON CREATE SET
  user.name = csv.name,
  user.birthdate = csv.birthdate,
  user.email = csv.email,
  user.phone = csv.phone



