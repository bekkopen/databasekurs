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
