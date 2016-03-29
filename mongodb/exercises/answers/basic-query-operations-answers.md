# Solutions to the basic operations exercises

1. ### Fetch by Id
    ```js
    > db.users.findOne({_id: 'kathryn_brakus'});
    {
      "_id" : "kathryn_brakus",
      "name" : "Kathryn Brakus",
      "birthdate" : ISODate("1969-04-07T00:00:00Z"),
      "email" : "kathryn_brakus@yahoo.com",
      "sex" : "female",
      "phone" : 98855330,
      "carts" : [
        {
          "products" : [
            937002,
            1130501,
            319301,
            9548307,
            7207702,
            484701,
            3318201
          ]
        }
      ]
    }
    ```

2. ### Number of male users

    ```js
> db.users.count({sex: 'male'})
2522
    ```

3. ### Cheapest "Brennevin"
    ```js
    > db.products.find({category: "Brennevin"}).sort({pricePerLiter: 1}).limit(3)
{ "_id" : 5227804, "title" : "Gordon's Gin & Tonic", "containerSize" : "25 cl", "price" : 29.9, "pricePerLiter" : 115.6, "productType" : "Øvr. brennevin u/22%", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "foodPairings" : "", "countryRegion" : "Italia, Øvrige, Øvrige", "ingredients" : "Einebær, koriander, sitrus, andre krydder, vann, sukker", "alcohol" : 6.4, "sugar" : "66,00", "acid" : "Ukjent", "manufacturer" : "The Smirnoff Co.", "wholesaler" : "Diageo Norway AS", "distributor" : "SKANLOG VSD AS", "containerType" : "Metallemballasje Resirk II (pant)", "category" : "Brennevin" }
{ "_id" : 1569604, "title" : "Smirnoff No. 21 Vodka & Apple", "containerSize" : "25 cl", "price" : 32.9, "pricePerLiter" : 127.6, "productType" : "Øvr. brennevin u/22%", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "foodPairings" : "", "countryRegion" : "Italia, Øvrige, Øvrige", "ingredients" : "Kornsprit, eplejuice, sukker, vann, karamel", "method" : "Basisbrennevinet blir trippeldestillert for deretter å gjennomgå en", "alcohol" : 6.4, "sugar" : "85,00", "acid" : "Ukjent", "manufacturer" : "The Smirnoff Co.", "wholesaler" : "Diageo Norway AS", "distributor" : "SKANLOG VSD AS", "containerType" : "Metallemballasje Resirk I (pant)", "category" : "Brennevin" }
{ "_id" : 5227704, "title" : "Captain Morgan Spiced Gold & Cola", "containerSize" : "25 cl", "price" : 33.9, "pricePerLiter" : 135.6, "productType" : "Øvr. brennevin u/22%", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "color" : "Middels dyp brungul.", "aroma" : "Aroma preget av krydder, rom og cola.", "taste" : "Lett perlende og søt. Middels fylde.", "foodPairings" : "", "countryRegion" : "Italia, Øvrige, Øvrige", "ingredients" : "Melasse, vanilje, andre krydder, vann, sukker", "alcohol" : 6.4, "sugar" : "91,50", "acid" : "Ukjent", "manufacturer" : "The Smirnoff Co.", "wholesaler" : "Diageo Norway AS", "distributor" : "SKANLOG VSD AS", "containerType" : "Metallemballasje Resirk II (pant)", "category" : "Brennevin" }
    ```

    _You can use the [pretty]() function to format the results of your query `> db.products.find().pretty()`._

4. ### Find all products from The Glenlivet
    ```js
    > db.products.find({title: /^The Glenlivet/}, {title: 1, _id: 0})
    { "title" : "The Glenlivet Single Malt 12 Years Old" }
    { "title" : "The Glenlivet Guardians Chapter" }
    { "title" : "The Glenlivet 15 Y.O. French Oak Reserve" }
    { "title" : "The Glenlivet 18 Years Old" }
    { "title" : "The Glenlivet XXV Years Old" }
    { "title" : "The Glenlivet Nadurra 16 Years Old Cask Strength" }
    ```
    Alternative with distinct:
    ```js
    > db.products.distinct('title',{title: /^The Glenlivet/})
    [
      "The Glenlivet Single Malt 12 Years Old",
      "The Glenlivet 15 Y.O. French Oak Reserve",
      "The Glenlivet Guardians Chapter",
      "The Glenlivet 18 Years Old",
      "The Glenlivet XXV Years Old",
      "The Glenlivet Nadurra 16 Years Old Cask Strength"
    ]
    ```

5. ### Paginated list of products
    ```js
    > db.products.find({category: "Øl", containerSize: "50 cl"}).skip(10).limit(5)
{ "_id" : 201702, "title" : "Coisbo Easter Ale", "containerSize" : "50 cl", "price" : 74.9, "pricePerLiter" : 149.8, "productType" : "Overgjæret", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "fullness" : 0.5, "sweetness" : 0.25, "bitterness" : 0.33, "color" : "Gyllen.", "aroma" : "Krydder som koriander, moden frukt, nøtter og karamell.", "taste" : "Som duft.", "foodPairings" : "Apertiff, Fisk, Lyst kjøtt", "countryRegion" : "Danmark, Øvrige", "ingredients" : "Byggmalt.", "alcohol" : 6.2, "sugar" : "Ukjent", "acid" : "Ukjent", "storable" : "Drikkeklar nå, men kan også lagres", "manufacturer" : "Coisbo", "wholesaler" : "Strøm AS", "distributor" : "Trebuchet AS", "containerType" : "Engangsflasker av glass", "corkType" : "Crown Cap", "category" : "Øl" }
{ "_id" : 201802, "title" : "Coisbo Queens Desire", "containerSize" : "50 cl", "price" : 69.9, "pricePerLiter" : 139.8, "productType" : "Overgjæret", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "fullness" : 0.42, "sweetness" : 0.33, "bitterness" : 0.08, "color" : "Uklar, gyllen oransj.", "aroma" : "Sitrus, frisk frukt.", "taste" : "Lett og fruktig. Kremet.", "foodPairings" : "Apertiff, Skalldyr, Fisk", "countryRegion" : "Danmark, Øvrige", "ingredients" : "Bygg, malt.", "alcohol" : 4.8, "sugar" : "Ukjent", "acid" : "Ukjent", "storable" : "Drikkeklar nå, men kan også lagres", "manufacturer" : "Coisbo", "wholesaler" : "Strøm AS", "distributor" : "Trebuchet AS", "containerType" : "Engangsflasker av glass", "corkType" : "Crown Cap", "category" : "Øl" }
{ "_id" : 201902, "title" : "Coisbo Brooklyn Fall", "containerSize" : "50 cl", "price" : 73.9, "pricePerLiter" : 147.8, "productType" : "Undergjæret", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "fullness" : 0.67, "sweetness" : 0.33, "bitterness" : 0.25, "color" : "Sjokoladebrun.", "aroma" : "Sjokolade og ristede nøtter. Litt røyk.", "taste" : "Sjokolade og hint av røyket.", "foodPairings" : "Ost, Storfe, Lam og sau", "countryRegion" : "Danmark, Øvrige", "ingredients" : "Byggmalt", "alcohol" : 6.5, "sugar" : "Ukjent", "acid" : "Ukjent", "storable" : "Drikkeklar nå, men kan også lagres", "manufacturer" : "Coisbo", "wholesaler" : "Strøm AS", "distributor" : "Trebuchet AS", "containerType" : "Engangsflasker av glass", "corkType" : "Crown Cap", "category" : "Øl" }
{ "_id" : 202002, "title" : "Coisbo Astoria Black", "containerSize" : "50 cl", "price" : 69.9, "pricePerLiter" : 139.8, "productType" : "Overgjæret", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "fullness" : 0.83, "undefined" : 0.58, "bitterness" : 0.67, "color" : "Mørk brunsvart.", "aroma" : "Tiltalende preg av mørkbrent malt, kaffe og lakris, innslag av tørket frukt.", "taste" : "Rik og kremet, preg av mørkt malt, litt røyk, sjokolade og lakris.", "foodPairings" : "Småvilt og fugl, Ost, Dessert, kake, frukt", "countryRegion" : "Danmark, Øvrige", "ingredients" : "Vann, byggmalt, hvetemalt, humle, gjær", "method" : "Tradisjonell overgjæret produksjonsprosess, ikke lagret.", "alcohol" : 7.2, "sugar" : "Ukjent", "acid" : "Ukjent", "manufacturer" : "Coisbo", "wholesaler" : "Strøm AS", "distributor" : "Trebuchet AS", "containerType" : "Engangsflasker av glass", "corkType" : "Crown Cap", "category" : "Øl" }
{ "_id" : 202102, "title" : "Coisbo Urban Haze", "containerSize" : "50 cl", "price" : 70.9, "pricePerLiter" : 141.8, "productType" : "Overgjæret", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "fullness" : 0.42, "sweetness" : 0.17, "bitterness" : 0.25, "color" : "Lys, gyllen kobber.", "aroma" : "Hylleblomst, karamell, humle.", "taste" : "Humle og karamell.", "foodPairings" : "Lyst kjøtt, Apertiff, Småvilt og fugl", "countryRegion" : "Danmark, Øvrige", "ingredients" : "Bygg, malt.", "alcohol" : 5.3, "sugar" : "Ukjent", "acid" : "Ukjent", "storable" : "Drikkeklar nå, men kan også lagres", "manufacturer" : "Coisbo", "wholesaler" : "Strøm AS", "distributor" : "Trebuchet AS", "containerType" : "Engangsflasker av glass", "corkType" : "Crown Cap", "category" : "Øl" }
    ```
