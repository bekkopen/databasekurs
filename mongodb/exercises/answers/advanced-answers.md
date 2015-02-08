# Advanced exercises

1. ### Range queries
  #### Greater than
    ```js
> db.products.count({price: {$gt: 1000}})
734
    ```

  #### Value in array
  ```js
> db.users.count({'carts.products': 4995001})
46
  ```

2. ### Advanced updates

  #### Upserts
  ```js
  > db.users.update({
    "_id": "elon.musk"
    }, {
    "$push": {
      carts: {
        "products" : [
          1137901,
          9139202,
          3043401
        ]
      }
    }}, {
    upsert: true
  });
  ```
  As this user did not exist prior to this update the following document would be inserted:
  ```js
  > db.users.find({_id: "elon.musk"})
{ "_id" : "elon.musk", "carts" : [  {  "products" : [  1137901,  9139202,  3043401 ] } ] }

  ```
  If you run the same upsert once more, only another cart similar to the one already added would be appended to the carts array.

  #### Multi-update

  ```js
  > db.products.update({countryRegion: "Norge, Øvrige, Øvrige"}, {"$set": {countryRegion: "Norge"}}, {multi: true});
  ```
