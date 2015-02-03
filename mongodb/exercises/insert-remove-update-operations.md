# Inserting, removing and updating documents

For this set of exercises we will start with an empty database. We will call our empty database `blogtest`.

To change to a specific database in the mongo shell:
```
// Use a database with the name blogtest
use blogtest
// show collections in the current database
show collections
```

1. ### Insert a blog post
    Insert the example blog post into a collection called posts.

    ```js
    {
        title: "Foo bar",
        content: "This is just the worst blogpost ever written. How short and pointless could it be really?",
        tags: ['pointless', 'fashion', 'iamtherealcookiemonster'],
        authored: ISODate("2015-01-10T13:37:00Z"),
        author: {
            name: "Blogger pseudonym",
            email: "theblogger@gmail.com",
            twitter: "hipsterhacker"
        }
    }
    ```
    _Documentation about inserts can be found [here](http://docs.mongodb.org/manual/reference/method/db.collection.insert/)._

2. ### Replace a document
    With an update, replace the content of blog post with title "Foo bar" with the following document:

    ```js
    {
        catastrophic: "failure"
    }
    ```
    _Use [Update](http://docs.mongodb.org/manual/reference/method/db.collection.update/) in this exercise._
    The default behavior of updates in mongodb can be a pitfall as you will experience in this example.

3. ### Remove a document
    A blog post containing only the field `catastrophic: failure` is not of much use. Please remove it!

    _Official documentation about [Remove](http://docs.mongodb.org/manual/reference/method/db.collection.remove/)._

4. ### Batch insert
    As the database is now empty again, let's add a couple of blog posts in one operation.
    ```js
    [{
        title: "Avatar generator",
        content: "Generate avatars based on a hash. It's pretty hilarious. http://robohash.org",
        tags: ['avatars', 'fake', 'internet'],
        authored: ISODate("2015-01-10T13:37:00Z"),
        author: {
            name: "Mr White",
            email: "mrwhite@gmail.com"
        }
    }, {
        title: "Astronomers Celebrate 300th Anniversary Of Discovering Sky",
        content: "Commemorating one of the most important scientific findings in human history, astronomers around the world Monday celebrated the 300th anniversary of English physicist Edmund Weaver’s discovery of the sky. “We take this knowledge for granted today, but you have to understand that in 1714, people simply had no idea that anything else existed other than the earth’s surface,” said Norio Kaifu, president of the International Astronomical Union, noting that prior to the 18th century it was widely accepted among the scientific community that there was just more ground above them.",
        tags: ['news', 'onion', 'internet'],
        authored: ISODate("2015-01-11T13:37:00Z"),
        author: {
            name: "Mr White",
            email: "mrwhite.otheraddress@gmail.com"
        }
    }]
    ```

5. ### Add a comment
    Let's add another field to one of our blog posts, an array of comments.
    ```js
    {
        title: "",
        content: "",
        tags: [""],
    }
    ```
