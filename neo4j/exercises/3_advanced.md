# Part 3 - Advanced queries
_Forgot the syntax? Check out the [cypher Cheat sheet](http://neo4j.com/docs/2.1/cypher-refcard/) or look in [the the official docs](http://neo4j.com/docs/stable/cypher-query-lang.html)_

_Having trouble figuring out what the query should look like? Get out a pen and pencil and draw the sub-graph you are looking for!_

![datamodell](https://raw.githubusercontent.com/bekkopen/databasekurs/master/neo4j/exercises/datamodell.png)


## 1. Mirror mirror on the wall...
Which is the most sold ```LiquorType``` of them all?

## 2. Beer-mania!
Which is the most sold *strong* beer ```LiquorType```?

* We consider anything **higher than 10% ABV** a strong beer.
* The ABV is stored in the ```abv``` property of ```Product```s
* The ```Category``` of beer is "Øl"

## 3. The cravings of Mr. O'Keefe
What ```Category``` is the most popular for **_Vernie O'Keefe_**, and how many times has he bought an item in that category?

## 4. Wines of Burgundy
What is the **average price** of **Wines** originating in **Burgundy**?

* Burgundy is a *district*
* The norwegian name for Burgundy is "Burgund"
* There are more than one Wine category!
* The average can be calculated using an [aggregation](http://neo4j.com/docs/stable/query-aggregation.html#aggregation-avg)



## 5. Recommendations for Remington
**Remington Kuhic** (username: **kuhic.remington**) just asked you: *"What should I buy?"*.
Make a recommendation (top 10 recommended products) for Remington!

Ideas for a recommendation:

* Remington might like the products he has already bought?
* Maybe remington would enjoy the same tastes as his friends?
    * What if you include *their* friends too?
* What about people who have bought the same products as Remington?
* How about those friends of Remington that have bought the same products as him?

**Can you think of other ways of recommending some products for Remington?**
