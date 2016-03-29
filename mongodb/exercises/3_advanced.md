# Advanced exercises

_Look at the mongodb/README.md for how to access the mongo shell where you will perform these exercises._

In this section there will be a mixture of exercises in different categories. Do not feel obliged to do them sequentially.

1. ### Advanced queries

  #### Comparison queries
    Find the number of products with `price` greater than [$gt](http://docs.mongodb.org/manual/reference/operator/query/gt/) 1000.

    _All comparison operators are found [here](http://docs.mongodb.org/manual/reference/operator/query-comparison/)._

  #### Value in array
  Find the total number of users who have bought The Glenlivet Nadurra `_id: 4995001`

  _Hints can be found [here](http://docs.mongodb.org/manual/tutorial/query-documents/#match-a-field-without-specifying-array-index)_.

2. ### Advanced updates

  #### Upserts
  Upsert is a combination of update and insert. If the document you wish to update does not exist, it will insert it.

  Add the cart specified below to a user identified `_id: "elon.musk"`, as you do not know whether the user exists or not, set the [upsert](http://docs.mongodb.org/manual/reference/method/db.collection.update/#upsert-option) option to true.

  ```js
  {
    "products" : [
			1137901,
			9139202,
			3043401
		]
  }
  ```

  #### Multi-update
  Default behavior for the update method is to alter only one document. If you wish to alter more than only one be sure to enable the [multi-parameter](http://docs.mongodb.org/manual/reference/method/db.collection.update/#multi-parameter) option.

  It is a bit tedious that `countryRegion` for a lot of norwegian products are labelled as "Norge, Øvrige, Øvrige". Change the `countryRegion` field of all such products, set its value to "Norge" instead.

3. ### Indexing
  Collection scans are the death of your performance, certainly for large collections. By default querying on other fields than the `_id` field will result in a collection scan. Ensuring indices on fields may help you avoid such scans.

  #### Index on product title
    [Add an index](http://docs.mongodb.org/manual/reference/method/db.collection.ensureIndex/) to the title field of products. Let the index be ascending (1).

  #### Text search
    The text index has been added to add a simple search feature to MongoDB. Add a [text index](http://docs.mongodb.org/manual/core/index-text/#text-index-compound) to the `ingredients` field of products.

    After adding the text index, try to [search](http://docs.mongodb.org/manual/reference/operator/query/text/#search-field) for `kardemomme`.

4. ### Aggregation
    The [aggregation framework](http://docs.mongodb.org/manual/aggregation/) lets you make powerful group by like queries on data.

    #### Number of products in each category
      Find the total number of products in each category

      _You need to use the [$group](http://docs.mongodb.org/manual/reference/operator/aggregation/group/) aggregation operator here._

    #### Cheapest and most expensive
      Of each category, find the min, max and average price. Sort the results by average price.

    #### Most sold product
    Find the _id and number of products sold of the three most sold products.

    _[Unwind](http://docs.mongodb.org/manual/reference/operator/aggregation/unwind/) might help unwind this one!_

5. ### Profiling
  There are a lot of tools to help you measure how MongoDB is performing. This will help as an overview of some of the most helpful techinques.

  #### Set profiling level
    By default the [profiling](http://docs.mongodb.org/manual/reference/method/db.setProfilingLevel/) is turned off. When developing however, it can be smart to enable profiling of all queries. The performance of and all queries are then stored in a profiling collection `db.system.profile`. Set the profiling level to profile all operations.

    After setting the profiling level run the following query `db.products.find({category: "Øl"})`. In the `db.system.profile` collection now find the entries of only this query.

    _In production monitoring only slow queries is a good way to help enhance the performance your application. Setting the profiling level to 1 will only profile queries that run longer than a treshold you define i.e. 100ms._

  #### Explain
    Wonder how fast a query is or if it hits an index when experementing in the mongo shell? Use  [.explain()`](http://docs.mongodb.org/manual/reference/method/cursor.explain/).

    Run the `db.products.find({category: "Øl"})` query again, only now use explain with it.

    It's quite obvious by the result of explain that this query is not very efficient. Add an index to the category field. Run the query with explain again. See any improvement?

6. ### All done?
    Completed all exercises? Pick your favorite programming language and show us what you can create with the dataset we have provided you with in the `kursserie` database.
