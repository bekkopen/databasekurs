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
3. ### Indexing
  #### Index on product title
    ```js
    > db.products.ensureIndex({title: 1});
    ```
  #### Text search
    ```js
    > db.products.ensureIndex({ingredients: "text"});
  > db.products.find({$text: {$search: "kardemomme"}});
{ "_id" : 1595001, "title" : "Wemyss Darnley`s View Spiced Gin", "containerSize" : "70 cl", "price" : 555, "pricePerLiter" : 792.9, "productType" : "Gin", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "color" : "Klar.", "aroma" : "En blanding av kanal og muskat, så ingefær og nellik.", "taste" : "Glatt på ganen med kryddermix av koriander og muskat, så spisskummen. Henger godt i munnen.", "foodPairings" : "Apertiff", "countryRegion" : "Storbritannia, Øvrige", "ingredients" : "Grain sprit tilsatt einer, kassiakanel, kanel, ingefær, muskat, kardemomme, spisskummen, nellik, korianderfrø og kvannrot.", "method" : "Alle tilsetninger er gjort før destillering. Destillert 5 ganger.", "alcohol" : 42.7, "sugar" : "Ukjent", "acid" : "Ukjent", "manufacturer" : "Wemyss Vintage Malts", "wholesaler" : "Daracha AS", "distributor" : "Vinhuset AS - Bergen", "containerType" : "Engangsflasker av glass", "corkType" : "Naturkork", "category" : "Brennevin" }
{ "_id" : 5225901, "title" : "Luxardo Gin", "containerSize" : "70 cl", "price" : 295, "pricePerLiter" : 421.4, "productType" : "Gin", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "foodPairings" : "", "countryRegion" : "Italia, Øvrige, Øvrige", "ingredients" : "Einebær, koriander, cassia, fenikkel, anis, angelika, appelsin- og sitronskall, mandler, kardemomme, bergamot og kanel", "alcohol" : 37.5, "sugar" : "Ukjent", "acid" : "Ukjent", "manufacturer" : "Girolamo Luxardo", "wholesaler" : "Cork Wines & Spirits AS", "distributor" : "Vectura AS", "containerType" : "Engangsflasker av glass", "category" : "Brennevin" }
{ "_id" : 1143602, "title" : "Norsk Bitter", "containerSize" : "50 cl", "price" : 269.9, "pricePerLiter" : 539.8, "productType" : "Bitter", "productSelection" : "Basisutvalg", "shopCategory" : "Butikkategori 4", "color" : "Middels dyp gulbrun.", "aroma" : "Sval og fokusert aroma av sitrus, anis og ulike kryddere.", "taste" : "Fint sammensatt bitter med god fylde og godt råvarepreg.", "foodPairings" : "", "countryRegion" : "Norge, Øvrige", "ingredients" : "Potetsprit, angelica, anis, kardemomme, enzianrot, galangrot, gurkemeie, johannesurt, lakris, lakrisrot, malurt, nellik, pomeran", "method" : "Tradisjonell destillasjon av basisspriten før maserasjon av krydder og urter og blanding av bestanddeler.", "alcohol" : 35, "sugar" : "10,00", "acid" : "Ukjent", "manufacturer" : "Det Norske Brenneri", "wholesaler" : "Det Norske Brenneri AS", "distributor" : "Trebuchet AS", "containerType" : "Engangsflasker av glass", "category" : "Brennevin" }
{ "_id" : 1900002, "title" : "Austmann Vintersolverv", "containerSize" : "33 cl", "price" : 49.9, "pricePerLiter" : 151.2, "productType" : "Overgjæret", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "fullness" : 0.67, "undefined" : 0.33, "bitterness" : 0.25, "color" : "Rød brun, off-white skum.", "aroma" : "Godt krydderpreg, noe rød frukt og brent malt på aroma.", "taste" : "Lett søtlig krydder med kanel, sjokolade og tørr finish.", "foodPairings" : "Ost", "countryRegion" : "Norge, Sør-Trøndelag", "ingredients" : "Malt, vann, gjær, humle, nellik, kardemomme og appelsinskall", "method" : "Tradisjonell overgjæret metode i åpne gjæringskar, upasteurisert og ufiltrert med naturlig karbonering på flaske", "alcohol" : 6.9, "sugar" : "14,00", "acid" : "Ukjent", "storable" : "Drikkeklar nå, men kan også lagres", "manufacturer" : "Austmann Bryggeri", "wholesaler" : "Beer Enthusiast AS", "distributor" : "Cuveco AS", "containerType" : "Engangsflasker av glass", "corkType" : "Crown Cap", "category" : "Øl" }
{ "_id" : 5688701, "title" : "G'Vine Florasion", "containerSize" : "70 cl", "price" : 470.2, "pricePerLiter" : 671.7, "productType" : "Gin", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "foodPairings" : "", "countryRegion" : "Frankrike, Øvrige, Øvrige", "ingredients" : "Druesprit (Ugni Blanc), drueblomstekstrakt, einerbær, kardemomme, koreander, ingefær, muscat, lime", "method" : "Tradisjonell produksjonsprosessIkke fatlagret", "alcohol" : 40, "sugar" : "Ukjent", "acid" : "Ukjent", "manufacturer" : "Euroweingate", "wholesaler" : "Zarepta AS", "distributor" : "Vectura AS", "containerType" : "Engangsflasker av glass", "category" : "Brennevin" }
{ "_id" : 1776602, "title" : "Blossa Stärkvinsgløgg spetsad med Cognac", "containerSize" : "50 cl", "price" : 148.3, "pricePerLiter" : 296.6, "productType" : "Aromatisert sterkvin", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "color" : "Dyp brunrød.", "aroma" : "Rik aroma av tørket frukt, nellik og kanel, innslag av cognac.", "taste" : "Sval og fint sammensatt gløgg med god fylde, søt.", "foodPairings" : "Apertiff, Ost, Dessert, kake, frukt", "countryRegion" : "Sverige, Øvrige, Øvrige", "ingredients" : "Sterkvin, gløggkrydder, nellik, kardemomme, ingefær, cognac", "method" : "Sterkvinsgløgg tilsatt cognac.Smakssatt med nellik, kardemomme og ingefær.", "alcohol" : 21, "sugar" : "171,00", "acid" : "Ukjent", "manufacturer" : "Altia Corp.", "wholesaler" : "Altia Norway AS", "distributor" : "Trebuchet AS", "containerType" : "Engangsflasker av glass", "corkType" : "Naturkork", "category" : "Sterkvin" }
{ "_id" : 5572002, "title" : "Luxardo Fernet", "containerSize" : "50 cl", "price" : 270, "pricePerLiter" : 540, "productType" : "Bitter", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "color" : "Mørk brun.", "aroma" : "Bittert, søtlig.", "taste" : "Bitter.", "foodPairings" : "Apertiff", "countryRegion" : "Italia, Øvrige, Øvrige", "ingredients" : "Sprit, Lakris, Kardemomme, Kanel", "alcohol" : 40, "sugar" : "20,00", "acid" : "Ukjent", "manufacturer" : "Girolamo Luxardo", "wholesaler" : "Cork Wines & Spirits AS", "distributor" : "Vectura AS", "containerType" : "Engangsflasker av glass", "corkType" : "Skrukapsel", "category" : "Brennevin" }
    ```
4. ### Aggregation
  #### Number of products in each category
    ```js
    > db.products.aggregate([
        {
          $group: { _id: "$category", numProducts: { $sum: 1 }}
        }
      ]);

  { "_id" : "Øl", "numProducts" : 897 }
  { "_id" : "Musserende vin", "numProducts" : 1203 }
  { "_id" : "Rosévin", "numProducts" : 435 }
  { "_id" : "Alkoholfritt", "numProducts" : 63 }
  { "_id" : "Rødvin", "numProducts" : 6346 }
  { "_id" : "Fruktvin", "numProducts" : 84 }
  { "_id" : "Sterkvin", "numProducts" : 315 }
  { "_id" : "Hvitvin", "numProducts" : 4117 }
  { "_id" : "Brennevin", "numProducts" : 2418 }
    ```

  #### Cheapest and most expensive
    ```js
    > db.products.aggregate([
        {
          $group: {
            _id: "$category",
            minPrice: {$min: "$price"},
            maxPrice: {$max: "$price"},
            avgPrice: {$avg: "$price"}
          }
        },
        {
          $sort: {
            avgPrice: 1
          }
        }
      ]);
    { "_id" : "Alkoholfritt", "minPrice" : 17, "maxPrice" : 161.4, "avgPrice" : 55.219047619047636 }
  { "_id" : "Øl", "minPrice" : 26, "maxPrice" : 599, "avgPrice" : 72.53322185061366 }
  { "_id" : "Fruktvin", "minPrice" : 28.4, "maxPrice" : 885.4, "avgPrice" : 153.27619047619044 }
  { "_id" : "Rosévin", "minPrice" : 34.9, "maxPrice" : 1999, "avgPrice" : 180.78229885057473 }
  { "_id" : "Hvitvin", "minPrice" : 29, "maxPrice" : 3599.9, "avgPrice" : 249.15853777022926 }
  { "_id" : "Rødvin", "minPrice" : 33.9, "maxPrice" : 12500, "avgPrice" : 324.0625433343636 }
  { "_id" : "Sterkvin", "minPrice" : 75, "maxPrice" : 19990, "avgPrice" : 438.0431746031737 }
  { "_id" : "Musserende vin", "minPrice" : 39.9, "maxPrice" : 20999.9, "avgPrice" : 480.6807980049929 }
  { "_id" : "Brennevin", "minPrice" : 29.9, "maxPrice" : 65000, "avgPrice" : 830.3419354838495 }
    ```

  #### Most sold product
    ```js
    > db.users.aggregate([
        {
          $unwind: "$carts"
        },
        {
          $unwind: "$carts.products"
        },
        {
          $group: {
            _id: "$carts.products",
            sold: {"$sum": 1}
          }
        },
        {
          $sort: { sold: -1 }
        },
        {
          $limit: 3
        }
      ]);

    { "_id" : 91507, "sold" : 74 }
    { "_id" : 1425001, "sold" : 73 }
    { "_id" : 4200201, "sold" : 72 }
    ```
