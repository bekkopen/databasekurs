# Vinmonopolet mongodb dataparser

This application finds all products from vinmonopolet and stores them in your local mongodb instance.

In addition to the product details, main category information is also added to the objects.

The program does not terminate upon completion, but should print that it is done (not tested).

## Run it
Assumes you have this folder locally on your computer. In other words, you cloned it already.

1. npm install
2. Ensure mongodb is running on `localhost:27017`
    - Not running? start monogdb: `> mongod` in seperate terminal window
3. node index

Running it will take some time as it will actually scrape vinmonopolets pages. Use with caution and respect.
