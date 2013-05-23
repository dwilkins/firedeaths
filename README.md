== Firedeaths app

Getting Started...

Clone this repo

Make a database and a user:


```
create database firedeaths_development;
create user 'firedeaths'@'localhost' identified by 'firedeaths';
grant all privileges on firedeaths_development.* to 'firedeaths'@'localhost';
```

Run some Rake Tasks:

```
rake db:migrate db:seed generate:deaths
```

Back to the database to generate lots of deaths (you can run this command a bunch).   The distance.sql
populates the base_id column of the deaths table

```
insert into deaths (user_id, base_id, death_reason_id, weapon_id, death_game_lat, death_game_lon, death_day, death_time, created_at, updated_at) select user_id, base_id, death_reason_id, weapon_id, death_game_lat, death_game_lon, death_day, death_time, created_at, updated_at from deaths;
...

source doc/distance.sql
```

Now fire up the server and check out the distribution of deaths

