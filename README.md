## Firedeaths app

### Getting Started...

* Clone this repo

* Make a database and a user:


```
create database firedeaths\_development;
create user 'firedeaths'@'localhost' identified by 'firedeaths';
grant all privileges on firedeaths\_development.* to 'firedeaths'@'localhost';
```

* Run some Rake Tasks:

```
rake db:migrate db:seed generate:deaths
```

Back to the database to generate lots of deaths (you can run this command a bunch).   The distance.sql
populates the base\_id column of the deaths table

```
insert into deaths (user\_id, base\_id, death\_reason\_id, weapon\_id,
                    death\_game\_lat, death\_game\_lon, death\_day, death\_time,
                    created\_at, updated\_at)
select             user\_id, base\_id, death\_reason\_id, weapon\_id,
                   death\_game\_lat, death\_game\_lon, death\_day, death\_time,
                   created\_at, updated\_at from deaths;
...

source doc/distance.sql
```

Now fire up the server and check out the distribution of deaths

