update deaths, (
select d.id,
       group_concat(b.id order by SQRT(POW((b.game_lat - d.death_game_lat),2) + POW((b.game_lon - d.death_game_lon),2))) close_bases
from bases b,
     deaths d
where d.base_id is null
group by d.id
) as new_deaths
set base_id = substring_index(close_bases,',',1)
where deaths.id = new_deaths.id
