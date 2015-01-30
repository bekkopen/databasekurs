# Basic query operations

1. ### Fetch by Id

    From the user collection, find the user with username (_id) 'morar.reva'.

    _For this query you should use [FindOne](http://docs.mongodb.org/manual/reference/method/db.collection.findOne/)_

2. ### Number of male users

    Find the total amount of male users in the users collection.

    _For this query you use [Count](http://docs.mongodb.org/manual/reference/method/db.collection.count/)_

3. ### Cheapest beer

    Find the three cheapest beers (per liter) in the products collection.

    _For this you need to use [Find](http://docs.mongodb.org/manual/reference/method/db.collection.find/), [Sort](http://docs.mongodb.org/manual/reference/method/cursor.sort/#cursor.sort) and [Limit](http://docs.mongodb.org/manual/reference/method/cursor.limit/)._

4. ### Find the title of all bottles from Norway

    Find the title, and only the title, of all products originating from Norway (Norge).

    _New for this query is the use of [projection](http://docs.mongodb.org/manual/reference/method/db.collection.find/#projections) as a parameter to the find query and the use of a regex for filtering._

    _The query `{countryRegion: /^Norge/}` will find you all products from Norway, as all the countryRegion string has the form `country, region, near-region`._

5. ### Paginated list of products

    Sort products on `countryRegion` then `title`, both descending. Return only three products, but skip 1200 products.

    _To accomplish this you will need to use [Skip](http://docs.mongodb.org/manual/reference/method/cursor.skip/) and [Limit](http://docs.mongodb.org/manual/reference/method/cursor.limit/) together._
