//Legg inn familien min
CREATE
(meg:Person{name:"Jørgen", age:32, sex:"male"}),
(bror:Person{name:"Jan-Fredrik", age:36, sex:"male"}),
(mor:Person{name:"Hilde", age:59, sex:"female"}),
(far:Person{name:"Jan", age:60, sex:"male"}),
(mormor:Person{name:"Vesla", age:80, sex:"female"}),
(morfar:Person{name:"Jens", age:82, sex:"male"}),
(farmor:Person{name:"Brita", age:85, sex:"female"}),
(farfar:Person{name:"Arnt", age:87, sex:"male"}),
(tullik:Hund{name:"Tullik", age: 11, sex:"female", race:"Cocker Spaniel"}),
(punky:Hund{name:"Punky", age: 13, sex:"female", race:"Cocker Spaniel"}),
(susi:Hund{name:"Susi", age: 10, sex:"female", race:"Cocker Spaniel"}),
(jørgenhund:Hund{name:"Jørgen", age: 16, sex:"male", race:"Blandingsrase"}),


(meg)-[:BARN_AV]->(mor),
(meg)-[:BARN_AV]->(far),
(bror)-[:BARN_AV]->(mor),
(bror)-[:BARN_AV]->(far),
(mor)-[:BARN_AV]->(mormor),
(mor)-[:BARN_AV]->(morfar),
(far)-[:BARN_AV]->(farfar),
(far)-[:BARN_AV]->(farmor),

(tullik)-[:EID_AV]->(mor),
(tullik)-[:EID_AV]->(far),
(punky)-[:EID_AV]->(mor),
(punky)-[:EID_AV]->(far),
(susi)-[:EID_AV]->(farmor),
(susi)-[:EID_AV]->(farfar);


//MATCH
MATCH (n) RETURN n;

    //LIMIT
    MATCH (n) RETURN n LIMIT 3;

    //Label
    MATCH (n:Hund) RETURN n;

    //Property
    MATCH (n{name:"Jørgen"}) RETURN n;

    //Label + Property
    MATCH (n:Person{name:"Jørgen"}) RETURN n;

    //WHERE
    MATCH (n:Person) WHERE n.name = 'Jørgen' RETURN n;

    //Relasjoner
    MATCH (n{name:"Jørgen"})-[:BARN_AV]-(m) RETURN n,m;
    MATCH (n{name:"Jørgen"})<-[:BARN_AV]-(m) RETURN n,m;



//CREATE

    //Node
    CREATE (:Person{name:"Morten", age:54, sex:"male"});

    //Nodes + relationship
    CREATE (:Person{name:"Egil", age:54, sex:"male"})-[:BARN_AV]->(:Person{name:"Stian", age:54, sex:"male"});

    //Relationship
        MATCH (n{name:"Morten"}), (m{name:"Vesla"})
        CREATE(n)-[:BARN_AV]->(m);


//MERGE
MERGE (:Person{name:"Didrik", age:72, sex:"male"});


//Avansert MATCH

    //"Eldre enn"
    MATCH (p1:Person), (p2:Person)
    WHERE p1.age>p2.age
    CREATE (p1)-[:ELDRE_ENN]->(p2);

        // Alle med eldreenn-relasjoner
        MATCH (n)-[r:ELDRE_ENN]->(m)
        RETURN n,collect(m);

        //Alle som er yngre enn Brita
        MATCH (n{name:"Brita"})-[r:ELDRE_ENN]->(m)
        RETURN m.name,m.age;



    //"Sønn av"/"Datter av"
    MATCH (p1:Person)-[:BARN_AV]->(p2:Person)
    WHERE p1.sex='male'
    CREATE (p1)-[:SØNN_AV]->(p2);

        //Farslinjene
        MATCH p=(n)-[r:SØNN_AV*]->(m{sex:'male'})
        RETURN extract(node IN nodes(p) | node.name)