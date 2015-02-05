# Inserts, updates and removes

1. ### Insert yourself
  ```js
> db.users.insert({
    _id: "elon.musk",
    name: "Elon Musk",
    birthdate: new Date("1971-06-28")
});
WriteResult({ "nInserted" : 1 })
  ```
  The user "elon.musk" should now look like:
  ```js
> db.users.findOne({_id: "elon.musk"})
{
  "_id" : "elon.musk",
  "name" : "Elon Musk",
  "birthdate" : ISODate("1971-06-28T00:00:00Z")
}
  ```

2. ### Buy something for yourself
  ```js
> db.users.update({_id: "elon.musk"}, {"$push": {carts: [994901, 515801]})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
  ```
  This should leave the "elon.musk" user in the following state:
  ```js
  > db.users.findOne({_id: "elon.musk"})
  {
    "_id" : "elon.musk",
    "name" : "Elon Musk",
    "birthdate" : ISODate("1971-06-28T00:00:00Z"),
    "carts" : [
      [
        994901,
        515801
      ]
    ]
  }
  ```

3. ### Remove the user you created

  ```js
  > db.users.remove({_id: "elon.musk"});
WriteResult({ "nRemoved" : 1 })
  ```
