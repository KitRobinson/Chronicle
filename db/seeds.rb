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

