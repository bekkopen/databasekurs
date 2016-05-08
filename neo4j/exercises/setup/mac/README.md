# Neo4J

### Setup - Mac

### Download and install

If you do not already have [Homebrew](http://http://brew.sh/) install. Do so!

With Homebrew installed simply type `brew install neo4j`.

#### Starting Neo4j for the first times

To start Neo4j, simply open a terminal window and type `neo4j start`.

Neo4j will start running on [localhost:7474](http://localhost:7474). This is where we will preform most of our queries.

Head over to your local Neo4j instance. If you are asked for a username/password, use the default `neo4j/neo4j`.

If you are not asked for a username/password, you might not be connected to Neo4j. If so, just type `:server connect` in the query-field.

You might be promted to create a new password. Make it something simple for now, so you will remember it. This password might come in handy at a later time.

You can shut down Neo4j by typing `neo4j stop` in a terminal window.

### Importing the database

Open a terminal. In the root of this project `cd neo4j/data`, then run `./import.sh`.

This will import the *csv* files with all the juicy data that we will query.

*__ALL PROPERTIES IN THE DATABASE ARE IN NORWEGIAN!__*
*This means that f.eks. the `name` property of the `Country`-node for South Africa is "Sør Afrika".*

Alright, you are now ready for the [exercises](README.md)!
