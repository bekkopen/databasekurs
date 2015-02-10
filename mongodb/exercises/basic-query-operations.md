# Basic query operations

_Look at the mongodb/README.md for how to access the mongo shell where you will perform these exercises._

1. ### Fetch by Id

    From the user collection, find the user with username `_id: 'kathryn_brakus'`.

    _For this query you should use [FindOne](http://docs.mongodb.org/manual/reference/method/db.collection.findOne/)_

2. ### Number of male users

    Find the total amount of male users in the users collection.

    _For this query you use [Count](http://docs.mongodb.org/manual/reference/method/db.collection.count/)_

3. ### Cheapest beer

    Find the three cheapest beers (per liter) in the products collection.

    _For this you need to use [Find](http://docs.mongodb.org/manual/reference/method/db.collection.find/), [Sort](http://docs.mongodb.org/manual/reference/method/cursor.sort/#cursor.sort) and [Limit](http://docs.mongodb.org/manual/reference/method/cursor.limit/)._

4. ### Find all products from The Glenlivet

    Find all products which title starts with The Glenlivet. Only project the title field.

    You can use a query like `{"title": /^TERM/}` to find all documents where title starts with the term TERM.

    _New for this query is the use of [projection](http://docs.mongodb.org/manual/reference/method/db.collection.find/#projections) as a parameter to the find query and the use of a [regex](http://docs.mongodb.org/manual/reference/operator/query/regex/) for querying._

5. ### Paginated list of products

    Often you will want to paginate the results of a large result set. Find all beers `category: "Øl"` with a container size of 50 cl `containerSize: "50 cl"`. Only return products 11 - 15.

    _To accomplish this you will need to use [Skip](http://docs.mongodb.org/manual/reference/method/cursor.skip/) and [Limit](http://docs.mongodb.org/manual/reference/method/cursor.limit/) together._
