SET neo4j_directory=c:\neo4j\bin

CALL %neo4j_directory%\neo4j.bat install-service

CALL %neo4j_directory%\neo4j.bat start

CALL %neo4j_directory%\neo4j-shell.bat -host localhost -port 1337 -file import.cypher
