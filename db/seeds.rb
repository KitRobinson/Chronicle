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


	#new Associable method should be applicable to terrains

# terrain_assocs = Association.create([
# 	{domain: dom_trees, associable: ter_forest, associable_type:"Terrain", strength: 9},
# 	{domain: dom_trees, associable: ter_swamp, associable_type:"Terrain", strength: 2},

# 	{domain: dom_birds, associable: ter_forest, associable_type:"Terrain", strength: 3},
# 	{domain: dom_birds, associable: ter_mountain, associable_type:"Terrain", strength: 2},

# 	{domain: dom_wind, associable: ter_plains, associable_type:"Terrain", strength: 3},
# 	{domain: dom_wind, associable: ter_mountain, associable_type:"Terrain", strength: 2},
# 	{domain: dom_wind, associable: ter_ocean, associable_type:"Terrain", strength: 2},
# 	{domain: dom_wind, associable: ter_city, associable_type:"Terrain", strength: 1},
# 	{domain: dom_wind, associable: ter_swamp, associable_type:"Terrain", strength: 1},
# 	{domain: dom_wind, associable: ter_forest, associable_type:"Terrain", strength: 1},

# 	{domain: dom_smithing, associable: ter_mountain, associable_type:"Terrain",strength: 2},
# 	{domain: dom_smithing, associable: ter_city, associable_type:"Terrain",strength:7},

# 	{domain: dom_justice, associable: ter_city, associable_type:"Terrain",strength:3},
# 	{domain: dom_music, associable: ter_city, associable_type:"Terrain",strength:3}
# ])

ter_forest.associate({"Trees" => 9, "Birds" => 3, "Wind" => 1})
ter_mountain.associate({"Birds" => 2, "Wind" => 2, "Smithing" => 2})
ter_plains.associate({"Wind" => 3})
ter_city.associate({"Wind" => 1})
ter_city.associate({"Smithing" => 7})
ter_city.associate({"Justice" => 3, "Music" => 3})
ter_ocean.associate({"Wind" => 2})
ter_swamp.associate({"Trees" => 2, "Wind" => 1})

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
race_elf = Race.create(name:"Elf", description:"Elves spend their long lives in harmony with nature", longevity: 5, fecundity: 2, might: 3, will: 4, cunning: 3, subtlety: 3, perception: 3, sagacity: 3, scale: 1)
race_wyvern = Race.create(name:"Wyveryn", description:"Great winged reptiles with innate arcane talent, and an ancient language", longevity: 4, fecundity: 1, might: 5, will: 5, cunning: 3, subtlety: 2, perception: 3, sagacity: 4, scale: 3)
race_monster = Race.create(name:"Monster", description:"A catch all term for great beasts", longevity: 3, fecundity: 3, might: 3, will: 3, cunning: 3, subtlety: 3, sagacity: 3, scale: 3)
race_titan = Race.create(name:"Titan", description: "A catch all term for VERY great beings", longevity: 3, fecundity: 3, might: 3, will: 3, cunning: 3, subtlety: 3, sagacity: 3, scale: 5)

act_manwe = Actor.create(name:"Manwe", description:"Manwe is god of air and birds", race: race_alom, might: 4, will: 3, cunning: 2, subtlety: 3, perception: 5, sagacity: 3, count: 1, personality: "Player", mood:"Player")
act_aule = Actor.create(name:"Aule", description:"Aule is the just god of smiths", race: race_alom, might: 6, will: 5, cunning: 2, subtlety: 1, perception:4, sagacity: 3, count: 1, personality:"Player", mood:"Player")
act_yavanna = Actor.create(name:"Yavanna", description:"Yavanna is the goddess of trees and music", race: race_alom, might: 3, will: 2, subtlety: 5, perception: 4, cunning: 4, sagacity: 3, count: 1, personality:"Player", mood:"Player")

god_manwe = Deity.create(name:"Manwe", description:"Manwe is god of air and birds", actor: act_manwe)
god_aule = Deity.create(name:"Aule", description:"Aule is the just god of smiths", actor: act_aule)
god_yavanna = Deity.create(name:"Yavanna", description:"Yavanna is the goddess of trees and music", actor: act_yavanna)

god_manwe.associate({"Wind" => 40, "Birds" => 40})
god_aule.associate({"Justice" => 40, "Smithing" => 40})
god_yavanna.associate({"Trees" => 40, "Music" => 40})

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

	if prov.get_development > 0.5
		if rand(4) == 3
			gen_race = race_human
			alt_race = race_goblin
		else
			gen_race = race_goblin
			alt_race = race_human
		end

		p = Population.create(province: prov, race: gen_race, piety: rand, count: rand(5000)+2000, loyalty:rand(5))
		gods = [god_manwe, god_yavanna, god_aule]
		gods.shuffle!
		(rand(2)+1).times do  
			size = rand
			Congregation.create(population: p, deity:gods.pop, clergy:(size*p.count/100).floor, laity: ((size*10 + rand(9) + 1)*p.count/100).floor, piety_multiplier: 1, manpower_multiplier:1, loyalty: rand(5)+1)
		end

		if rand(4) == 3
			p = Population.create(province: prov, race: alt_race, piety: rand, count: rand(2500)+2000, loyalty:rand(5))
			gods = [god_manwe, god_yavanna, god_aule]
			gods.shuffle!
			(rand(2)+1).times do  
				size = rand
				Congregation.create(population: p, deity:gods.pop, clergy:(size*p.count/100).floor, laity: ((size*10 + rand(9) + 1)*p.count/100).floor, piety_multiplier: 1, manpower_multiplier:1, loyalty: rand(5)+1)
			end
		end

	end

end

org_united_goblin_tribes = Organization.create(name:"United Goblin Tribes", description:"A loose federation of free goblin tribes", is_church:0, is_kingdom:1, leader:act_globrat, governance:"Tribal Federation")
org_kingdom_of_wessex = Organization.create(name:"Kingdom of Wessex", description:"A mostly United England", is_church:0, is_kingdom:1, leader: act_eckbert, governance:"Monarchy")
org_dukedom_of_ireland = Organization.create(name:"Duchy of Ireland", description:"Free Irish Provinces", is_church:0, is_kingdom:1, leader:act_macdougal, governance:"Monarchy")
org_church_of_aule = Organization.create(name:"The Church of Aule", description:"A church dedicated to smiths and justice", is_church:1, is_kingdom:0, governance:"Council of Elders")
org_church_of_yevenna = Organization.create(name:"The Church of Yevenna", description:"A church dedicated to music and trees", is_church:1, is_kingdom:0, governance:"Council of Elders")
org_bardic_college = Organization.create(name:"The Fellowship", description:"A guild of talented musicians", is_church:0, is_kingdom:0, suzerain:org_church_of_yevenna, governance:"Council of Elders")

org_kingdom_of_wessex.spread(pro_ulster)
org_kingdom_of_wessex.spread(pro_ulster)
org_dukedom_of_ireland.spread_region(reg_west_ireland)
org_united_goblin_tribes.spread(pro_leinster)
org_united_goblin_tribes.spread(pro_kildare)

org_church_of_aule.spread(Congregation.where(deity: god_aule).order(clergy: :desc).first.population.province)
org_church_of_aule.spread(Congregation.where(deity: god_aule).order(clergy: :desc).second.population.province)

user_kit = User.create(username:"Kit", email:"krobinson.dev@gmail.com", password:"password", access:3)
user_linas = User.create(username:"Linas", email:"linas@gmail.com", password:"password", access:1)

post_hail = Post.create(user:user_kit, title:"Hail!", content:"Welcome to the game!")
post_wellmet = Post.create(user:user_linas, title: "Well Met!", content: "pleased to be here!", reference: post_hail)

message_hail = Message.create(user:user_kit, title:"Hail!", content:"Welcome to the game!")
message_wellmet = Message.create(user:user_linas, title: "Well Met!", content: "pleased to be here!", reference: message_hail)

recip_hail = Recipient.create(message:message_hail, user:user_kit)
recip_wellmet = Recipient.create(message:message_wellmet, user:user_kit)

god_manwe.update(user: user_kit)
god_aule.update(user:user_kit)
god_yavanna.update(user:user_linas)

p_thebirds = Power.create(name:"The Birds", effect:"Birds attack everybody!", deity: god_manwe)
p_thebirds.associate({"Birds" => 6})
p_test_of_iron = Power.create(name:"The Test of Iron", effect:"Priests of Aule can tell truth or falsehood with burning iron", deity: god_aule)
p_test_of_iron.associate({"Smithing" => 4, "Justice" => 5})