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

