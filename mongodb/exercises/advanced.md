# Advanced exercises

_Look at the mongodb/README.md for how to access the mongo shell where you will perform these exercises._

In this section there will really be a mixture of exercises in different categories. Do not feel obliged to do them sequentially.

1. ### Advanced queries

  #### Comparison queries
    Find the number of products with `price` greater than [$gt](http://docs.mongodb.org/manual/reference/operator/query/gt/) 1000.

    _All comparison operators are found [here](http://docs.mongodb.org/manual/reference/operator/query-comparison/)._

  #### Value in array
  Find the total number of users who have bought The Glenlivet Nadurra `_id: 4995001`

  _Hints can be found [here](http://docs.mongodb.org/manual/tutorial/query-documents/#match-a-field-without-specifying-array-index)_.

  #### Logical query operators

  Or

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

    After adding the text index, try to [search](http://docs.mongodb.org/manual/reference/operator/query/text/#search-field) for `potet`.

4. ### Aggregation


5. ### Profiling
