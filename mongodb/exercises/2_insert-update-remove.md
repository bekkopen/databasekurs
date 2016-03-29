# Inserts, updates and removes

_Look at the mongodb/README.md for how to access the mongo shell where you will perform these exercises._

1. ### Insert yourself
    Add yourself as a user in the users collection.

    You should at least set the fields `_id`, `name` and `birthdate`.

    _Read about  [insert](http://docs.mongodb.org/manual/reference/method/db.collection.insert/) in the docs._

    _Remember that you can use plain javascript in the shell._

2. ### Buy something for yourself
  Pretend you buy something by adding a cart consisting of an array of product `_id` elements.

  _Example user with cart:_

  ```js
  {
    "_id" : "elon.musk",
    "name" : "Elon Musk",
    "birthdate" : ISODate("1971-06-28T00:00:00Z"),
    "carts" : [
      {
        products: [ 4331001 ]
      }
    ]
  }
  ```

  _Remember to use the update operator [$push](http://docs.mongodb.org/manual/reference/operator/update/push/) so that you do not overwrite your entire user document._

  _Go to the source about [updates](http://docs.mongodb.org/manual/reference/method/db.collection.update/)._

3. ### Remove the user you created
  Get some first hand experience with the [remove]() method by removing the user you created and updated in 1 and 2.
