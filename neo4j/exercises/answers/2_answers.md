## 1. Register as a user!

    MERGE (:User {
        username:"jorgen.braseth",
        name:"Jørgen Braseth",
        birthdate:"1982-04-02",
        email:"jorgen.braseth@bekk.no",
        phone:"98219473"
    })


## 2. Pint please!
    MATCH
    (u:User{username:"jorgen.braseth"}),
    (p:Product{varenummer:"8040202"})
    CREATE
    (u)<-[:WAS_PURCHASED_BY]-(:ShoppingCart)<-[:WAS_PART_OF_CART]-(p)
