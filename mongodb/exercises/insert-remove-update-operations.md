# Inserting, removing and updating documents

1. ### Insert yourself
    Add a yourself as a user in the users collection.

    You should at least set the fields `_id`, `name` and `birthdate`.

    _Read about  [insert  in the docs](http://docs.mongodb.org/manual/reference/method/db.collection.insert/)._

2. ### Buy something for yourself
  Pretend you buy something by adding a cart consisting of an array of product `_id` elements.

  _Example user with cart:_

  ```js
  {
    "_id" : "herzog_ed",
    "name" : "Ed Herzog",
    "birthdate" : ISODate("1984-07-12T00:00:00Z"),
    "email" : "ed.herzog@yahoo.com",
    "sex" : "female",
    "phone" : 94387349,
    "carts" : [
      [
        994901,
        1469401
      ]
    ]
  }
  ```

  _Remember to use the update operator [$push](http://docs.mongodb.org/manual/reference/operator/update/push/) so that you do not overwrite your entire user document._

  _Go to the source about [updates](http://docs.mongodb.org/manual/reference/method/db.collection.update/)._
