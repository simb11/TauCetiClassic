
//------------SPACE SUIT------------

//Cheap
/datum/design/space_suit_cheap
	name = "Budget spacesuit"
	id = "space_suit_cheap"
	build_type = MINEFAB
	build_path = /obj/item/clothing/suit/space/cheap
	materials = list(MAT_METAL=10000,MAT_GLASS=500,MAT_PLASTIC=1000)
	construction_time = 150
	category = list("Spacesuit")

/datum/design/space_suit_hlemet_cheap
	name = "Budget spacesuit helmet"
	id = "space_suit_hlemet_cheap"
	build_type = MINEFAB
	build_path = /obj/item/clothing/head/helmet/space/cheap
	materials = list(MAT_METAL=1000,MAT_GLASS=500)
	construction_time = 50
	category = list("Spacesuit")

//Common buble
/datum/design/space_suit
	name = "Space suit"
	id = "space_suit"
	build_type = MINEFAB
	req_tech = list("materials" = 2)
	build_path = /obj/item/clothing/suit/space/globose
	materials = list(MAT_METAL=40000,MAT_GLASS=2000,MAT_PLASTIC=5000)
	construction_time = 500
	category = list("Spacesuit")

/datum/design/space_suit_hlemet
	name = "Space suit hlemet"
	id = "space_suit_hlemet"
	build_type = MINEFAB
	req_tech = list("materials" = 2)
	build_path = /obj/item/clothing/head/helmet/space/globose
	materials = list(MAT_METAL=5000,MAT_GLASS=3000)
	construction_time = 100
	category = list("Spacesuit")

//Mining buble
/datum/design/space_suit_mining
	name = "Mining Space suit"
	id = "space_suit_mining"
	build_type = MINEFAB
	req_tech = list("combat" = 2, "materials" = 3, "engineering" = 2)
	build_path = /obj/item/clothing/suit/space/globose/mining
	materials = list(MAT_METAL=50000,MAT_GLASS=2000,MAT_PLASTIC=3000,MAT_SILVER=3000)
	construction_time = 1200
	category = list("Spacesuit")

/datum/design/space_suit_hlemet_mining
	name = "Space suit hlemet"
	id = "space_suit_hlemet_mining"
	build_type = MINEFAB
	req_tech = list("combat" = 2, "materials" = 3, "engineering" = 2)
	build_path = /obj/item/clothing/head/helmet/space/globose/mining
	materials = list(MAT_METAL=5000,MAT_GLASS=3000,MAT_SILVER=1000)
	construction_time = 400
	category = list("Spacesuit")

//Engineering rig
/datum/design/space_suit_engineering
	name = "engineering hardsuit"
	id = "space_suit_engineering"
	build_type = MINEFAB
	req_tech = list("powerstorage"= 3, "materials" = 4, "engineering" = 3)
	build_path = /obj/item/clothing/suit/space/rig/engineering
	materials = list(MAT_METAL=65000,MAT_GLASS=2000,MAT_PLASTIC=5000,MAT_SILVER=6000)
	construction_time = 1800
	category = list("Spacesuit")

/datum/design/space_suit_hlemet_engineering
	name = "engineering hardsuit helmet"
	id = "space_suit_hlemet_engineering"
	build_type = MINEFAB
	req_tech = list("powerstorage"= 3, "materials" = 4, "engineering" = 3)
	build_path = /obj/item/clothing/head/helmet/space/rig/engineering
	materials = list(MAT_METAL=7500,MAT_GLASS=3000,MAT_SILVER=4000)
	construction_time = 600
	category = list("Spacesuit")

//Atmospherics rig (bs12)
/datum/design/space_suit_atmospherics
	name = "atmospherics hardsuit"
	id = "space_suit_atmospherics"
	build_type = MINEFAB
	req_tech = list("phorontech" = 2, "materials" = 4, "engineering" = 3)
	build_path = /obj/item/clothing/suit/space/rig/atmos
	materials = list(MAT_METAL=50000,MAT_GLASS=2000,MAT_PLASTIC=5000,MAT_SILVER=6000)
	construction_time = 1400
	category = list("Spacesuit")

/datum/design/space_suit_hlemet_atmospherics
	name = "atmospherics hardsuit helmet"
	id = "space_suit_hlemet_atmospherics"
	build_type = MINEFAB
	req_tech = list("phorontech" = 2, "materials" = 4, "engineering" = 3)
	build_path = /obj/item/clothing/head/helmet/space/rig/atmos
	materials = list(MAT_METAL=5000,MAT_GLASS=3000,MAT_SILVER=4000)
	construction_time = 400
	category = list("Spacesuit")

//Medical rig
/datum/design/space_suit_medical
	name = "medical hardsuit"
	id = "space_suit_atmospherics"
	build_type = MINEFAB
	req_tech = list("biotech"=3, "materials" = 4, "engineering" = 3)
	build_path = /obj/item/clothing/suit/space/rig/atmos
	materials = list(MAT_METAL=45000,MAT_GLASS=2000,MAT_PLASTIC=5000,MAT_SILVER=3000)
	construction_time = 1400
	category = list("Spacesuit")

/datum/design/space_suit_hlemet_medical
	name = "medical hardsuit helmet"
	id = "space_suit_hlemet_medical"
	build_type = MINEFAB
	req_tech = list("biotech"=3, "materials" = 4, "engineering" = 3)
	build_path = /obj/item/clothing/head/helmet/space/rig/atmos
	materials = list(MAT_METAL=5000,MAT_GLASS=3000,MAT_SILVER=1500)
	construction_time = 400
	category = list("Spacesuit")

//Mining rig
/datum/design/space_suit_mining_rig
	name = "mining hardsuit"
	id = "space_suit_mining_rig"
	build_type = MINEFAB
	req_tech = list("combat" = 3, "biotech"=2, "materials" = 4, "engineering" = 3)
	build_path = /obj/item/clothing/suit/space/rig/security
	materials = list(MAT_METAL=75000,MAT_GLASS=6000,MAT_PLASTIC=8000,MAT_GOLD=4000,MAT_DIAMOND=4000,MAT_URANIUM=6000)
	construction_time = 1800
	category = list("Spacesuit")

/datum/design/space_suit_hlemet_mining_rigl
	name = "mining hardsuit helmet"
	id = "space_suit_hlemet_mining_rig"
	build_type = MINEFAB
	req_tech = list("combat" = 3, "biotech"=2, "materials" = 4, "engineering" = 3)
	build_path = /obj/item/clothing/head/helmet/space/rig/security
	materials = list(MAT_METAL=6000,MAT_GLASS=3000,MAT_PLASTIC=2000,MAT_GOLD=1000,MAT_DIAMOND=500,MAT_URANIUM=1000)
	construction_time = 600
	category = list("Spacesuit")

//Security rig
/datum/design/space_suit_security
	name = "medical hardsuit"
	id = "space_suit_security"
	build_type = MINEFAB
	req_tech = list("combat" = 5, "biotech"=3, "materials" = 5, "engineering" = 4)
	build_path = /obj/item/clothing/suit/space/rig/security
	materials = list(MAT_METAL=80000,MAT_GLASS=6000,MAT_PLASTIC=8000,MAT_GOLD=7000,MAT_DIAMOND=8000,MAT_URANIUM=12000)
	construction_time = 3600
	category = list("Spacesuit")

/datum/design/space_suit_hlemet_security
	name = "security hardsuit helmet"
	id = "space_suit_hlemet_security"
	build_type = MINEFAB
	req_tech = list("combat" = 5, "biotech"=3, "materials" = 5, "engineering" = 4)
	build_path = /obj/item/clothing/head/helmet/space/rig/security
	materials = list(MAT_METAL=8000,MAT_GLASS=4000,MAT_PLASTIC=2000,MAT_GOLD=4000,MAT_DIAMOND=2000,MAT_URANIUM=4000)
	construction_time = 1600
	category = list("Spacesuit")