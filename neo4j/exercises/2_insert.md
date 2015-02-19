# Part 2 - Inserting data
_Forgot the syntax? Check out the [cypher Cheat sheet](http://neo4j.com/docs/2.1/cypher-refcard/) or look in [the the official docs](http://neo4j.com/docs/stable/cypher-query-lang.html)_

_Having trouble figuring out what the query should look like? Get out a pen and pencil and draw the sub-graph you are looking for!_

## 1. Register as a user!
Let's get you into the system! Insert a new User node, with your personal information, into the database.

* The label of a user node is ```User```
* The properties for all the existing users are ```name```, ```username```, ```birthdate```, ```email``` and ```phone```
    * You will need **at least** a ```username``` to be able to do the rest of the exercises in this part.
    * Feel free to put additional fields of info in your user node - Neo4J is schemaless!

> **OOPS!**
>
> Created an erroneous node by mistake?
> Take a look at the [DELETE](http://neo4j.com/docs/stable/query-delete.html) keyword - deleting nodes is as easy as finding them in Neo4J!

## 2. Pint please!
Let's get you a beer! To register at purchase, you need to create a shopping cart and create a relationship between the cart and a product, and between the cart and a user.
Register a cart, link it to your user and but a bottle of Brewdog's great "Rip Tide Stout" in the cart!

* The ```varenummer``` of the "Rip Tide Stout" is **8040202**
* The relationship type between a ```ShoppingCart``` and a ```Product``` is ```WAS_PART_OF_CART```
* The relationship type between a ```ShoppingCart``` and a ```User``` is ```WAS_PURCHASED_BY```
