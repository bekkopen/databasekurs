# Neo4J

## Answers

### PART I - Nodes and Relationships

#### Exercise 1

```sql
MATCH (product:Product)
RETURN product LIMIT 5
```

#### Exercise 2

The product with `productId` 9531501 is a *Chardonnay* from *Casillero del Diablo*.
How much does it cost?

*__Hint:__ The price is stored as `pricePerLiter` in the `Product`-node.*

#### Exercise 3

Find all products that have *Casillero del Diablo* in the name.

*__Hint:__ Look at the `WHERE` and `CONTAINS` keywords, or use regular expressions `=~`*

#### Exercise 4

What type of liquor is the product "Cutty Sark"?

*__Hint:__ Liquor types are stored as `productType` in the `ProductType`-node.*

#### Exercise 5

What country are *Casillero del Diablo* wines are from?

*__Hint:__ Remember from before that the `Product` with `productId` 9531501 is a Casillero del Diablo. Use this as the starting point.*

### PART II - Something a little more advanced

#### Exercise 1

Find all the *Gin* from *England*.

*__Hint:__ Gin is a `productType`.*

#### Exercise 2

Which products comes in the biggest container and what type of container is it?
You should be able to find both with only one query.

*__Hint:__ Container sizes are stored in the `Volume`-node and Containers are stored in `Packaging`.*

#### Exercise 3

Which producer has the most products in the database?

*__Hint:__ This is a good opportunity to start using the syntax `COUNT` and `ORDER BY`.*

#### Exercise 4

What is the most expensive Russian Vodka?

*__Hint:__ Remember that properties of nodes are in Norwegian, so Russia is "Russland".*

#### Exercise 5

Which country produces the most red wine? And what region in this country produces the most red wine?

#### Exercise 6

Find the product that gets you the most value for the money.
This means the biggest container with regards to the price.

### PART III - Inserting and deleting

#### Exercise 1

Lets start a beer brewery! And our first product is already being released!

Insert a `Product`-node with the properties `name`, `pricePerLiter`, and a `productId`. We can leave the `url` blank.

#### Exercise 2

Connect our new beer to the `productType`-node for beer ("Øl" in norwegian).

You can also go ahead and find as well as connect our beer to a suiting `ABV`-node (short for *Alcohol by volume*).

We should also connect it to a `Packaging`-, `Volume`-, as well as a `Region`-node.

#### Exercise 3

This beer don't taste well, does it? Let's forget the whole thing.

Delete our new beer `Product`-node and its relationships.
