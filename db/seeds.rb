# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#---------------------------------------------
# 		   SEEDS FOR DOMAINS

#phase 0 domains
Domain.where(name: 'OhmSight').first_or_create(name: 'OhmSight')

#phase 1 domains
Domain.where(name: 'Echoes').first_or_create(name: 'Echoes')
Domain.where(name: 'Cold').first_or_create(name: 'Cold')
Domain.where(name: 'North Wind').first_or_create(name: 'North Wind')
Domain.where(name: 'Stars').first_or_create(name: 'Stars')
Domain.where(name: 'Magic').first_or_create(name: 'Magic')
Domain.where(name: 'Volcanoes').first_or_create(name: 'Volcanoes')
Domain.where(name: 'Dirt').first_or_create(name: 'Dirt')
Domain.where(name: 'Horizons').first_or_create(name: 'Horizons')
Domain.where(name: 'Darkness').first_or_create(name: 'Darkness')
Domain.where(name: 'Continuity').first_or_create(name: 'Continuity')
Domain.where(name: 'Wind').first_or_create(name: 'Wind')
Domain.where(name: 'Storms').first_or_create(name: 'Storms')
Domain.where(name: 'Contradictions').first_or_create(name: 'Contradictions')
Domain.where(name: 'Duality').first_or_create(name: 'Duality')
Domain.where(name: 'Fire').first_or_create(name: 'Fire')

# phase 2 domains
Domain.where(name: 'Renewal').first_or_create(name:'Renewal')
Domain.where(name: 'Family').first_or_create(name: 'Family')
Domain.where(name: 'Determination').first_or_create(name: 'Determination')
Domain.where(name: 'Bindings').first_or_create(name: 'Bindings')
Domain.where(name: 'Fungus').first_or_create(name: 'Fungus')
Domain.where(name: 'Nature').first_or_create(name: 'Nature')
Domain.where(name: 'Naïveté').first_or_create(name: 'Naïveté')
Domain.where(name: 'Mythical Beasts').first_or_create(name: 'Mythical Beasts')
Domain.where(name: 'Dragons').first_or_create(name: 'Dragons')
Domain.where(name: 'Love').first_or_create(name: 'Love')
Domain.where(name: 'Heritage').first_or_create(name: 'Heritage')
Domain.where(name: 'Brilliance').first_or_create(name: 'Brilliance')
Domain.where(name: 'Memory').first_or_create(name: 'Memory')
Domain.where(name: 'Avians').first_or_create(name: 'Avians')
Domain.where(name: 'Life').first_or_create(name: 'Life')
Domain.where(name: 'Arctic Beasts').first_or_create(name: 'Arctic Beasts')
Domain.where(name: 'Undead').first_or_create(name: 'Undead')
Domain.where(name: 'Protection of the Dead').first_or_create(name: 'Protection of the Dead')
Domain.where(name: 'Fertility').first_or_create(name: 'Fertility')
#phase 3 domains:

#Domain.where(name: 'Curiosity').first_or_create(name: "Curiosity")

Domain.where(name: 'Language').first_or_create(name: "Language")
Domain.where(name: 'War').first_or_create(name: "War")
Domain.where(name: 'Trade').first_or_create(name: "Trade")
Domain.where(name: 'Engineering').first_or_create(name: "Engineering")
Domain.where(name: 'Adventure').first_or_create(name: "Adventure")
Domain.where(name: 'Poverty').first_or_create(name: "Poverty")
Domain.where(name: 'Prosperity').first_or_create(name: "Prosperity")
Domain.where(name: 'Moderation').first_or_create(name: "Moderation")
Domain.where(name: 'Wine').first_or_create(name: "Wine")
Domain.where(name: 'Poetry').first_or_create(name: "Poetry")
Domain.where(name: 'Building').first_or_create(name: "Building")
Domain.where(name: 'Jealousy').first_or_create(name: "Jealousy")
Domain.where(name: 'Nationalism').first_or_create(name: "Nationalism")
Domain.where(name: 'Wit').first_or_create(name: "Wit")




#---------------------------------------------
#          SEEDS FOR PROVINCES

#first, just a whole slew of provinces with temp names
for i in 1..125
	temp_name = "province #{i}"
	Province.where(id: i).first_or_create(name: temp_name)
end

puts "I made provinces!"
# ---------------------------------------------
# 		   SEEDS FOR TERRAINS

# ter_forest = Terrain.create(name: "Forest", development_multiplier: 1, difficulty: 3, water: 1)
Terrain.where(name: "Ocean").first_or_create(name: "Ocean", development_multiplier: 0.8, difficulty: 1, water: 4)
Terrain.where(name: "River").first_or_create(name: "River", development_multiplier: 1.2, difficulty: 1, water: 1)

#this is to be used where Coast is a major terrain - we will define a 'coastal' virtual attribute on the province model for just picking water proximity
Terrain.where(name: "Coast").first_or_create(name: "Coast", development_multiplier: 1.0, difficulty: 1, water: 2)
Terrain.where(name: "Freshwater Sea").first_or_create(name: "Freshwater Sea", development_multiplier: 1.2, difficulty: 1, water: 4)
Terrain.where(name: "Lake").first_or_create(name: "Lake", development_multiplier: 0.8, difficulty: 1, water: 1)
Terrain.where(name: "Glacier").first_or_create(name: "Glacier", development_multiplier: 0.3, difficulty: 3, water: 0)
Terrain.where(name: "Dirt").first_or_create(name: "Dirt", development_multiplier: 1, difficulty: 1, water: 0)
Terrain.where(name: "Desert").first_or_create(name: "Desert", development_multiplier: 0.7, difficulty: 2, water: 0)
Terrain.where(name: "Rocky").first_or_create(name: "Rocky", development_multiplier: 0.8, difficulty: 1, water: 0)
Terrain.where(name: "Mud").first_or_create(name: "Mud", development_multiplier: 0.9, difficulty: 1, water: 1)
Terrain.where(name: "Hills").first_or_create(name: "Hills", development_multiplier: 0.9, difficulty: 2, water: 0)
Terrain.where(name: "Mountains").first_or_create(name: "Mountains", development_multiplier: 0.6, difficulty: 3, water: 0)
Terrain.where(name: "Protean").first_or_create(name: "Protean", development_multiplier: 1.0, difficulty: 1, water: 1)
Terrain.where(name: "slliH").first_or_create(name: "slliH", development_multiplier: 1.1, difficulty: 2, water: 0)
Terrain.where(name: "sniatnuoM").first_or_create(name: "sniatnuoM", development_multiplier: 1.1, difficulty: 3, water: 0)
Terrain.where(name: "Plateau").first_or_create(name: "Plateau", development_multiplier: 1.0, difficulty: 2, water: 0)
Terrain.where(name: "Wind Carved Mesa").first_or_create(name: "Wind Carved Mesa", development_multiplier:1.2, difficulty: 2, water: 0)
Terrain.where(name: "Mountain Pass").first_or_create(name: "Mountain Pass", development_multiplier: 0.6, difficulty: 0, water: 0)
# bio terrains for phase 2
Terrain.where(name: "Woodland").first_or_create(name: "Woodland", development_multiplier: 0.9, difficulty: 1, water: 0)
Terrain.where(name: "Elysian").first_or_create(name: "Elysian", development_multiplier: 1.4, difficulty: 1, water: 0)
Terrain.where(name: "Grassland").first_or_create(name: "Grassland", development_multiplier: 1.2, difficulty: 1, water: 0)
Terrain.where(name: "Marsh").first_or_create(name: "Marsh", development_multiplier: 0.8, difficulty: 2, water: 1)
Terrain.where(name: "Shrubland").first_or_create(name: "Shrubland", development_multiplier: 1.0, difficulty: 1, water: 0)
Terrain.where(name: "Plains").first_or_create(name: "Plains", development_multiplier:1.1, difficulty:1,water:0)
Terrain.where(name: "Tundra").first_or_create(name: "Tundra", development_multiplier:0.7, difficulty:1,water:0)
Terrain.where(name: "Forest").first_or_create(name: "Forest", development_multiplier:1.0, difficulty:2,water:0)

#---------------------------------------
#          SEEDS FOR RACES

Race.where(name: "Alohm").first_or_create(name:"Alohm", description:"The Alohm are the first and greatest of the children of Om, the Gods!", longevity:1000,fecundity:0,might:0,will:0,cunning:0,subtlety:0,perception:0,sagacity:0,scale:10)
Race.where(name: "Human").first_or_create(name:"Human", description:"Humans are dull and normal", longevity:3, fecundity: 3, might: 3, will: 3, cunning: 3, subtlety: 3, perception: 3, sagacity: 3, scale: 1)
Race.where(name: "Goblin").first_or_create(name:"Goblin", description:"Goblins are weak, sneaky, and fecund", longevity:2, fecundity: 4, might: 2, will: 2, cunning: 4, subtlety: 4, perception: 3, sagacity: 2, scale: 1)
Race.where(name: "Elf").first_or_create(name:"Elf", description:"Elves spend their long lives in harmony with nature", longevity: 5, fecundity: 2, might: 3, will: 4, cunning: 3, subtlety: 3, perception: 3, sagacity: 3, scale: 1)
Race.where(name: "Snow-Elf").first_or_create(name:"Snow-Elf", description:"Snow Elves are like elves, but snowy", longevity: 6, fecundity: 0, might: 4, will: 4, cunning: 3, subtlety: 3, perception: 3, sagacity: 3, scale: 1)
Race.where(name: "Wyveryn").first_or_create(name:"Wyveryn", description:"Great winged reptiles with innate arcane talent, and an ancient language", longevity: 4, fecundity: 1, might: 5, will: 5, cunning: 3, subtlety: 2, perception: 3, sagacity: 4, scale: 3)
Race.where(name: "Monster").first_or_create(name:"Monster", description:"A catch all term for great beasts", longevity: 3, fecundity: 3, might: 3, will: 3, cunning: 3, subtlety: 3, sagacity: 3, scale: 3)
Race.where(name: "Titan").first_or_create(name:"Titan", description: "A catch all term for VERY great beings", longevity: 3, fecundity: 3, might: 3, will: 3, cunning: 3, subtlety: 3, sagacity: 3, scale: 5)
Race.where(name: "Generic").first_or_create(name:"Generic", description: "If you see this, let Chris know, it means something is broken!", longevity:3, fecundity: 3, might: 3, will: 3, cunning: 3, subtlety: 3, perception: 3, sagacity: 3, scale: 1)
Race.where(name: "Undead").first_or_create(name:"Undead", description:"Brrraaains", longevity:6, fecundity: 0, might: 3, will: 4, cunning: 2, subtlety: 3, perception: 2, sagacity: 4, scale: 1)

#---------------------------------------
# 	       TEMPORARY SETUP

# associateOhmSight for all terrains and deities

Terrain.all.each do |t|
	t.associate({"OhmSight" => 100})
	puts "associated #{t.name}"
end

Deity.all.each do |d|
	d.associate({"OhmSight" => 100})
	puts "associated #{d.name}"
end

# default all provinces to Protean
t = Terrain.where(name: "Protean").first
Province.all.each do |prov|
	prov.update(primary_terrain: t, secondary_terrain: t)
	puts "set #{prov.name} to protean"
end

# default all deity actors to generic
	# r = Race.where(name: "Generic").first
	# Deity.all.each do |deit|
	# 	deit.actor = Actor.where(name: deit.name).first_or_create(name: deit.name, race: r)
	# 	deit.save
	# end

# add boring statline to generic actors
	# Actor.where(race: r).each do |a|
	# 	a.update(might: 3, will: 3, subtlety: 3, sagacity: 3, perception: 3, cunning: 3)
	# end

# --------------------------------------------
# 		   SEEDS FOR LEVEL 0 Terrain
#---------------------------------------------
# 			Seedsa for kingdoms
# org_united_goblin_tribes = Organization.create(name:"United Goblin Tribes", description:"A loose federation of free goblin tribes", is_church:0, is_kingdom:1, leader:act_globrat, governance:"Tribal Federation")

goblin_nation = Organization.where(name: "The Goblin Nation").first_or_create(name: "The Goblin Nation", description:"A matriarchal society of globlins from the Worldbreak mountains", is_kingdom:1, is_church:0, governance:"Tribal Matriarchy")
# Province.find(32).update(suzerain: goblin_nation)
# Province.find(33).update(suzerain: goblin_nation)
# Province.find(37).update(suzerain: goblin_nation)
# Province.find(13).update(suzerain: goblin_nation)
ashanti = Organization.where(name: "Ashanti").first_or_create(name:"Ashanti", description:"This enterprising kingdom is used to living on the harsh coastal desert and steep plateaus of the Resal Akhani", is_kingdom:1, is_church:0, governance:"Kingdom")
# Province.find(18).update(suzerain: ashanti)
# Province.find(19).update(suzerain: ashanti)
urd = Organization.where(name: "Urd").first_or_create(name:"Urd", description:"Urd and the four kingdoms... the theocracy of the undead.", is_kingdom:1, is_church:0, governance:"Gerontocracy")
# Province.find(46).update(suzerain: urd)
# Province.find(34).update(suzerain: urd)
# Province.find(44).update(suzerain: urd)
akatian_cities = Organization.where(name:"Akatian Free Cities").first_or_create(name:"Akatian Free Cities", description:"A loose confedration of tree trading cities", is_kingdom:1, is_church:0, governance:"Squabbling Plutocracy")
# Province.find(52).update(suzerain: akatian_cities)
# Province.find(53).update(suzerain: akatian_cities)
backvale = Organization.where(name:"Loah-Khor").first_or_create(name:"Loah-Khor", description:"A paradoxical realm, where up is down, and different is the usual", is_kingdom:1, is_church:0, governance:"Unanimous Committee")
# Province.find(30).update(suzerain: backvale)
# Province.where(name:"Luts").first.update(suzerain: backvale)
thenindriel = Organization.where(name:"Thenindriel").first_or_create(name:"Thenindriel",description:"An ancient and forested kingdom of the elves", is_kingdom:1, is_church:0, governance:"Monarchy")
# Province.find(39).update(suzerain: thenindriel)
# Province.find(41).update(suzerain: thenindriel)
# Province.find(45).update(suzerain: thenindriel)
wakkalob_tribe= Organization.where(name:"Wakkalob Tribe").first_or_create(name:"Wakkalob Tribe", description:"A disheveled conglomeration of runty gits", is_kingdom:1, is_church:0, governance:"Little to none")
# Province.find(12).update(suzerain: wakkalob_tribe)
# Province.find(36).update(suzerain: wakkalob_tribe)
yat = Organization.where(name:"Yat").first_or_create(name:"Yat", description:"The Yat are a hardy and spiritual people who believe that the natural order must be followed to avoid bad luck.", is_kingdom:1, is_church:0, governance:"Tribal Federation")
# Province.find(38).update(suzerain: yat)
ice_tribe = Organization.where(name:"Ice Tribe").first_or_create(name:"Ice Tribe", description: "Savage men who follow the old ways, riding the great Ice Worms to hunt the mammoth, and raid the soft sourthern people", is_kingdom:1, is_church:0, governance:"Monarchy")
# Province.find(113).update(suzerain: ice_tribe)
# Province.find(114).update(suzerain: ice_tribe)
chilldale = Organization.where(name:"Chilldale").first_or_create(name:"Chilldale", description: "Simple farming folk, who only wish to be left in peace", is_kingdom:1, is_church:0, governance:"Monarchy")
# Province.find(71).update(suzerain: chilldale)
roost = Organization.where(name:"Wyveryn Roosts").first_or_create(name:"Wyveryn Roosts", description: "Major stops on the migratory routes of the Wyveryn - though perhaps not technically a kingdom, the borders of the roosts are taken seriously by landbound nations", is_kingdom:1, is_church:0, governance:"Transitory")
# Province.find(7).update(suzerain: roost)
# Province.find(11).update(suzerain: roost)
# Province.find(35).update(suzerain: roost)
blacktooth = Organization.where(name:"Blacktooth Tribe").first_or_create(name:"Blacktooth Tribe", description: "A primarily anarcho-arsonist community of sneaky backstabbing gits", is_kingdom:1, is_church: 0, governance:"Tribal Matriarchy")
# Province.find(65).update(suzerain: blacktooth)
# Province.find(10).update(suzerain: blacktooth)
sendel = Organization.where(name:"Sendel Empire").first_or_create(name:"Sendel Empire",description: "A young empire, with perhpaps the most organized labor force and army in the world, prone to major land improvement projects", is_kingdom:1, is_church:0, governance:"Monarchy")
# Province.find(62).update(suzerain: sendel)
# Province.find(81).update(suzerain: sendel)
qatsaph = Organization.where(name:"Kingdom of Qatsaph").first_or_create(name:"Kingdom of Qatsaph", description: "The poet-king of Qatsaph is traditionally a scholar and follower of Lasrwoha - in Qatsaph learning and innocence are both held in high regard.", is_kingdom:1, is_church:0, governance:"Monarchy")
# Province.find(21).update(suzerain: qatsaph)
# Province.find(23).update(suzerain: qatsaph)
# Province.find(24).update(suzerain: qatsaph)
damoclus = Organization.where(name:"Kingdom of Damoclus").first_or_create(name:"Kingdom of Damoclus", description: "The sailors of damoclus ply their sheltered coast, and the farmers and smallfolk live in peace.  Damoclus is known for its fine wine, fair weather, and lovely pearls", is_kingdom:1, is_church:0, governance:"Monarchy")
# Province.find(20).update(suzerain: damoclus)
# Province.find(40).update(suzerain: damoclus)
# Province.find(42).update(suzerain: damoclus)
esteresse = Organization.where(name:"Kindom of Esteresse").first_or_create(name:"Kingdom of Esteresse", description: "The blood of the first men flows in this kingdom, whose anscestors came through the Thenindiel pass before the fall of Urd.  They are known for their long lived kings, and their relations with the Tancers", is_kingdom:1, is_church:0, governance:"Monarchy")
# Province.find(69).update(suzerain: esteresse)
# Province.find(73).update(suzerain: esteresse)
# Province.find(74).update(suzerain: esteresse)
redsails = Organization.where(name:"Redsail Raiders").first_or_create(name:"Redsail Raiders", description: "Though they lack the strength to threaten the Akatian cities, the Redsail Raiders nonetheless take a bite out of trade on the open sea, and ferociously defend their homesteads against reprisals", is_kingdom:1, is_church:0, governance:"Pirate Council")
# Province.find(51).update(suzerain: redsails)
# Province.find(54).update(suzerain: redsails)
ithelwood = Organization.where(name:"Ithelwood").first_or_create(name:"Ithelwood", description:"The Elves of Ithelwood concern themselves with enchantment above all other pursuits", is_kingdom:1, is_church:0, governance:"Magocracy")
# Province.find(59).update(suzerain: ithelwood)
ashilion = Organization.where(name:"Ashilion").first_or_create(name:"Ashilion", description:"The kingdom of Ashilion keeps carefully the borders of the Greenwood, but encourages all races, even Goblins, to live in peace within the rest of their territory", is_kingdom:1, is_church:0, governance:"Monarchy")
# Province.find(80).update(suzerain: ashilion)
# Province.find(83).update(suzerain: ashilion)
quarp = Organization.where(name:"Quarp").first_or_create(name:"Quarp", description: "The people of Quarp are impoverished and ignorant - they pole rickety boats through the marshes, and plumb the fungus caves of the Living Crypts for base subsistence, and the Humans and Goblins here are constantly infighting and betraying one another", is_kingdom:1, is_church:0, governance: "Effectively None")
# Province.find(26).update(suzerain: quarp)
# Province.find(28).update(suzerain: quarp)
boqer = Organization.where(name:"Duchy of Boqer").first_or_create(name:"Duchy of Boqer", description: "A client state of neigboring Qatsaph, the Duch of Boqer exports peat, and serves as trade port to Qatsaph and Loah-Khor", is_kingdom:1, is_church:0, governance:"Monarchy")
# Province.find(25).update(suzerain: boqer)
skytribe = Organization.where(name:"Open Sky Tribe").first_or_create(name:"Open Sky Tribe", description:"These goblins reject cave dwelling (they were kicked out) and are slowly starving to death while trying to invent agriculture", is_kingdom:1, is_church:0, governance:"Monarchy")
# Province.find(64).update(suzerain: skytribe)
tyvax = Organization.where(name:"Tyvax").first_or_create(name:"Tyvax", description: "A small kingdom, know for it's justs laws, and excellent wines", is_kingdom: 1, is_church: 0, governance: "monarchy")
# Province.find(63).update(suzerain: tyvax)
fireon = Organization.where(name:"Fireon").first_or_create(name:"Fireon", description: "Culturally descended from the Kingdom of Damoclus, the people of Fireon have a harsher climate to contend with, and mainly consist of shepherds and herdsmen", is_kingdom:1, is_church:0, governance:"Monarchy")
# Province.find(43).update(suzerain: fireon)
# Province.find(47).update(suzerain: fireon)
dix = Organization.where(name:"Republic of Dix").first_or_create(name:"Republic of Dix", description: "A Matriarchal Republic, known for herb lore, superior healers, and a lax attitude toward family values", is_kingdom: 1, is_church: 0, governance:"Republic")
# Province.find(57).update(suzerain: dix)

#reset all names to basic
for i in 1..125
	temp_name = "province #{i}"
	Province.find(i).update(name: temp_name)
end

#set province data
p_pid = 1
Province.find(1).update(name:"The Pirate Isles", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Woodland").first, volcanism:2, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(2).update(name:"Lippinaumau", primary_terrain: Terrain.where(name: "Marsh").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(3).update(name:"Sandy Shores", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Woodland").first, volcanism:3, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(4).update(name:"Isle of Ashe", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Woodland").first, volcanism:5, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(5).update(name:"M other's Womb", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Elysian").first, volcanism:5, leyline_strength:0, suzerain:nil)
p_pid += 1
Province.find(6).update(name:"Greater and Lesser Turtles", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Hills").first, volcanism:2, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(7).update(name:"Vyn'drym", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Grassland").first, volcanism:1, leyline_strength:3, suzerain:roost)
p_pid += 1
Province.find(8).update(name:"Montuo", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Woodland").first, volcanism:3, leyline_strength:3, suzerain:nil)
p_pid += 1
Province.find(9).update(name:"The Glowing Isles", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Grassland").first, volcanism:3, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(10).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Mountains").first, secondary_terrain: Terrain.where(name: "Mountains").first, volcanism:1, leyline_strength:2, suzerain:blacktooth)
p_pid += 1
Province.find(11).update(name:"Kywa'vek", primary_terrain: Terrain.where(name: "Mountains").first, secondary_terrain: Terrain.where(name: "Mountains").first, volcanism:0, leyline_strength:3, suzerain:roost)
p_pid += 1
Province.find(12).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Mountain Pass").first, secondary_terrain: Terrain.where(name: "Mountains").first, volcanism:0, leyline_strength:2, suzerain:wakkalob_tribe)
p_pid += 1
Province.find(13).update(name:"Threndel's Pass", primary_terrain: Terrain.where(name: "Mountain Pass").first, secondary_terrain: Terrain.where(name: "Mountains").first, volcanism:0, leyline_strength:2, suzerain:goblin_nation)
p_pid += 1
Province.find(14).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Plains").first, volcanism:0, leyline_strength:3, suzerain:nil)
p_pid += 1
Province.find(15).update(name:"Hide", primary_terrain: Terrain.where(name: "Protean").first, secondary_terrain: Terrain.where(name: "Protean").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(16).update(name:"Hide", primary_terrain: Terrain.where(name: "Protean").first, secondary_terrain: Terrain.where(name: "Protean").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(17).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Woodland").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(18).update(name:"Windward Res Akhani", primary_terrain: Terrain.where(name: "Mountains").first, secondary_terrain: Terrain.where(name: "Wind Carved Mesa").first, volcanism:1, leyline_strength:2, suzerain:ashanti)
p_pid += 1
Province.find(19).update(name:"Leeward Res Akhani", primary_terrain: Terrain.where(name: "Mountains").first, secondary_terrain: Terrain.where(name: "Wind Carved Mesa").first, volcanism:0, leyline_strength:1, suzerain:ashanti)
p_pid += 1
Province.find(20).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Elysian").first, volcanism:0, leyline_strength:1, suzerain:damoclus)
p_pid += 1
Province.find(21).update(name:"Qatsaph", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "River").first, volcanism:0, leyline_strength:0, suzerain:qatsaph)
p_pid += 1
Province.find(22).update(name:"Luts", primary_terrain: Terrain.where(name: "Plains").first, secondary_terrain: Terrain.where(name: "River").first, volcanism:0, leyline_strength:1, suzerain:backvale)
p_pid += 1
Province.find(23).update(name:"Lake-of-the-Sky", primary_terrain: Terrain.where(name: "Mountains").first, secondary_terrain: Terrain.where(name: "Mountains").first, volcanism:0, leyline_strength:2, suzerain:qatsaph)
p_pid += 1
Province.find(24).update(name:"Berakhah", primary_terrain: Terrain.where(name: "Elysian").first, secondary_terrain: Terrain.where(name: "Grassland").first, volcanism:0, leyline_strength:1, suzerain:qatsaph)
p_pid += 1
Province.find(25).update(name:"Boqer", primary_terrain: Terrain.where(name: "Marsh").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:1, leyline_strength:1, suzerain:boqer)
p_pid += 1
Province.find(26).update(name:"Quarp Marsh", primary_terrain: Terrain.where(name: "Marsh").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:1, leyline_strength:2, suzerain:quarp)
p_pid += 1
Province.find(27).update(name:"Otho Valley", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(28).update(name:"The Living Catacombs", primary_terrain: Terrain.where(name: "Grassland").first, secondary_terrain: Terrain.where(name: "Tundra").first, volcanism:0, leyline_strength:2, suzerain:quarp)
p_pid += 1
Province.find(29).update(name:"Ahhareet", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Tundra").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(30).update(name:"Loah-Khor", primary_terrain: Terrain.where(name: "slliH").first, secondary_terrain: Terrain.where(name: "sniatnuoM").first, volcanism:0, leyline_strength:2, suzerain:backvale)
p_pid += 1
Province.find(31).update(name:"Levush", primary_terrain: Terrain.where(name: "Mountains").first, secondary_terrain: Terrain.where(name: "Mountains").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(32).update(name:"Leeshkah", primary_terrain: Terrain.where(name: "Mountains").first, secondary_terrain: Terrain.where(name: "Mountains").first, volcanism:0, leyline_strength:1, suzerain:goblin_nation)
p_pid += 1
Province.find(33).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Mountains").first, secondary_terrain: Terrain.where(name: "Mountains").first, volcanism:0, leyline_strength:2, suzerain:goblin_nation)
p_pid += 1
Province.find(34).update(name:"Mountains of Ulog", primary_terrain: Terrain.where(name: "Mountains").first, secondary_terrain: Terrain.where(name: "Mountains").first, volcanism:1, leyline_strength:3, suzerain:urd)
p_pid += 1
Province.find(35).update(name:"Vey'thu'wyr", primary_terrain: Terrain.where(name: "Mountains").first, secondary_terrain: Terrain.where(name: "Hills").first, volcanism:7, leyline_strength:3, suzerain:roost)
p_pid += 1
Province.find(36).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Mountains").first, secondary_terrain: Terrain.where(name: "Mountains").first, volcanism:0, leyline_strength:2, suzerain:wakkalob_tribe)
p_pid += 1
Province.find(37).update(name:"Pequdah", primary_terrain: Terrain.where(name: "Mountains").first, secondary_terrain: Terrain.where(name: "Hills").first, volcanism:0, leyline_strength:2, suzerain:goblin_nation)
p_pid += 1
Province.find(38).update(name:"In-Yat-Lo Highlands", primary_terrain: Terrain.where(name: "Grassland").first, secondary_terrain: Terrain.where(name: "Hills").first, volcanism:0, leyline_strength:1, suzerain:yat)
p_pid += 1
Province.find(39).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Forest").first, volcanism:0, leyline_strength:1, suzerain:thenindriel)
p_pid += 1
Province.find(40).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Mountains").first, secondary_terrain: Terrain.where(name: "Hills").first, volcanism:0, leyline_strength:1, suzerain:damoclus)
p_pid += 1
Province.find(41).update(name:"Thenindriel", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Forest").first, volcanism:0, leyline_strength:1, suzerain:thenindriel)
p_pid += 1
Province.find(42).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Grassland").first, secondary_terrain: Terrain.where(name: "Forest").first, volcanism:0, leyline_strength:1, suzerain:damoclus)
p_pid += 1
Province.find(43).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Grassland").first, secondary_terrain: Terrain.where(name: "Forest").first, volcanism:0, leyline_strength:2, suzerain:fireon)
p_pid += 1
Province.find(44).update(name:"Mere of Lagash", primary_terrain: Terrain.where(name: "Marsh").first, secondary_terrain: Terrain.where(name: "Lake").first, volcanism:0, leyline_strength:1, suzerain:urd)
p_pid += 1
Province.find(45).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Grassland").first, secondary_terrain: Terrain.where(name: "Woodland").first, volcanism:0, leyline_strength:0, suzerain:thenindriel)
p_pid += 1
Province.find(46).update(name:"Urd", primary_terrain: Terrain.where(name: "Elysian").first, secondary_terrain: Terrain.where(name: "Plateau").first, volcanism:0, leyline_strength:1, suzerain:urd)
p_pid += 1
Province.find(47).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Elysian").first, secondary_terrain: Terrain.where(name: "Hills").first, volcanism:0, leyline_strength:2, suzerain:fireon)
p_pid += 1
Province.find(48).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Plains").first, secondary_terrain: Terrain.where(name: "Hills").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(49).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Tundra").first, secondary_terrain: Terrain.where(name: "Hills").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(50).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Hills").first, secondary_terrain: Terrain.where(name: "River").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(51).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:0, leyline_strength:1, suzerain:redsails)
p_pid += 1
Province.find(52).update(name:"New Akatian States", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:3, leyline_strength:2, suzerain:akatian_cities)
p_pid += 1
Province.find(53).update(name:"Old Akatian States", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Elysian").first, volcanism:0, leyline_strength:2, suzerain:akatian_cities)
p_pid += 1
Province.find(54).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Grassland").first, volcanism:2, leyline_strength:1, suzerain:redsails)
p_pid += 1
Province.find(55).update(name:"Rustle Wood", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:1, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(56).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Marsh").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(57).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Marsh").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:0, leyline_strength:1, suzerain:dix)
p_pid += 1
Province.find(58).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(59).update(name:"Ithel Wood", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Hills").first, volcanism:0, leyline_strength:2, suzerain:ithelwood)
p_pid += 1
Province.find(60).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Tundra").first, secondary_terrain: Terrain.where(name: "Hills").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(61).update(name:"Sendeel Coast South", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Shrubland").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(62).update(name:"Sendel Coast North", primary_terrain: Terrain.where(name: "Marsh").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:0, leyline_strength:1, suzerain:sendel)
p_pid += 1
Province.find(63).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Hills").first, secondary_terrain: Terrain.where(name: "Plains").first, volcanism:0, leyline_strength:0, suzerain:tyvax)
p_pid += 1
Province.find(64).update(name:"Starrs Plain", primary_terrain: Terrain.where(name: "Grassland").first, secondary_terrain: Terrain.where(name: "Plains").first, volcanism:0, leyline_strength:2, suzerain:skytribe)
p_pid += 1
Province.find(65).update(name:"The Rusting Hills", primary_terrain: Terrain.where(name: "Hills").first, secondary_terrain: Terrain.where(name: "Plains").first, volcanism:0, leyline_strength:1, suzerain:blacktooth)
p_pid += 1
Province.find(66).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Hills").first, secondary_terrain: Terrain.where(name: "Plains").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(67).update(name:"Suenawel Forst", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "River").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(68).update(name:"Suenawel Forest North", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Hills").first, volcanism:1, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(69).update(name:"Suenawel Forest South", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "River").first, volcanism:0, leyline_strength:1, suzerain:esteresse)
p_pid += 1
Province.find(70).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Tundra").first, secondary_terrain: Terrain.where(name: "Hills").first, volcanism:1, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(71).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Lake").first, secondary_terrain: Terrain.where(name: "Grassland").first, volcanism:0, leyline_strength:2, suzerain:chilldale)
p_pid += 1
Province.find(72).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Tundra").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(73).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Hills").first, secondary_terrain: Terrain.where(name: "River").first, volcanism:1, leyline_strength:1, suzerain:esteresse)
p_pid += 1
Province.find(74).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "River").first, volcanism:0, leyline_strength:1, suzerain:esteresse)
p_pid += 1
Province.find(75).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Grassland").first, secondary_terrain: Terrain.where(name: "Marsh").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(76).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Grassland").first, secondary_terrain: Terrain.where(name: "Lake").first, volcanism:0, leyline_strength:0, suzerain:nil)
p_pid += 1
Province.find(77).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Grassland").first, secondary_terrain: Terrain.where(name: "Plains").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(78).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Plains").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(79).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Coast").first, secondary_terrain: Terrain.where(name: "Elysian").first, volcanism:0, leyline_strength:1, suzerain:ashilion)
p_pid += 1
Province.find(80).update(name:"Geenwood", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "River").first, volcanism:0, leyline_strength:1, suzerain:ashilion)
p_pid += 1
Province.find(81).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Elysian").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:0, leyline_strength:2, suzerain:sendel)
p_pid += 1
Province.find(82).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:0, leyline_strength:3, suzerain:nil)
p_pid += 1
Province.find(83).update(name:"Little Wood", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Grassland").first, volcanism:0, leyline_strength:1, suzerain:ashilion)
p_pid += 1
Province.find(84).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Forest").first, secondary_terrain: Terrain.where(name: "Plains").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(85).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Grassland").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(86).update(name:"Lake of Steam", primary_terrain: Terrain.where(name: "Freshwater Sea").first, secondary_terrain: Terrain.where(name: "Freshwater Sea").first, volcanism:1, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(87).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Grassland").first, secondary_terrain: Terrain.where(name: "Coast").first, volcanism:0, leyline_strength:3, suzerain:nil)
p_pid += 1
Province.find(88).update(name:"Chessen Sea", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Rocky").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(89).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(90).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(91).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(92).update(name:"Near Corwal Sea", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(93).update(name:"Far Corwal Sea", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:1, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(94).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(95).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(96).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:1, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(97).update(name:"Apothecary's Noose", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:1, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(98).update(name:"Oceanhill", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:1, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(99).update(name:"The Glowing Sea", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(100).update(name:"The Swallowing Song", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(101).update(name:"The Glass Sea", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:1, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(102).update(name:"The Caloinne Deep", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(103).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:2, leyline_strength:0, suzerain:nil)
p_pid += 1
Province.find(104).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:1, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(105).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:2, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(106).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Ocean").first, volcanism:1, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(107).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Ocean").first, secondary_terrain: Terrain.where(name: "Hills").first, volcanism:1, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(108).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(109).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(110).update(name:"Asheyrah", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:3, suzerain:nil)
p_pid += 1
Province.find(111).update(name:"Adamah", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:2, suzerain:nil)
p_pid += 1
Province.find(112).update(name:"Okhel", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:1, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(113).update(name:"Elkholdt", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:2, suzerain:ice_tribe)
p_pid += 1
Province.find(114).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:1, suzerain:ice_tribe)
p_pid += 1
Province.find(115).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(116).update(name:"The Deep Unknown - West", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(117).update(name:"The Deep Unknwon - East", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(118).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(119).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(120).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(121).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(122).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(123).update(name:"Province #{p_pid}", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:1, suzerain:nil)
p_pid += 1
Province.find(124).update(name:"South Terminus", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:0, leyline_strength:0, suzerain:nil)
p_pid += 1
Province.find(125).update(name:"North Terminus", primary_terrain: Terrain.where(name: "Glacier").first, secondary_terrain: Terrain.where(name: "Glacier").first, volcanism:1, leyline_strength:2, suzerain:nil)
p_pid += 1

# --------------------------------------------
#  Population Seeds
Population.all.each do |p|
	p.destroy!
end

Province.all.each do |p|
	p.populations = []
end

Population.where(province_id:10,race: Race.where(name: "Goblin").first).first_or_create(province_id:10, race: Race.where(name:"Goblin").first, count:90000)
Population.where(province_id:11,race: Race.where(name: "Wyveryn").first).first_or_create(province_id:11, race: Race.where(name:"Wyveryn").first, count:25000)
Population.where(province_id:113,race: Race.where(name: "Human").first).first_or_create(province_id:113, race: Race.where(name:"Human").first, count:120000)
Population.where(province_id:114,race: Race.where(name: "Human").first).first_or_create(province_id:114, race: Race.where(name:"Human").first, count:60000)
Population.where(province_id:12,race: Race.where(name: "Goblin").first).first_or_create(province_id:12, race: Race.where(name:"Goblin").first, count:70000)
Population.where(province_id:13,race: Race.where(name: "Goblin").first).first_or_create(province_id:13, race: Race.where(name:"Goblin").first, count:90000)
Population.where(province_id:18,race: Race.where(name: "Human").first).first_or_create(province_id:18, race: Race.where(name:"Human").first, count:200000)
Population.where(province_id:19,race: Race.where(name: "Human").first).first_or_create(province_id:19, race: Race.where(name:"Human").first, count:200000)
Population.where(province_id:20,race: Race.where(name: "Human").first).first_or_create(province_id:20, race: Race.where(name:"Human").first, count:60000)
Population.where(province_id:21,race: Race.where(name: "Human").first).first_or_create(province_id:21, race: Race.where(name:"Human").first, count:80000)
Population.where(province_id:22,race: Race.where(name: "Human").first).first_or_create(province_id:22, race: Race.where(name:"Human").first, count:120000)
Population.where(province_id:23,race: Race.where(name: "Human").first).first_or_create(province_id:23, race: Race.where(name:"Human").first, count:70000)
Population.where(province_id:24,race: Race.where(name: "Human").first).first_or_create(province_id:24, race: Race.where(name:"Human").first, count:80000)
Population.where(province_id:25,race: Race.where(name: "Human").first).first_or_create(province_id:25, race: Race.where(name:"Human").first, count:80000)
Population.where(province_id:26,race: Race.where(name: "Human").first).first_or_create(province_id:26, race: Race.where(name:"Human").first, count:40000)
Population.where(province_id:28,race: Race.where(name: "Human").first).first_or_create(province_id:28, race: Race.where(name:"Human").first, count:60000)
Population.where(province_id:30,race: Race.where(name: "Human").first).first_or_create(province_id:30, race: Race.where(name:"Human").first, count:240000)
Population.where(province_id:32,race: Race.where(name: "Goblin").first).first_or_create(province_id:32, race: Race.where(name:"Goblin").first, count:70000)
Population.where(province_id:33,race: Race.where(name: "Goblin").first).first_or_create(province_id:33, race: Race.where(name:"Goblin").first, count:70000)
Population.where(province_id:34,race: Race.where(name: "Undead").first).first_or_create(province_id:34, race: Race.where(name:"Undead").first, count:50000)
Population.where(province_id:35,race: Race.where(name: "Wyveryn").first).first_or_create(province_id:35, race: Race.where(name:"Wyveryn").first, count:20000)
Population.where(province_id:36,race: Race.where(name: "Goblin").first).first_or_create(province_id:36, race: Race.where(name:"Goblin").first, count:70000)
Population.where(province_id:37,race: Race.where(name: "Goblin").first).first_or_create(province_id:37, race: Race.where(name:"Goblin").first, count:80000)
Population.where(province_id:38,race: Race.where(name: "Human").first).first_or_create(province_id:38, race: Race.where(name:"Human").first, count:70000)
Population.where(province_id:39,race: Race.where(name: "Elf").first).first_or_create(province_id:39, race: Race.where(name:"Elf").first, count:27000)
Population.where(province_id:40,race: Race.where(name: "Human").first).first_or_create(province_id:40, race: Race.where(name:"Human").first, count:70000)
Population.where(province_id:41,race: Race.where(name: "Elf").first).first_or_create(province_id:41, race: Race.where(name:"Elf").first, count:170000)
Population.where(province_id:42,race: Race.where(name: "Human").first).first_or_create(province_id:42, race: Race.where(name:"Human").first, count:80000)
Population.where(province_id:43,race: Race.where(name: "Human").first).first_or_create(province_id:43, race: Race.where(name:"Human").first, count:80000)
Population.where(province_id:44,race: Race.where(name: "Undead").first).first_or_create(province_id:44, race: Race.where(name:"Undead").first, count:50000)
Population.where(province_id:45,race: Race.where(name: "Elf").first).first_or_create(province_id:45, race: Race.where(name:"Elf").first, count:38000)
Population.where(province_id:46,race: Race.where(name: "Undead").first).first_or_create(province_id:46, race: Race.where(name:"Undead").first, count:180000)
Population.where(province_id:47,race: Race.where(name: "Human").first).first_or_create(province_id:47, race: Race.where(name:"Human").first, count:80000)
Population.where(province_id:51,race: Race.where(name: "Human").first).first_or_create(province_id:51, race: Race.where(name:"Human").first, count:80000)
Population.where(province_id:52,race: Race.where(name: "Human").first).first_or_create(province_id:52, race: Race.where(name:"Human").first, count:290000)
Population.where(province_id:53,race: Race.where(name: "Human").first).first_or_create(province_id:53, race: Race.where(name:"Human").first, count:350000)
Population.where(province_id:54,race: Race.where(name: "Human").first).first_or_create(province_id:54, race: Race.where(name:"Human").first, count:80000)
Population.where(province_id:57,race: Race.where(name: "Human").first).first_or_create(province_id:57, race: Race.where(name:"Human").first, count:80000)
Population.where(province_id:59,race: Race.where(name: "Elf").first).first_or_create(province_id:59, race: Race.where(name:"Elf").first, count:30000)
Population.where(province_id:62,race: Race.where(name: "Human").first).first_or_create(province_id:62, race: Race.where(name:"Human").first, count:80000)
Population.where(province_id:63,race: Race.where(name: "Human").first).first_or_create(province_id:63, race: Race.where(name:"Human").first, count:43000)
Population.where(province_id:64,race: Race.where(name: "Goblin").first).first_or_create(province_id:64, race: Race.where(name:"Goblin").first, count:23000)
Population.where(province_id:65,race: Race.where(name: "Goblin").first).first_or_create(province_id:65, race: Race.where(name:"Goblin").first, count:70000)
Population.where(province_id:69,race: Race.where(name: "Human").first).first_or_create(province_id:69, race: Race.where(name:"Human").first, count:90000)
Population.where(province_id:7,race: Race.where(name: "Wyveryn").first).first_or_create(province_id:7, race: Race.where(name:"Wyveryn").first, count:20000)
Population.where(province_id:71,race: Race.where(name: "Human").first).first_or_create(province_id:71, race: Race.where(name:"Human").first, count:50000)
Population.where(province_id:73,race: Race.where(name: "Human").first).first_or_create(province_id:73, race: Race.where(name:"Human").first, count:45000)
Population.where(province_id:74,race: Race.where(name: "Elf").first).first_or_create(province_id:74, race: Race.where(name:"Elf").first, count:13000)
Population.where(province_id:79,race: Race.where(name: "Human").first).first_or_create(province_id:79, race: Race.where(name:"Human").first, count:120000)
Population.where(province_id:80,race: Race.where(name: "Elf").first).first_or_create(province_id:80, race: Race.where(name:"Elf").first, count:40000)
Population.where(province_id:81,race: Race.where(name: "Human").first).first_or_create(province_id:81, race: Race.where(name:"Human").first, count:80000)
Population.where(province_id:83,race: Race.where(name: "Elf").first).first_or_create(province_id:83, race: Race.where(name:"Elf").first, count:40000)
Population.where(province_id:81,race: Race.where(name: "Human").first).first_or_create(province_id:81, race: Race.where(name:"Human").first, count:60000)
Population.where(province_id:79,race: Race.where(name: "Elf").first).first_or_create(province_id:79, race: Race.where(name:"Elf").first, count:4300)
Population.where(province_id:74,race: Race.where(name: "Human").first).first_or_create(province_id:74, race: Race.where(name:"Human").first, count:40000)
Population.where(province_id:73,race: Race.where(name: "Elf").first).first_or_create(province_id:73, race: Race.where(name:"Elf").first, count:3000)
Population.where(province_id:53,race: Race.where(name: "Goblin").first).first_or_create(province_id:53, race: Race.where(name:"Goblin").first, count:25000)
Population.where(province_id:46,race: Race.where(name: "Human").first).first_or_create(province_id:46, race: Race.where(name:"Human").first, count:40000)
Population.where(province_id:44,race: Race.where(name: "Human").first).first_or_create(province_id:44, race: Race.where(name:"Human").first, count:20000)
Population.where(province_id:41,race: Race.where(name: "Undead").first).first_or_create(province_id:41, race: Race.where(name:"Undead").first, count:30000)
Population.where(province_id:34,race: Race.where(name: "Goblin").first).first_or_create(province_id:34, race: Race.where(name:"Goblin").first, count:80000)
Population.where(province_id:28,race: Race.where(name: "Goblin").first).first_or_create(province_id:28, race: Race.where(name:"Goblin").first, count:20000)
Population.where(province_id:26,race: Race.where(name: "Goblin").first).first_or_create(province_id:26, race: Race.where(name:"Goblin").first, count:30000)
Population.where(province_id:19,race: Race.where(name: "Goblin").first).first_or_create(province_id:19, race: Race.where(name:"Goblin").first, count:7500)
Population.where(province_id:113,race: Race.where(name: "Snow-Elf").first).first_or_create(province_id:113, race: Race.where(name:"Snow-Elf").first, count:10000)
Population.where(province_id:81,race: Race.where(name: "Goblin").first).first_or_create(province_id:81, race: Race.where(name:"Goblin").first, count:4000)
Population.where(province_id:79,race: Race.where(name: "Goblin").first).first_or_create(province_id:79, race: Race.where(name:"Goblin").first, count:12000)
Population.where(province_id:44,race: Race.where(name: "Elf").first).first_or_create(province_id:44, race: Race.where(name:"Elf").first, count:8000)
Population.where(province_id:34,race: Race.where(name: "Wyveryn").first).first_or_create(province_id:34, race: Race.where(name:"Wyveryn").first, count:5000)


#---------------------------------------------
# 		   SEEDS FOR DEITY ACTORS
#correct silly vexname issue
#Deity.where(name: '???').first.update(name:"Vatharius'Vex")
#Deity.where(name: 'Larswoha').first.update(name:'Lasrwoha')
Deity.where(name: "Grita").first_or_create(name:"Grita")
Deity.where(name: "Grundzel").first_or_create(name:"Grundzel")
Deity.where(name: "Aleseus").first_or_create(name:"Aleseus")

a = Actor.where(name:"Lasrwoha").first_or_create(name:"Lasrwoha", race: (Race.where(name:"Alohm").first), might:4,will:6,cunning:1,subtlety:1,sagacity:4,perception:5)
Deity.where(name: a.name).first.update(actor: a)
puts "added actor #{a.name}"
a = Actor.where(name:"Ululantibus").first_or_create(race: Race.where(name: "Alohm").first, name: "Ululantibus", might:4,will:5,cunning:3,subtlety:2,sagacity:5,perception:2)
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Ehlisfaire").first_or_create(race: Race.where(name: "Alohm").first, name: "Ehlisfaire", might:6,will:1,cunning:3,subtlety:3,sagacity:4,perception:4)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Vatharius'Vex").first_or_create(race: Race.where(name: "Alohm").first, name: "Vatharius'Vex", might:6,will:5,cunning:3,subtlety:2,sagacity:1,perception:4)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Zephyrus").first_or_create(race: Race.where(name: "Alohm").first, name: "Zephyrus", might:4,will:6,cunning:1,subtlety:1,sagacity:4,perception:4)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Aleseus").first_or_create(race: Race.where(name: "Alohm").first, name: "Aleseus", might:3,will:2,cunning:5,subtlety:4,sagacity:2,perception:5)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Skaal").first_or_create(race: Race.where(name: "Alohm").first, name: "Skaal", might:1,will:3,cunning:3,subtlety:6,sagacity:4,perception:4)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Harkates").first_or_create(race: Race.where(name: "Alohm").first, name: "Harkates", might:5,will:4,cunning:3,subtlety:1,sagacity:2,perception:6)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Ordwyn").first_or_create(race: Race.where(name: "Alohm").first, name: "Ordwyn", might:3,will:3,cunning:5,subtlety:2,sagacity:5,perception:4)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Krolos").first_or_create(race: Race.where(name: "Alohm").first, name: "Krolos", might:2,will:3,cunning:4,subtlety:5,sagacity:1,perception:6)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Luogh").first_or_create(race: Race.where(name: "Alohm").first, name: "Luogh", might:5,will:6,cunning:2,subtlety:2,sagacity:3,perception:3)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Oscaro").first_or_create(race: Race.where(name: "Alohm").first, name: "Oscaro", might:1,will:5,cunning:4,subtlety:5,sagacity:4,perception:2)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Dartha").first_or_create(race: Race.where(name: "Alohm").first, name: "Dartha", might:5,will:4,cunning:2,subtlety:2,sagacity:3,perception:5)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Vaniya").first_or_create(race: Race.where(name: "Alohm").first, name: "Vaniya", might:5,will:5,cunning:3,subtlety:4,sagacity:2,perception:2)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Grita").first_or_create(race: Race.where(name: "Alohm").first, name: "Grita", might:4,will:5,cunning:3,subtlety:4,sagacity:2,perception:3)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Gawp").first_or_create(race: Race.where(name: "Alohm").first, name: "Gawp", might:1,will:3,cunning:3,subtlety:3,sagacity:4,perception:4)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)
a = Actor.where(name:"Grundzel").first_or_create(race: Race.where(name: "Alohm").first, name: "Grundzel", might:3,will:3,cunning:3,subtlety:3,sagacity:3,perception:3)
puts "added actor #{a.name}"
Deity.where(name: a.name).first.update(actor: a)


# --------------------------------------------
#          SEEDS FOR USER PROFILES

# u = User.where(username: '???').first_or_create(username: '???', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: '???').first_or_create(name: '???', user: u)


# u = User.where(username: 'Dartha').first_or_create(username: 'Dartha', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: 'Dartha').first_or_create(name: 'Dartha', user: u)

# u = User.where(username: 'Ehlisfaire').first_or_create(username: 'Ehlisfaire', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: 'Ehlisfaire').first_or_create(name: 'Ehlisfaire', user: u)

# u = User.where(username: 'Gawp').first_or_create(username: 'Gawp', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: 'Gawp').first_or_create(name: 'Gawp', user: u)

# u = User.where(username: 'Harkates').first_or_create(username: 'Harkates', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: 'Harkates').first_or_create(name: 'Harkates', user: u)

# u = User.where(username: 'Krolos').first_or_create(username: 'Krolos', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: 'Krolos').first_or_create(name: 'Krolos', user: u)

# u = User.where(username: 'Larswoha').first_or_create(username: 'Larswoha', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: 'Larswoha').first_or_create(name: 'Larswoha', user: u)

# u = User.where(username: 'Luogh').first_or_create(username: 'Luogh', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: 'Luogh').first_or_create(name: 'Luogh', user: u)

# u = User.where(username: 'Ohm').first_or_create(username: 'Ohm', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')

# u = User.where(username: 'Ordwyn').first_or_create(username: 'Ordwyn', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: 'Ordwyn').first_or_create(name: 'Ordwyn', user: u)

# u = User.where(username: 'Oscaro').first_or_create(username: 'Oscaro', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: 'Oscaro').first_or_create(name: 'Oscaro', user: u)

# u = User.where(username: 'Skaal').first_or_create(username: 'Skaal', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: 'Skaal').first_or_create(name: 'Skaal', user: u)

# u = User.where(username: 'Ululantibus').first_or_create(username: 'Ululantibus', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: 'Ululantibus').first_or_create(name: 'Ululantibus', user: u)

# u = User.where(username: 'Vaniya').first_or_create(username: 'Vaniya', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: 'Vaniya').first_or_create(name: 'Vaniya', user: u)

# u = User.where(username: 'Zephyrus').first_or_create(username: 'Zephyrus', email: '[%$securCred8347%]', password: '[%$securCred8347%]', access: '[%$securCred8347%]')
# d = Deity.where(name: 'Zephyrus').first_or_create(name: 'Zephyrus', user: u)



#-------------------------------------------
# 		   SEEDS FROM TESTING

# dom_trees = Domain.where(name: "Trees").first_or_create(name:"Trees")
# dom_music = Domain.where(name: "Music").first_or_create(name:"Music")
# dom_wind = Domain.where(name: "Wind").first_or_create(name:"Wind")
# dom_justice = Domain.where(name: "Justice").first_or_create(name:"Justice")
# dom_birds = Domain.where(name: "Birds").first_or_create(name:"Birds")
# dom_smithing = Domain.where(name: "Smithing").first_or_create(name:"Smithing")

# ter_forest = Terrain.create(name: "Forest", development_multiplier: 1, difficulty: 3, water: 1)
# ter_mountain = Terrain.create(name: "Mountain", development_multiplier: 0.5, difficulty: 5, water: 1)
# ter_plains = Terrain.create(name: "Plains", development_multiplier: 1.5, difficulty: 1, water: 1)
# ter_city = Terrain.create(name: "City", development_multiplier: 2, difficulty: 1, water: 1)
# ter_ocean = Terrain.create(name: "Ocean", development_multiplier: 0, difficulty: 2, water: 3)
# ter_swamp = Terrain.create(name: "Swamp", development_multiplier: 0.5, difficulty: 4, water: 2)

# land_terrains = [ter_forest, ter_mountain, ter_plains, ter_city, ter_swamp]
# ocean_terrain = [ter_ocean, ter_ocean, ter_ocean, ter_forest, ter_plains, ter_swamp, ter_city, ter_mountain]


# 	#new Associable method should be applicable to terrains

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

# ter_forest.associate({"Trees" => 9, "Birds" => 3, "Wind" => 1})
# ter_mountain.associate({"Birds" => 2, "Wind" => 2, "Smithing" => 2})
# ter_plains.associate({"Wind" => 3})
# ter_city.associate({"Wind" => 1})
# ter_city.associate({"Smithing" => 7})
# ter_city.associate({"Justice" => 3, "Music" => 3})
# ter_ocean.associate({"Wind" => 2})
# ter_swamp.associate({"Trees" => 2, "Wind" => 1})

# reg_west_ireland = Region.create(name:"Western Ireland", description:"Western Ireland is suprisingly full of complex terrain")
# reg_east_ireland = Region.create(name:"Eastern Ireland", description:"Eastern Ireland is somewhat random!")

# pro_ulster = Province.create(name:"Ulster", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_east_ireland)
# pro_pale = Province.create(name:"Pale", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_east_ireland)
# pro_leinster = Province.create(name:"Leinster", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_east_ireland)
# pro_kildare = Province.create(name:"Kildare", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_east_ireland)

# pro_tyrone = Province.create(name:"Tyrone", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_west_ireland)
# pro_sligo = Province.create(name:"Sligo", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_west_ireland)
# pro_connaught = Province.create(name:"Connaught", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_west_ireland)
# pro_limerick = Province.create(name:"Limerick", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_west_ireland)
# pro_cork = Province.create(name:"Cork", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:land_terrains.sample,secondary_terrain:land_terrains.sample, region:reg_west_ireland)

# pro_irish_sea = Province.create(name:"Irish Sea", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:ter_ocean,secondary_terrain:ocean_terrain.sample, region:reg_east_ireland)
# pro_donegal_sea = Province.create(name:"Donegal Bay", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:ter_ocean,secondary_terrain:ocean_terrain.sample, region:reg_west_ireland)
# pro_dingle_sea = Province.create(name:"Dingle Bay", base_dev:rand(5)+1,is_empyreal:0,primary_terrain:ter_ocean,secondary_terrain:ocean_terrain.sample, region:reg_west_ireland)

# Border.create([
# 	{province: pro_ulster, neighbor: pro_irish_sea},
# 	{province: pro_ulster, neighbor: pro_pale},
# 	{province: pro_ulster, neighbor: pro_tyrone},
# 	{province: pro_pale, neighbor: pro_irish_sea},
# 	{province: pro_pale, neighbor: pro_leinster},
# 	{province: pro_pale, neighbor: pro_kildare},
# 	{province: pro_pale, neighbor: pro_tyrone},
# 	{province: pro_leinster, neighbor: pro_irish_sea},
# 	{province: pro_leinster, neighbor: pro_kildare},
# 	{province: pro_leinster, neighbor: pro_cork},
# 	{province: pro_cork, neighbor: pro_dingle_sea},
# 	{province: pro_cork, neighbor: pro_kildare},
# 	{province: pro_cork, neighbor: pro_limerick},
# 	{province: pro_limerick, neighbor: pro_dingle_sea},
# 	{province: pro_limerick, neighbor: pro_connaught},
# 	{province: pro_limerick, neighbor: pro_sligo},
# 	{province: pro_connaught, neighbor: pro_dingle_sea},
# 	{province: pro_connaught, neighbor: pro_donegal_sea},
# 	{province: pro_connaught, neighbor: pro_sligo},
# 	{province: pro_sligo, neighbor: pro_kildare},
# 	{province: pro_sligo, neighbor: pro_tyrone},
# 	{province: pro_sligo, neighbor: pro_donegal_sea},
# 	{province: pro_tyrone, neighbor: pro_donegal_sea},
# 	{province: pro_tyrone, neighbor: pro_irish_sea},
# 	{province: pro_tyrone, neighbor: pro_kildare},
# 	{province: pro_irish_sea, neighbor: pro_donegal_sea},
# 	{province: pro_irish_sea, neighbor: pro_dingle_sea},
# 	{province: pro_dingle_sea, neighbor: pro_donegal_sea}
# ])

# race_alom = Race.create(name:"Alom", description:"The Alom are the first and greatest of the children of Om, the Gods!", longevity:1000,fecundity:0,might:0,will:0,cunning:0,subtlety:0,perception:0,sagacity:0,scale:10)
# race_human = Race.create(name:"Human", description:"Humans are dull and normal", longevity:3, fecundity: 3, might: 3, will: 3, cunning: 3, subtlety: 3, perception: 3, sagacity: 3, scale: 1)
# race_goblin = Race.create(name:"Goblin", description:"Goblins are weak, sneaky, and evil", longevity:2, fecundity: 4, might: 2, will: 2, cunning: 4, subtlety: 4, perception: 3, sagacity: 2, scale: 1)
# race_elf = Race.create(name:"Elf", description:"Elves spend their long lives in harmony with nature", longevity: 5, fecundity: 2, might: 3, will: 4, cunning: 3, subtlety: 3, perception: 3, sagacity: 3, scale: 1)
# race_wyvern = Race.create(name:"Wyveryn", description:"Great winged reptiles with innate arcane talent, and an ancient language", longevity: 4, fecundity: 1, might: 5, will: 5, cunning: 3, subtlety: 2, perception: 3, sagacity: 4, scale: 3)
# race_monster = Race.create(name:"Monster", description:"A catch all term for great beasts", longevity: 3, fecundity: 3, might: 3, will: 3, cunning: 3, subtlety: 3, sagacity: 3, scale: 3)
# race_titan = Race.create(name:"Titan", description: "A catch all term for VERY great beings", longevity: 3, fecundity: 3, might: 3, will: 3, cunning: 3, subtlety: 3, sagacity: 3, scale: 5)

# # act_manwe = Actor.create(name:"Manwe", description:"Manwe is god of air and birds", race: race_alom, might: 4, will: 3, cunning: 2, subtlety: 3, perception: 5, sagacity: 3, count: 1, personality: "Player", mood:"Player")
# # act_aule = Actor.create(name:"Aule", description:"Aule is the just god of smiths", race: race_alom, might: 6, will: 5, cunning: 2, subtlety: 1, perception:4, sagacity: 3, count: 1, personality:"Player", mood:"Player")
# # act_yavanna = Actor.create(name:"Yavanna", description:"Yavanna is the goddess of trees and music", race: race_alom, might: 3, will: 2, subtlety: 5, perception: 4, cunning: 4, sagacity: 3, count: 1, personality:"Player", mood:"Player")

# # god_manwe = Deity.where(name:"Manwe", description:"Manwe is god of air and birds").first_or_create(name:"Manwe", description:"Manwe is god of air and birds", actor: act_manwe)
# # god_aule = Deity.where(name:"Aule", description:"Aule is the just god of smiths").first_or_create(name:"Aule", description:"Aule is the just god of smiths", actor: act_aule)
# # god_yavanna = Deity.where(name:"Yavanna", description:"Yavanna is the goddess of trees and music").first_or_create(name:"Yavanna", description:"Yavanna is the goddess of trees and music", actor: act_yavanna)

# # god_manwe.associate({"Wind" => 40, "Birds" => 40})
# # god_aule.associate({"Justice" => 40, "Smithing" => 40})
# # god_yavanna.associate({"Trees" => 40, "Music" => 40})

# act_eckbert = Actor.create(name:"Eckbert", description:"Eckbert is king of wessex, and owns part of ireland as well", race: race_human, might:0, will: 2, subtlety:2, perception: 2, sagacity: 2, cunning:2, count: 1, personality:"Subtle", mood:"Administer")
# act_macdougal = Actor.create(name:"MacDougal", description:"Leader of the west irish clans", race: race_human, might: 2, subtlety: 0, perception: 1, will: 1, sagacity:0, cunning: 1, count: 1, personality: "Mighty", mood:"Conquer")
# act_globrat = Actor.create(name:"Globrat the Terrible", description:"A giant among his people, Globrat rules the last of the irish goblin hodlouts", race: race_goblin, might: 3, subtlety: 0, perception: 1, will: 1, sagacity:0, cunning: 0, count: 1, personality:"Mighty", mood:"Defend")

# act_army_of_ireland = Actor.create(name:"Army of Ireland", description:"An army raised for the conquest of... whom?", race: race_human, might: 0, subtlety: 0, cunning: 0, sagacity: 0, perception: 0, will: 0, count: 1000, personality:"Obedient", mood:"Obedient")

# art_sword_of_celts = Artifact.create(name:"The Sword of Celts", description:"An ancient sword, imbued with power by ancient druids", owner:act_macdougal)
# art_orb_of_secrets = Artifact.create(name:"The Orb of Secrets", description:"The orb of secrets gives simple answers to a question once a year", owner:act_eckbert)
# art_doom_altar = Artifact.create(name:"The Altar of Doom", description: "Sacrifices made upon this altar are exra effective", province_id: 5)

# act_eckbert.associate({"Justice" => 2})
# art_sword_of_celts.associate({"Smithing" => 2})

# Province.all.each do |prov|

# 	if prov.get_development > 0.5
# 		if rand(4) == 3
# 			gen_race = race_human
# 			alt_race = race_goblin
# 		else
# 			gen_race = race_goblin
# 			alt_race = race_human
# 		end

# 		p = Population.create(province: prov, race: gen_race, piety: rand, count: rand(5000)+2000, loyalty:rand(5))
# 		gods = [god_manwe, god_yavanna, god_aule]
# 		gods.shuffle!
# 		(rand(2)+1).times do  
# 			size = rand
# 			Congregation.create(population: p, deity:gods.pop, clergy:(size*p.count/100).floor, laity: ((size*10 + rand(9) + 1)*p.count/100).floor, piety_multiplier: 1, manpower_multiplier:1, loyalty: rand(5)+1)
# 		end

# 		if rand(4) == 3
# 			p = Population.create(province: prov, race: alt_race, piety: rand, count: rand(2500)+2000, loyalty:rand(5))
# 			gods = [god_manwe, god_yavanna, god_aule]
# 			gods.shuffle!
# 			(rand(2)+1).times do  
# 				size = rand
# 				Congregation.create(population: p, deity:gods.pop, clergy:(size*p.count/100).floor, laity: ((size*10 + rand(9) + 1)*p.count/100).floor, piety_multiplier: 1, manpower_multiplier:1, loyalty: rand(5)+1)
# 			end
# 		end

# 	end

# end

# org_united_goblin_tribes = Organization.create(name:"United Goblin Tribes", description:"A loose federation of free goblin tribes", is_church:0, is_kingdom:1, leader:act_globrat, governance:"Tribal Federation")
# org_kingdom_of_wessex = Organization.create(name:"Kingdom of Wessex", description:"A mostly United England", is_church:0, is_kingdom:1, leader: act_eckbert, governance:"Monarchy")
# org_dukedom_of_ireland = Organization.create(name:"Duchy of Ireland", description:"Free Irish Provinces", is_church:0, is_kingdom:1, leader:act_macdougal, governance:"Monarchy")
# org_church_of_aule = Organization.create(name:"The Church of Aule", description:"A church dedicated to smiths and justice", is_church:1, is_kingdom:0, governance:"Council of Elders")
# org_church_of_yevenna = Organization.create(name:"The Church of Yevenna", description:"A church dedicated to music and trees", is_church:1, is_kingdom:0, governance:"Council of Elders")
# org_bardic_college = Organization.create(name:"The Fellowship", description:"A guild of talented musicians", is_church:0, is_kingdom:0, suzerain:org_church_of_yevenna, governance:"Council of Elders")

# org_kingdom_of_wessex.spread(pro_ulster)
# org_kingdom_of_wessex.spread(pro_ulster)
# org_dukedom_of_ireland.spread_region(reg_west_ireland)
# org_united_goblin_tribes.spread(pro_leinster)
# org_united_goblin_tribes.spread(pro_kildare)

# org_church_of_aule.spread(Congregation.where(deity: god_aule).order(clergy: :desc).first.population.province)
# org_church_of_aule.spread(Congregation.where(deity: god_aule).order(clergy: :desc).second.population.province)

# user_kit = User.create(username:"Kit", email:"krobinson.dev@gmail.com", password:"password", access:3)
# user_linas = User.create(username:"Linas", email:"linas@gmail.com", password:"password", access:1)

# post_hail = Post.create(user:user_kit, title:"Hail!", content:"Welcome to the game!")
# post_wellmet = Post.create(user:user_linas, title: "Well Met!", content: "pleased to be here!", reference: post_hail)

# message_hail = Message.create(user:user_kit, title:"Hail!", content:"Welcome to the game!")
# message_wellmet = Message.create(user:user_linas, title: "Well Met!", content: "pleased to be here!", reference: message_hail)

# recip_hail = Recipient.create(message:message_hail, user:user_kit)
# recip_wellmet = Recipient.create(message:message_wellmet, user:user_kit)

# god_manwe.update(user: user_kit)
# god_aule.update(user:user_kit)
# god_yavanna.update(user:user_linas)

# p_thebirds = Power.create(name:"The Birds", effect:"Birds attack everybody!", deity: god_manwe)
# p_thebirds.associate({"Birds" => 6})
# p_test_of_iron = Power.create(name:"The Test of Iron", effect:"Priests of Aule can tell truth or falsehood with burning iron", deity: god_aule)
# p_test_of_iron.associate({"Smithing" => 4, "Justice" => 5})


# ------------------------------------------------- #
# seeds for user profiles
