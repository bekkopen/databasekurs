# Neo4J

## Answers

This is just a proposal to a solution. Yours might differ.

### PART I - Nodes and Relationships

#### Exercise 1

```sql
MATCH (product:Product)
RETURN product LIMIT 5
```

#### Exercise 2

```sql
MATCH (product:Product { productId: 9531501} )
RETURN product.pricePerLiter
```

##### Expected result

| product.pricePerLiter |
| --------------------- |
| 137.2                 |

#### Exercise 3

```sql
MATCH (product:Product)
WHERE product.name CONTAINS 'Casillero del Diablo'
RETURN product
```

##### Expected result

Should return 11 products with productId:

| product.productId |
| ----------------- |
| 260501            |
| 260502            |
| 412401            |
| 1566001           |
| 1590606           |
| 1754601           |
| 4403201           |
| 4497501           |
| 9347601           |
| 9531501           |
| 9804306           |

#### Exercise 4

```sql
MATCH (:Product { name: 'Cutty Sark' })-[:IS_TYPE_OF]->(productType)
RETURN productType
```

##### Expected result

| productType.productType |
| ----------------------- |
| Whisky                  |

#### Exercise 5

```sql
MATCH (:Product { productId: 9531501 })-[:HAS_ORIGIN]-()-[:IS_IN]->(country)
RETURN country
```

##### Expected result

| country.name  |
| ------------- |
| Chile         |

### PART II - Something a little more advanced

#### Exercise 1

```sql
MATCH (:ProductType { productType: 'Gin'})<-[:IS_TYPE_OF]-(product)-[:HAS_ORIGIN]->()-[:IS_IN]->(:Country { name: 'England' })
RETURN product
```

##### Expected result

Should return 35 products with productId:

| product.productId |
| ----------------- |
| 3067201           |
| 4524501           |
| 4765101           |
| 4240701           |
| 4240302           |
| 4240702           |
| 4184001           |
| 5133501           |
| 5277601           |
| 9498301           |
| 9375801           |
| 9804201           |
| 9714001           |
| 18702             |
| 18701             |
| 19002             |
| 19001             |
| 140701            |
| 298201            |
| 282801            |
| 483001            |
| 482901            |
| 800101            |
| 782801            |
| 1568002           |
| 1568001           |
| 1305701           |
| 1207302           |
| 1207301           |
| 1201401           |
| 998401            |
| 743601            |
| 756501            |
| 783501            |
| 784001            |

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
