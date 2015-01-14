var vm = require('vinmonopolet');
var _ = require('lodash');
var MongoClient = require('mongodb').MongoClient;

var totalCount = 0;
var counter = 0;

var insert = function (db, category, product) {
    var products = db.collection('products');

    product.category = category;
    product._id = product.sku;
    delete product.sku;

    products.insert(product, function (err, res) {
        if (err) return console.log("Fail: "+ product._id);
        counter += 1;

        if (counter % 50) console.log(counter + "/" + totalCount);

        if (counter == totalCount) console.log(counter + "/" + totalCount " added. Success! ctrl+c to end.");
    });
}

MongoClient.connect('mongodb://localhost:27017/vinmonopolet', function (err, db) {
    if (err) throw err;
    vm.getCategories(function (err, categories) {

        _.each(categories, function (category) {
            vm.getProductsByCategoryName(category.title, function (err, result) {
                console.log(category.title + "#" + category.count)
                totalCount += category.count;

                _.each(result, function (product) {
                    vm.getProductDetails(product.sku, function (err, details) {
                        if (err) console.log("Fail: "+product.sku);
                        insert(db, category.title, details)
                    })
                })
            })
        });
    });
});


// fetch categories

// fetch skus

// for each sku get product
