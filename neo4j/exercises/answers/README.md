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

Should return 11 *Casillero del Diablo* products.

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

Should return 35 products.

#### Exercise 2

```sql
MATCH (volume:Volume)
WITH max(volume.liter) AS maxVolume
MATCH (packaging)-[:CONTAINS]->(volume:Volume { liter: maxVolume })<-[:HAS]-(product)
RETURN product, packaging
```

##### Expected result

| product.productId  | packaging.packaging              |
| ------------------ | -------------------------------- |
| 5931107            | Glassflaske over eller lik 4 ltr |

#### Exercise 3

```sql
MATCH (producer:Producer)<-[IS_PRODUCED_BY]-(product:Product)
RETURN count(product) AS products, producer
ORDER BY products DESC LIMIT 1
```

##### Expected result

| products  | product.producerId |
| --------- | ------------------ |
| 166       | arcus              |

#### Exercise 4

```sql
MATCH (:Country {countryId: 'russland'})-[*2]-(product:Product {})-->(:ProductType {productTypeId: 'vodka'})
RETURN product
ORDER BY product.pricePerLiter DESC LIMIT 1
```

##### Expected result

| product.productId  | product.pricePerLiter |
| ------------------ | --------------------- |
| 5600201            | 714.1                 |

#### Exercise 5

#### Exercise 6

```sql
MATCH (product:Product)-[:HAS]->(volume:Volume)
WITH volume.liter*product.pricePerLiter AS price, product AS product
RETURN price, product
ORDER BY price ASC LIMIT 1
```

##### Expected result

| price  | product.productTypeId |
| ------ | --------------------- |
| 16.104 | 9795702               |
