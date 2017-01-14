# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dom_trees = Domain.create(name: "Trees")
dom_music = Domain.create(name: "Music")
dom_wind = Domain.create(name: "Wind")
dom_justice = Domain.create(name: "Justice")
dom_birds = Domain.create(name: "Birds")
dom_smithing = Domain.create(name: "Smithing")

ter_forest = Terrain.create(name: "Forest", development_multiplier: 1, difficulty: 3, water: 1)
ter_mountain = Terrain.create(name: "Mountain", development_multiplier: 0.5, difficulty: 5, water: 1)
ter_plains = Terrain.create(name: "Plains", development_multiplier: 1.5, difficulty: 1, water: 1)
ter_city = Terrain.create(name: "City", development_multiplier: 2, difficulty: 1, water: 1)
ter_ocean = Terrain.create(name: "Ocean", development_multiplier: 0, difficulty: 2, water: 3)
ter_swamp = Terrain.create(name: "Swamp", development_multiplier: 0.5, difficulty: 4, water: 2)

land_terrains = [ter_forest, ter_mountain, ter_plains, ter_city, ter_swamp]
ocean_terrain = [ter_ocean, ter_ocean, ter_ocean, ter_forest, ter_plains, ter_swamp, ter_city, ter_mountain]

terrain_assocs = Association.create([
	{domain: dom_trees, associable: ter_forest, associable_type:"Terrain", strength: 9},
	{domain: dom_trees, associable: ter_swamp, associable_type:"Terrain", strength: 2},

	{domain: dom_birds, associable: ter_forest, associable_type:"Terrain", strength: 3},
	{domain: dom_birds, associable: ter_mountain, associable_type:"Terrain", strength: 2},

	{domain: dom_wind, associable: ter_plains, associable_type:"Terrain", strength: 3},
	{domain: dom_wind, associable: ter_mountain, associable_type:"Terrain", strength: 2},
	{domain: dom_wind, associable: ter_ocean, associable_type:"Terrain", strength: 2},
	{domain: dom_wind, associable: ter_city, associable_type:"Terrain", strength: 1},
	{domain: dom_wind, associable: ter_swamp, associable_type:"Terrain", strength: 1},
	{domain: dom_wind, associable: ter_forest, associable_type:"Terrain", strength: 1},

	{domain: dom_smithing, associable: ter_mountain, associable_type:"Terrain",strength: 2},
	{domain: dom_smithing, associable: ter_city, associable_type:"Terrain",strength:7},

	{domain: dom_justice, associable: ter_city, associable_type:"Terrain",strength:3},
	{domain: dom_music, associable: ter_city, associable_type:"Terrain",strength:3}
])

reg_west_ireland = Region.create(name:"Western Ireland", description:"Western Ireland is suprisingly full of complex terrain")
reg_east_ireland = Region.create(name:"Eastern Ireland", description:"Eastern Ireland is somewhat random!")

pro_ulster = Province.create(name:"Ulster", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_east_ireland)
pro_pale = Province.create(name:"Pale", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_east_ireland)
pro_leinster = Province.create(name:"Leinster", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_east_ireland)
pro_kildare = Province.create(name:"Kildare", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_east_ireland)

pro_tyrone = Province.create(name:"Tyrone", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_west_ireland)
pro_sligo = Province.create(name:"Sligo", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_west_ireland)
pro_connaught = Province.create(name:"Connaught", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_west_ireland)
pro_limerick = Province.create(name:"Limerick", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_west_ireland)
pro_cork = Province.create(name:"Cork", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_west_ireland)

pro_irish_sea = Province.create(name:"Irish Sea", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:ter_ocean,secondary_terrain:ocean_terrain.sample, region:reg_east_ireland)
pro_donegal_sea = Province.create(name:"Donegal Bay", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:ter_ocean,secondary_terrain:ocean_terrain.sample, region:reg_west_ireland)
pro_dingle_sea = Province.create(name:"Dingle Bay", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:ter_ocean,secondary_terrain:ocean_terrain.sample, region:reg_west_ireland)

Border.create([
	{province: pro_ulster, neighbor: pro_irish_sea},
	{province: pro_ulster, neighbor: pro_pale},
	{province: pro_ulster, neighbor: pro_tyrone},
	{province: pro_pale, neighbor: pro_irish_sea},
	{province: pro_pale, neighbor: pro_leinster},
	{province: pro_pale, neighbor: pro_kildare},
	{province: pro_pale, neighbor: pro_tyrone},
	{province: pro_leinster, neighbor: pro_irish_sea},
	{province: pro_leinster, neighbor: pro_kildare},
	{province: pro_leinster, neighbor: pro_cork},
	{province: pro_cork, neighbor: pro_dingle_sea},
	{province: pro_cork, neighbor: pro_kildare},
	{province: pro_cork, neighbor: pro_limerick},
	{province: pro_limerick, neighbor: pro_dingle_sea},
	{province: pro_limerick, neighbor: pro_connaught},
	{province: pro_limerick, neighbor: pro_sligo},
	{province: pro_connaught, neighbor: pro_dingle_sea},
	{province: pro_connaught, neighbor: pro_donegal_sea},
	{province: pro_connaught, neighbor: pro_sligo},
	{province: pro_sligo, neighbor: pro_kildare},
	{province: pro_sligo, neighbor: pro_tyrone},
	{province: pro_sligo, neighbor: pro_donegal_sea},
	{province: pro_tyrone, neighbor: pro_donegal_sea},
	{province: pro_tyrone, neighbor: pro_irish_sea},
	{province: pro_tyrone, neighbor: pro_kildare},
	{province: pro_irish_sea, neighbor: pro_donegal_sea},
	{province: pro_irish_sea, neighbor: pro_dingle_sea},
	{province: pro_dingle_sea, neighbor: pro_donegal_sea}
])

race_alom = Race.create(name:"Alom", description:"The Alom are the first and greatest of the children of Om, the Gods!", longevity:1000,fecundity:0,might:0,will:0,cunning:0,subtlety:0,perception:0,sagacity:0,scale:10)
race_human = Race.create(name:"Human", description:"Humans are dull and normal", longevity:3, fecundity: 3, might: 3, will: 3, cunning: 3, subtlety: 3, perception: 3, sagacity: 3, scale: 1)
race_goblin = Race.create(name:"Goblin", description:"Goblins are weak, sneaky, and evil", longevity:2, fecundity: 4, might: 2, will: 2, cunning: 4, subtlety: 4, perception: 3, sagacity: 2, scale: 1)

act_manwe = Actor.create(name:"Manwe", description:"Manwe is god of air and birds", race: race_alom, might: 4, will: 3, cunning: 2, subtlety: 3, perception: 5, sagacity: 3, count: 1, personality: "Player", mood:"Player")
act_aule = Actor.create(name:"Aule", description:"Aule is the just god of smiths", race: race_alom, might: 6, will: 5, cunning: 2, subtlety: 1, perception:4, sagacity: 3, count: 1, personality:"Player", mood:"Player")
act_yavanna = Actor.create(name:"Yavanna", description:"Yavanna is the goddess of trees and music", race: race_alom, might: 3, will: 2, subtlety: 5, perception: 4, cunning: 4, sagacity: 3, count: 1, personality:"Player", mood:"Player")

god_manwe = Deity.create(name:"Manwe", description:"Manwe is god of air and birds", actor: act_manwe)
god_aule = Deity.create(name:"Aule", description:"Aule is the just god of smiths", actor: act_aule)
god_yavanna = Deity.create(name:"Yavanna", description:"Yavanna is the goddess of trees and music", actor: act_yavanna)

act_eckbert = Actor.create(name:"Eckbert", description:"Eckbert is king of wessex, and owns part of ireland as well", race: race_human, might:0, will: 2, subtlety:2, perception: 2, sagacity: 2, cunning:2, count: 1, personality:"Subtle", mood:"Administer")
act_macdougal = Actor.create(name:"MacDougal", description:"Leader of the west irish clans", race: race_human, might: 2, subtlety: 0, perception: 1, will: 1, sagacity:0, cunning: 1, count: 1, personality: "Mighty", mood:"Conquer")
act_globrat = Actor.create(name:"Globrat the Terrible", description:"A giant among his people, Globrat rules the last of the irish goblin hodlouts", race: race_goblin, might: 3, subtlety: 0, perception: 1, will: 1, sagacity:0, cunning: 0, count: 1, personality:"Mighty", mood:"Defend")

act_army_of_ireland = Actor.create(name:"Army of Ireland", description:"An army raised for the conquest of... whom?", race: race_human, might: 0, subtlety: 0, cunning: 0, sagacity: 0, perception: 0, will: 0, count: 1000, personality:"Obedient", mood:"Obedient")

art_sword_of_celts = Artifact.create(name:"The Sword of Celts", description:"An ancient sword, imbued with power by ancient druids", owner:act_macdougal)
art_orb_of_secrets = Artifact.create(name:"The Orb of Secrets", description:"The orb of secrets gives simple answers to a question once a year", owner:act_eckbert)
art_doom_altar = Artifact.create(name:"The Altar of Doom", description: "Sacrifices made upon this altar are exra effective", province_id: 5)

act_eckbert.associate({"Justice" => 2})
art_sword_of_celts.associate({"Smithing" => 2})

Province.all.each do |prov|
	if rand(4) == 4
		gen_race = race_human
		alt_race = race_goblin
	else
		gen_race = race_goblin
		alt_race = race_human
	end

	p = Population.create(province: prov, race: gen_race, piety: rand, count: rand(5000)+2000, loyalty=rand(5))
	gods = [god_manwe, god_yavanna, god_aule]
	gods.shuffle!
	(rand(2)+1).times do { 
		size = rand
		Congregation.create(population: p, deity:gods.pop, clergy:(size*p.count/100).floor, laity: ((size*10 + rand(9) + 1)*p.count).floor, piety_multiplier: 1, manpower_multiplier:1, loyalty: rand(5)+1)
	 }	