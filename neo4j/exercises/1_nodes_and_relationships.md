# Part 1 - Nodes and Relationships
_Forgot the syntax? Check out the [cypher Cheat sheet](http://neo4j.com/docs/2.1/cypher-refcard/) or look in [the the official docs](http://neo4j.com/docs/stable/cypher-query-lang.html)_

_Having trouble figuring out what the query should look like? Get out a pen and pencil and draw the sub-graph you are looking for!_


![datamodell](https://raw.githubusercontent.com/bekkopen/databasekurs/master/neo4j/exercises/datamodell.png)


## 1. Find a product category
Get a single product category

* The product categories are stored in nodes with the label: ```Category```
* Remember the ```MATCH``` and ```LIMIT``` keywords

**Need help?**
Take a look at the [MATCH](http://neo4j.com/docs/stable/query-match.html) keyword

## 2. What kinds of liquor do we have?
List the **name** of **all** the product categories.

* The name is stored in a property called ```name```

## 3. All the sub districts of Burgund
List all the sub districts in Burgund, France.

* Areas of origin are stored in nodes with labels ```Origin```
* The "Burgund" ```district``` is located in the ```country``` of "Frankrike"
* The sub district is stored in the ```subDistrict``` field.

## 4. Have a beer!
Get a beer product from the database.

* The category for beer is "Øl"
* The products are stored in nodes with label ```Product```
* Products are related to categories via a ```IS_OF_CATEGORY``` relation.

## 5. The purchases of Kaylah Kunde
List all the types of liquor that Kaylah Kunde has bought.

* Users are stored in nodes with the ```User``` label
* Kaylahs ```username``` is "kunde.kaylah"
* The names of product types are stored in the ```name``` field of nodes with the ```LiquorType``` label

## 6. Who bought the same as Odie?
Odie Labadie has bought 49 different products. Can you find all the users that have bought at least **one** of those products?

Show bothe the ```name``` of those ```User```s and the ```name``` of the ```LiquorType```s.

* Odie's ```username``` is "odie_labadie"

## 7. Gimme a heavy!
Brannon Larkin has a hankering for a Scottish brew! Help him find some beer from Scotland!

List the ```name``` of all the ```Liquortypes``` that are beers from Scotland.

* The ```country``` of ```Origin``` should be "Skottland"
* The ```Category``` must be "Øl"

