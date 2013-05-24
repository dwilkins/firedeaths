# -*- coding: utf-8 -*-.
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


Base.create([{game_lat: 600, game_lon: 1788, name: "関東軍 Kantōgun" },
             {game_lat: 636, game_lon: 2108, name: "支那派遣軍 Shina hakengun" },
             {game_lat: 824, game_lon: 1668, name: "南方軍 Nampōgun" },
             {game_lat: 688, game_lon: 1532, name: "防衛総司令部 Bōei Sōshireibu" },
             {game_lat: 400, game_lon: 1380, name: "第1総軍 Dai-ichi Sōgun" },
             {game_lat: 532, game_lon: 1204, name: "(第2総軍 Dai-ni Sōgun" },
             {game_lat: 788, game_lon: 1224, name: " 航空総軍 Kōkū Sōgun" },
             {game_lat: 1024, game_lon: 1188, name: "第1方面軍 Dai ichi hōmen gun" },
             {game_lat: 1204, game_lon: 1528, name: "第3方面軍 Dai san hōmen gun" },
             {game_lat: 1168, game_lon: 1804, name: "第5方面軍 Dai go hōmen gun" },
             {game_lat: 1908, game_lon: 2028, name: "第6方面軍 Dai roku hōmen gun" },
             {game_lat: 1652, game_lon: 2000, name: "(上海派遣軍 Shanhai Haken gun" },
             {game_lat: 2376, game_lon: 1896, name: "中部軍 Chubu gun" },
             {game_lat: 2700, game_lon: 1796, name: "西部軍 Seibu gun" },
             {game_lat: 2960, game_lon: 1768, name: "東部軍 Tobu gun" },
             {game_lat: 3328, game_lon: 1856, name: " 北部軍 Hokubu gun" },
             {game_lat: 3600, game_lon: 1848, name: "南支那方面軍 Minami-Shina hōmen gun" },
             {game_lat: 3852, game_lon: 1616, name: "北支那方面軍 Kita-Shina hōmen gun" },
             {game_lat: 3904, game_lon: 1360, name: "中支那方面軍 Naka-Shina hōmen gun" },
             {game_lat: 3908, game_lon: 1044, name: " 緬甸方面軍 Biruma hōmen gun" },
             {game_lat: 3624, game_lon: 872, name: " 第18方面軍 Dai jyū hachi hōmen gun" },
             {game_lat: 3348, game_lon: 664, name: "第17方面軍 Dai jyū nana hōmen gun" },
             {game_lat: 2908, game_lon: 528, name: "第16方面軍 Dai jyū roku hōmen gun" },
             {game_lat: 2524, game_lon: 556, name: "第15方面軍 Dai jyū go hōmen gun" },
             {game_lat: 2216, game_lon: 632, name: "第13方面軍 Dai jyū san hōmen gun" },
             {game_lat: 1860, game_lon: 684, name: "第12方面軍 Dai jyū ni hōmen gun" },
             {game_lat: 1580, game_lon: 816, name: "第11方面軍 Dai jyū ichi hōmen gun" },
             {game_lat: 1412, game_lon: 1072, name: "第10方面軍 Dai jyū hōmen gun" },
             {game_lat: 1576, game_lon: 1308, name: "第8方面軍 Dai hachi hōmen gun" },
             {game_lat: 1804, game_lon: 1196, name: "第7方面軍 Dai nana hōmen gun" },
             {game_lat: 2032, game_lon: 1104, name: "名古屋市 Nagoya-shi" },
             {game_lat: 2296, game_lon: 1136, name: "豊橋市 Toyohashi-shi" },
             {game_lat: 2528, game_lon: 1048, name: "岡崎市 Okazaki-shi" },
             {game_lat: 2632, game_lon: 1324, name: "一宮市 Ichinomiya-shi" },
             {game_lat: 2864, game_lon: 1480, name: "瀬戸市 Seto-shi" },
             {game_lat: 3056, game_lon: 1328, name: "半田市 Handa-shi" },
             {game_lat: 3444, game_lon: 1556, name: "春日井市 Kasugai-shi" },
             {game_lat: 3548, game_lon: 1396, name: "豊川市 Toyokawa-shi" }])
