# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Weapon.create([{ :name => "Rifle"},
               { :name => "Shotgun"},
               { :name => "Lazer"},
               { :name => "Box Cutter"},
               { :name => "Ink Pen"},
               { :name => "Stapler"},
               { :name => "Red Stapler"},
               { :name => "Belt Sander"},
               { :name => "Block of Wood"},
               { :name => "Bazooka"},
               { :name => "Other"}])

DeathReason.create([{name: "Ambush"},
                    {name: "Caught Out"},
                    {name: "Suicide"},
                    {name: "Friendly Fire"},
                    {name: "Stupidity"}])


Base.create([{game_lat: 600, game_lon: 1788, name: "Base 1" },
             {game_lat: 636, game_lon: 2108, name: "Base 2" },
             {game_lat: 824, game_lon: 1668, name: "Base 3" },
             {game_lat: 688, game_lon: 1532, name: "Base 4" },
             {game_lat: 400, game_lon: 1380, name: "Base 5" },
             {game_lat: 532, game_lon: 1204, name: "Base 6" },
             {game_lat: 788, game_lon: 1224, name: "Base 7" },
             {game_lat: 1024, game_lon: 1188, name: "Base 8" },
             {game_lat: 1204, game_lon: 1528, name: "Base 9" },
             {game_lat: 1168, game_lon: 1804, name: "Base 10" },
             {game_lat: 1908, game_lon: 2028, name: "Base 11" },
             {game_lat: 1652, game_lon: 2000, name: "Base 12" },
             {game_lat: 2376, game_lon: 1896, name: "Base 13" },
             {game_lat: 2700, game_lon: 1796, name: "Base 14" },
             {game_lat: 2960, game_lon: 1768, name: "Base 15" },
             {game_lat: 3328, game_lon: 1856, name: "Base 16" },
             {game_lat: 3600, game_lon: 1848, name: "Base 17" },
             {game_lat: 3852, game_lon: 1616, name: "Base 18" },
             {game_lat: 3904, game_lon: 1360, name: "Base 19" },
             {game_lat: 3908, game_lon: 1044, name: "Base 20" },
             {game_lat: 3624, game_lon: 872, name: "Base 21" },
             {game_lat: 3348, game_lon: 664, name: "Base 22" },
             {game_lat: 2908, game_lon: 528, name: "Base 23" },
             {game_lat: 2524, game_lon: 556, name: "Base 24" },
             {game_lat: 2216, game_lon: 632, name: "Base 25" },
             {game_lat: 1860, game_lon: 684, name: "Base 26" },
             {game_lat: 1580, game_lon: 816, name: "Base 27" },
             {game_lat: 1412, game_lon: 1072, name: "Base 28" },
             {game_lat: 1576, game_lon: 1308, name: "Base 29" },
             {game_lat: 1804, game_lon: 1196, name: "Base 30" },
             {game_lat: 2032, game_lon: 1104, name: "Base 31" },
             {game_lat: 2296, game_lon: 1136, name: "Base 32" },
             {game_lat: 2528, game_lon: 1048, name: "Base 33" },
             {game_lat: 2632, game_lon: 1324, name: "Base 34" },
             {game_lat: 2864, game_lon: 1480, name: "Base 35" },
             {game_lat: 3056, game_lon: 1328, name: "Base 36" },
             {game_lat: 3444, game_lon: 1556, name: "Base 37" },
             {game_lat: 3548, game_lon: 1396, name: "Base 38" }])
