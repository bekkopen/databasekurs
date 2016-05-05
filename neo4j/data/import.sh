# Start server
python -m SimpleHTTPServer 8000 &> /dev/null &
pid=$!

# Give server time to start up
sleep 1

# Start Neo4j
neo4j start

# Import to Neo4j
neo4j-shell -host localhost -port 1337 -file import.cypher

# Stop server
kill "${pid}"
