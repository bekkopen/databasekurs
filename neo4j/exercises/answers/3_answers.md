## 1. Mirror mirror on the wall...
    MATCH (sc:ShoppingCart)<--(p:Product)-->(type:LiquorType)
    RETURN type.name,count(sc) as count order by  count desc limit 1

## 2. Beer-mania!
    MATCH
        (sc:ShoppingCart)<--(p:Product)-->(:Category{name:"Øl"}),
        (p)-->(type:LiquorType)
    WHERE
        p.abv >= 10
    RETURN type.name, count(sc) as count
    ORDER BY count desc
    LIMIT 1

## 3. The cravings of Mr. O'Keefe
    MATCH (u:User{name:"Vernie O'Keefe"})<--(:ShoppingCart)<--(:Product)-->(p:Category)
    RETURN p.name, count(p) as count order by count desc limit 1

## 4. Wines of Burgundy

Using chained "property="

    MATCH
        (:Origin{district:"Burgund"})<--(p:Product)-->(c:Category)
    WHERE
        c.name = "Portvin" OR
        c.name = "Aromatisert Svakvin og annen blandet dri" OR
        c.name = "Rødvin" OR
        c.name = "Hvitvin" OR
        c.name = "Rosévin" OR
        c.name = "Øvrig Sterkvin" OR
        c.name = "Fruktvin" OR
        c.name = "Aromatisert Sterkvin" OR
        c.name = "Musserende Fruktvin" OR
        c.name = "Øvrig Svakvin"
    RETURN avg(p.price)

Using predicates:

    MATCH
        (:Origin{district:"Burgund"})<--(p:Product)-->(c:Category)
    WHERE
        ANY(category in
        ["Portvin","Aromatisert Svakvin og annen blandet dri","Rødvin","Hvitvin","Rosévin","Øvrig Sterkvin","Fruktvin","Aromatisert Sterkvin","Musserende Fruktvin","Øvrig Svakvin"]
        WHERE c.name=category)
    RETURN avg(p.price)

Using regexp:

    MATCH
        (:Origin{district:"Burgund"})<--(p:Product)-->(c:Category)
    WHERE
       str(c.name) =~ ".*vin.*"
       AND NOT str(c.name) =~ ".*[Bb]rennevin.*"
    RETURN avg(p.price)


## 5. Recommendations for Remington

Already bought:

    MATCH
        (remington:User{username:"kuhic.remington"})<--(:ShoppingCart)<--(p:Product)
    RETURN p.description,count(p)
    ORDER BY count(p) DESC
    LIMIT 10

Friends bought:

    MATCH
        (remington:User{username:"kuhic.remington"})-[:IS_FRIEND_OF]-(friend:User),
        (friend:User)<--(:ShoppingCart)<--(p:Product)
    RETURN p.description,count(p)
    ORDER BY count(p) DESC
    LIMIT 10

Friends and their friends bought:

    MATCH
        (remington:User{username:"kuhic.remington"})-[:IS_FRIEND_OF*..2]-(friend:User),
        (friend:User)<--(:ShoppingCart)<--(p:Product)
    RETURN p.description,count(p)
    ORDER BY count(p) DESC
    LIMIT 10


People who bougth the same products also bought:

    MATCH
        (remington:User{username:"kuhic.remington"})<--(:ShoppingCart)<--(bought_product:Product),
        (p:Product)-->(:ShoppingCart)-->(other:User)<--(:ShoppingCart)<--(bought_product)
    RETURN p.description,count(p)
    ORDER BY count(p) DESC
    LIMIT 10


Friends who bought the same products also bought:

    MATCH
        (remington:User{username:"kuhic.remington"})<--(:ShoppingCart)<--(bought_product:Product),
        (remington)-[:IS_FRIEND_OF]-(friend:User),
        (p:Product)-->(:ShoppingCart)-->(friend:User)<--(:ShoppingCart)<--(bought_product)
    RETURN p.description,count(p)
    ORDER BY count(p) DESC
    LIMIT 10

Friends and their friends who bought the same products also bought:

    MATCH
        (remington:User{username:"kuhic.remington"})<--(:ShoppingCart)<--(bought_product:Product),
        (remington)-[:IS_FRIEND_OF*..2]-(friend:User),
        (p:Product)-->(:ShoppingCart)-->(friend:User)<--(:ShoppingCart)<--(bought_product)
    RETURN p.description,count(p)
    ORDER BY count(p) DESC
    LIMIT 10
