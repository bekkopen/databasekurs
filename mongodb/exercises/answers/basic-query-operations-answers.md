# Solutions to the basic operations exercises

1. ### Fetch by Id

    ```js
    > db.users.findOne({_id: 'morar.reva'});
{
    "_id" : "morar.reva",
    "name" : "Reva Morar",
    "birthdate" : ISODate("1986-04-12T00:00:00Z"),
    "email" : "morar_reva@yahoo.com",
    "sex" : "male",
    "phone" : 94222418
}
    ```

2. ### Number of male users

    ```js
    > db.users.count({sex: 'male'})
2538
    ```

3. ### Cheapest beer
    ```js
    > db.products.find({category: 'Brennevin'}).sort({pricePerLiter: -1}).limit(3)
{ "_id" : 1195001, "title" : "Hardy Le Printemps", "containerSize" : "70 cl", "price" : 65000, "pricePerLiter" : 92857.1, "productType" : "Druebrennevin", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "color" : "Gyllen.", "aroma" : "Fyldig, rik og aromatisk.", "taste" : "Rik og kompleks, med flott balanse og lang ettersmak.", "foodPairings" : "Apertiff", "countryRegion" : "Frankrike, Cognac Tradisjonell, Grande Champagne", "ingredients" : "Ugni Blanc 100%", "alcohol" : 41, "sugar" : "9,00", "acid" : "Ukjent", "storable" : "Drikkeklar nå, men kan også lagres", "manufacturer" : "A. Hardy", "wholesaler" : "Lundsmo As", "distributor" : "SKANLOG VSD AS", "containerType" : "Engangsflasker av glass", "corkType" : "Naturkork", "category" : "Brennevin" }
{ "_id" : 1579301, "title" : "Henrik Ibsen No.1 Grande Champagne", "containerSize" : "70 cl", "price" : 39137.5, "pricePerLiter" : 55910.7, "productType" : "Druebrennevin", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "color" : "Mørk gyllen.", "aroma" : "Rik, kompleks med aromaer av vanilje og sjokolade.", "taste" : "God fylde, balansert med lang ettersmak.", "foodPairings" : "Apertiff", "countryRegion" : "Frankrike, Cognac Tradisjonell, Grande Champagne", "ingredients" : "Ugni Blanc 100%", "method" : "Blend av flere årganger. De eldste fra Henrik Ibsens egen tid ca. 1860. Håndlaget krystallkarafell ala Nøstetangen.", "alcohol" : 40, "sugar" : "10,00", "acid" : "Ukjent", "manufacturer" : "Gautier", "wholesaler" : "Rosmersholm as", "distributor" : "Rosmersholm as", "containerType" : "Engangsflasker av glass", "corkType" : "Naturkork", "category" : "Brennevin" }
{ "_id" : 984001, "title" : "Hardy Perfection Lumiére", "containerSize" : "70 cl", "price" : 33300, "pricePerLiter" : 47571.4, "productType" : "Druebrennevin", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "color" : "Mørk kobber.", "aroma" : "Sigar og muskat.", "taste" : "Sjokolade og kaffe. Balansert, god fylde med lang avslutning.", "foodPairings" : "Apertiff", "countryRegion" : "Frankrike, Cognac Tradisjonell, Grande Champagne", "ingredients" : "Colombard 100%", "method" : "Destilert i 1870 åra og plassert i demijohn (glassballong) i 1960", "alcohol" : 41, "sugar" : "8,00", "acid" : "Ukjent", "storable" : "Drikkeklar nå, men kan også lagres", "manufacturer" : "A. Hardy", "wholesaler" : "Lundsmo As", "distributor" : "SKANLOG VSD AS", "containerType" : "Engangsflasker av glass", "corkType" : "Naturkork", "category" : "Brennevin" }
    ```

    _You can use the [pretty]() function to format the results of your query `> db.products.find().pretty()`._

4. ### Find the title of all bottles from Norway
    ```js
    > db.products.find({countryRegion: /^Norge/}, {_id: 0, title: 1})
{ "title" : "Løiten Linie" }
{ "title" : "Løiten Linie" }
{ "title" : "Gilde Non Plus Ultra" }
{ "title" : "Løiten Export" }
{ "title" : "Hammer" }
{ "title" : "Brennevin Seksti" }
{ "title" : "Hammer" }
{ "title" : "Hammer Lime" }
{ "title" : "Frost" }
{ "title" : "Vikingfjord Vodka 50%" }
{ "title" : "Fuhr Cascade" }
{ "title" : "Ringi Eple og Aronia" }
{ "title" : "Ringi Eple og Aronia" }
{ "title" : "Egge Gård Liereple" }
{ "title" : "VÅR Eple Kirsebær og Aronia 2011" }
{ "title" : "Frisk & Frodig Eplemost Vista Bella" }
{ "title" : "Egge Gård Akevitt med villkarve" }
{ "title" : "Hardanger Eplebrennevin APAL" }
{ "title" : "Ægir Yggdrasil Akevitt" }
{ "title" : "Arvesølvet Juleakevitt 2014" }
Type "it" for more
    ```

5. ### Paginated list of products
    ```js
    > db.products.find().skip(1200).limit(3)
{ "_id" : 380406, "title" : "Da Luca Pinot Grigio Chardonnay", "containerSize" : "300 cl", "price" : 335.7, "pricePerLiter" : 111.9, "productType" : "Hvitvin", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "fullness" : 0.5, "undefined" : 0.67, "sweetness" : 0.08, "color" : "Lys strågul.", "aroma" : "Sitrus og eple med hint av mandel.", "taste" : "God fruktighet med en frisk avslutning.", "foodPairings" : "Apertiff, Skalldyr, Fisk", "countryRegion" : "Italia, Sicilia, Øvrige", "ingredients" : "Pinot Grigio 60%, Chardonnay 40%", "alcohol" : 12.5, "sugar" : "2,00", "acid" : "5,60", "storable" : "Drikkeklar, ikke egnet for lagring", "manufacturer" : "Accolade Wines", "wholesaler" : "Best Cellars AS", "distributor" : "Cuveco AS", "containerType" : "BIB under 4 ltr", "category" : "Hvitvin" }
{ "_id" : 380601, "title" : "Cantarini Barbera d'Alba 2011/2012", "containerSize" : "75 cl", "price" : 125, "pricePerLiter" : 166.7, "productType" : "Rødvin", "productSelection" : "Basisutvalg", "shopCategory" : "Butikkategori 6", "fullness" : 0.67, "undefined" : 0.67, "color" : "Dyp rød med blåskjær.", "aroma" : "Aroma med preg av mørke og røde bær, hint av morell.", "taste" : "Preg av mørke bær og trekrydder, frisk ettersmak med god lengde. (2011)", "foodPairings" : "Storfe, Svinekjøtt, Lam og sau", "countryRegion" : "Italia, Piemonte, Alba", "ingredients" : "Barbera 100%", "method" : "Gjæret temperaturkontrollert i ståltanker ved 28-30 °C, 8 dagers maserasjon, deler av vinen er fatlagret i ca. 6 md., 2 md. flaskemodning før salg.", "alcohol" : 13.5, "sugar" : "2,40", "acid" : "5,90", "storable" : "Drikkeklar nå, men kan også lagres", "manufacturer" : "Winehouse Norway", "wholesaler" : "Best Cellars AS", "distributor" : "Cuveco AS", "containerType" : "Engangsflasker av glass", "corkType" : "Naturkork", "category" : "Rødvin" }
{ "_id" : 381606, "title" : "Domaine Chenevieres Petit Chablis 2012", "containerSize" : "300 cl", "price" : 469.5, "pricePerLiter" : 156.5, "productType" : "Hvitvin", "productSelection" : "Bestillingsutvalg", "shopCategory" : "Uavhengig sortiment", "fullness" : 0.5, "undefined" : 0.67, "sweetness" : 0.08, "color" : "Klar gul med noe grønnskjær.", "aroma" : "Limejuice, sjøsprut, mineraler, grønne epler.", "taste" : "Mineralpreg, god fruktighet og friskhet.", "foodPairings" : "Apertiff, Skalldyr, Fisk", "countryRegion" : "Frankrike, Burgund, Chablis", "ingredients" : "Chardonnay 100%", "alcohol" : 12, "sugar" : "1,90", "acid" : "5,70", "storable" : "Drikkeklar nå, men kan også lagres", "manufacturer" : "Dom. des Chenevières", "wholesaler" : "Bibendum AS", "distributor" : "Trebuchet AS", "containerType" : "BIB under 4 ltr", "category" : "Hvitvin" }
    ```
