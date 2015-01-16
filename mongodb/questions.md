## Find

### Fetch user by Id

```
> db.users.findOne({_id: ObjectId("")});
```

### All users

```
> db.users.find().pretty()
```

### All users sorted on name

```
> db.users.find().sort({name: 1}).pretty();
```

### 10 first users sorted on name

```
> db.users.find().sort({name: 1}).limit(10).pretty();
```

### Paginated list

```
> db.users.find().sort({name: 1}).limit(10).skip(10).pretty();
```


### Number of users which name starts with John

```
> db.users.count({name: /^John/});
```

### Only the name of products from Canada

```
> db.users.find({}, {name: 1, _id: 0});
```

## Query operators

### People older than 40
Here we need to do an arithmetical query, more specific the [$gt](http://link.to.docs) greater than operator

```
> db.users.find({age: {$gt: 40}}).pretty();
```

[All arithmetical operators](http://link.to.docs)

### Products from Norway or Sweden
This query requires the use of logical operators:star:. Here the operator we need is [$or](http://link.to.docs).

```
> db.products.find({$or: [{country: "Norway"}, {country: "Sweden"}]}).pretty();
```

:star: Strictly speaking you could have used an regex, but that would just be silly.

[All logical operators](http://link.to.docs)

## Update

### Replace document
Replace the data in product with sku 12345 to only contain sku and the name "Woops"

```
> db.products.update({_id: 12345}, {name: "Woops"});
```

### Update name
Instead of replacing the entire document of sku 12345, only change its name.

```
> db.products.update({_id: 12345}, {$set: {name: "Beatiful new name"}});
```

### Multi Update
Change producername of all products from _Liquor AB_ to _Vodka Industries AB_.

```JS
> db.products.update({
    producername: 'Liquor AB'
}, {
    $set: {
        producername: 'Vodka Industries AB'
    }
}, {
    multi: true
});
```

### Upsert
Add friend `asdf` to user with username `ceasar`. If John Doe does not exist, also create mr John doe.

```
> db.users.update({
    _id: 'ceasar'
}, {
    $push: 'asdf'
}, {
    upsert: true
});
```
[All update operators](http://link.to.docs)

### Insert
Create a product with these values:
```
> var newProduct = {
    //specification
};
```
```
> db.products.insert(newProduct);
```
