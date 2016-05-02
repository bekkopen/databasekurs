# Redis

Redis er en veldig populær key/value-store, eller **data structures server** 
som de sier selv. Key/value-databaser lagrer typisk verdier på en nøkkel 
hvor verdien kan ha mange forskjellige typer. Det er vanlig at det 
ikke lar seg gjøre å spørre på verdier i en key/value-database 
og det kan være nyttig å tenke seg at det ikke er mulig, selv om 
det er mulig med Redis. Det viktigste for en Key/value-database 
er hastighet. De er da  også stort sett uhyre raske og brukes derfor 
ofte som en cache eller i arkitekturpatterns som pub/sub eller 
message broker. Redis for mye av sin enorme hastighet gjennom 
å kjøre i minnet samt å kunne kjøre i cluster for tilgjengelighet.