# Mongodb

### Load data into local Mongodb
1. Open a terminal in this folder `<path-to-repo>/mongodb`
2. Ensure mongodb is installed and `mongod` is running.
3. `mongorestore --db kursserie --collection products data/products.bson`
4. `mongorestore --db kursserie --collection users data/users.bson`

### Access mongo shell
1. Again ensure mongod is still running
2. Enter the command `mongo`
3. Type `use kursserie` to switch to that database.
4. `show collections` will now prompt you all collections.
5. For a list of commands type `help`
