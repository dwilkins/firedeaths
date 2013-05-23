select d.id,
       group_concat(b.id order by SQRT(POW((b.game_lat - d.death_game_lat),2) + POW((b.game_lon - d.death_game_lon),2))) close_bases
from bases b,
     deaths d
where d.base_id is null
group by d.id
limit 10
