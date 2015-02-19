# Part 1 - Answers
Cypher lets you formulate a query in many different ways - some more effective than others.
The following are examples of how each of the problems in exercises *can* be solved. They are not, however, the only possible solutions.

## 1. Find a product category

    MATCH (n:Category)
    RETURN n LIMIT 1

## 2. What kind of liquor do we have?
    MATCH (n:Category)
    RETURN n.name

## 3. All the sub districts of Burgund
    MATCH (l:Origin{district:"Burgund"})
    RETURN l.country, l.district, l.subDistrict

## 4. Have a beer!
    MATCH (p:Product)-[:IS_OF_CATEGORY]->(c:Category{name:"Øl"})
    RETURN p LIMIT 1

## 5. The purchases of Kaylah Kunde
"Full" query:

    MATCH (u:User{username:"kunde.kaylah"})<-[:WAS_PURCHASED_BY]-(:ShoppingCart)<-[:WAS_PART_OF_CART]-(:Product)-->(type:LiquorType)
    RETURN type.name

Simpler (but slightly slower):

    MATCH (u:User{username:"kunde.kaylah"})--(:ShoppingCart)--(:Product)--(type:LiquorType)
    RETURN type.name

## 6. Who bought the same as Odie?

    MATCH (:User{username:"odie_labadie"})--(:ShoppingCart)--(:Product)--(type:LiquorType)--(:Product)--(:ShoppingCart)--(u:User)
    RETURN u.name, type.name

## 7. Gimme a heavy!
    MATCH (:Origin{name:"Skottland"})--(p:Product)--(:Category{name:"Øl"}),
    (p)--(t:LiquorType)
    RETURN t.name

