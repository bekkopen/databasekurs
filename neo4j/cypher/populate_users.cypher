// Indeks p� username
CREATE INDEX ON :User(username);

//Les brukere
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "https://github.com/bekkopen/databasekurs/blob/master/neo4j/test-data-generation/generated/users.csv" AS csv

MERGE(user:User{username:csv.username})
ON CREATE SET
  user.name = csv.name,
  user.birthdate = csv.birthdate,
  user.email = csv.email,
  user.phone = csv.phone;



