/datum/outfit/late_party/ussp
	name = "Late Party: Communist"
	suit = /obj/item/clothing/suit/armor/vest/surplus
	l_ear = /obj/item/device/radio/headset
	uniform =/obj/item/clothing/under/soviet
	shoes = /obj/item/clothing/shoes/boots
	back = /obj/item/weapon/storage/backpack/kitbag
	suit_store = /obj/item/weapon/gun/projectile/shotgun/bolt_action

	backpack_contents = list(
	/obj/item/weapon/storage/box/space_suit/soviet,
	/obj/item/device/flashlight/seclite
	)

	l_pocket = /obj/item/ammo_box/magazine/a774clip
	r_pocket = /obj/item/ammo_box/magazine/a774clip

	belt = /obj/item/weapon/shovel/spade/soviet

	id = /obj/item/weapon/card/id/syndicate
	var/assignment = "Krasnoarmeets"
	var/list/surnames = list("Ivanov", "Petrov", "Vasilyev", "Semenov", "Mihailov", "Pavlov", "Fedorov", "Andreev", "Stepanov", "Smirnov", "Kuznetsov")

/datum/outfit/late_party/ussp/post_equip(mob/living/carbon/human/H)
	H.real_name = "[assignment] [pick(surnames)][H.gender == "male" ? "" : "a"]"
	H.name = H.real_name
	var/obj/item/weapon/card/id/syndicate/W = H.wear_id
	W.assignment = "[assignment]"
	W.assign(H.real_name)

	if(prob(30))
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/surplus(H), SLOT_HEAD)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/head/ushanka/black(H), SLOT_HEAD)


/datum/outfit/late_party/ussp/leader
	name = "Late Party: Soviet Leader"

	suit = /obj/item/clothing/suit/storage/comissar
	head = /obj/item/clothing/head/soviet_peaked_cap
	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/stechkin

	l_hand = /obj/item/device/megaphone

	back = /obj/item/weapon/storage/backpack/security

	backpack_contents = list(
	/obj/item/weapon/storage/box/space_suit/soviet,
	/obj/item/device/flashlight/seclite
	)

	l_pocket = /obj/item/ammo_box/magazine/stechkin
	r_pocket = /obj/item/ammo_box/magazine/stechkin

	belt = /obj/item/weapon/shovel/spade/soviet

	assignment = "Komissar"
	surnames = list("Makarov", "Zahaev", "Barkov", "Volkov")

/datum/outfit/late_party/ussp/leader/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.mind.skills.add_available_skillset(/datum/skillset/soviet_leader)
	H.mind.skills.maximize_active_skills()

//pirates
/datum/outfit/late_party/pirate
	name = "Late Party: Pirate"

	l_ear = /obj/item/device/radio/headset/syndicate/alt
	uniform = /obj/item/clothing/under/pirate
	shoes = /obj/item/clothing/shoes/boots/combat
	gloves = /obj/item/clothing/gloves/combat
	glasses = /obj/item/clothing/glasses/eyepatch
	back = /obj/item/weapon/storage/backpack/santabag

	backpack_contents = list(
		/obj/item/weapon/tank/emergency_oxygen/double,
		/obj/item/device/flashlight/seclite,
		/obj/item/weapon/plastique,
		/obj/item/weapon/grenade/empgrenade,
		/obj/item/ammo_box/magazine/silenced_pistol/nonlethal,
		/obj/item/weapon/extraction_pack/pirates
	)

	l_pocket = /obj/item/ammo_box/magazine/silenced_pistol/nonlethal
	r_pocket = /obj/item/weapon/storage/pouch/pistol_holster/silenced_pistol

	belt = /obj/item/weapon/storage/belt/utility/full

	id = /obj/item/weapon/card/id/syndicate

/datum/outfit/late_party/pirate/post_equip(mob/living/carbon/human/H)
	H.real_name = "[pick(global.first_names_male)] [pick(global.pirate_first)][pick(global.pirate_second)]"
	H.name = H.real_name
	var/obj/item/weapon/card/id/syndicate/W = H.wear_id
	W.assignment = "Pirate"
	W.assign(H.real_name)
	H.add_language(LANGUAGE_GUTTER)
	H.forced_language = LANGUAGE_GUTTER


/datum/outfit/late_party/pirate/leader
	name = "Late Party: Pirate Captain"

	glasses = /obj/item/clothing/glasses/thermal/eyepatch
	l_pocket = /obj/item/weapon/melee/energy/sword/pirate

/datum/outfit/late_party/pirate/leader/post_equip(mob/living/carbon/human/H)
	H.real_name = "Captain [pick(global.first_names_male)] Redskull"
	H.name = H.real_name
	var/obj/item/weapon/card/id/syndicate/W = H.wear_id
	W.assignment = "Pirate Captain"
	W.assign(H.real_name)
	H.add_language(LANGUAGE_GUTTER)
	H.forced_language = LANGUAGE_GUTTER

/obj/item/weapon/storage/pouch/pistol_holster/silenced_pistol
	startswith = list(/obj/item/weapon/gun/projectile/automatic/pistol/silenced/nonlethal)

//prisoners
/datum/outfit/late_party/prisoner
	name = "Late Party: Prisoner"

	l_ear = /obj/item/device/radio/headset
	mask = /obj/item/clothing/mask/breath
	suit = /obj/item/clothing/suit/space/cheap
	head = /obj/item/clothing/head/helmet/space/cheap
	uniform = /obj/item/clothing/under/color/orange
	shoes = /obj/item/clothing/shoes/orange
	belt = /obj/item/weapon/crowbar/red

	back = /obj/item/weapon/tank/jetpack/carbondioxide
	l_pocket = /obj/item/weapon/tank/emergency_oxygen
	r_pocket = /obj/item/weapon/kitchenknife/makeshift_shiv

	id = /obj/item/weapon/card/id

/datum/outfit/late_party/prisoner/post_equip(mob/living/carbon/human/H)
	if(H.gender == "male")
		H.real_name = "[pick(global.first_names_male)] [pick(global.last_names)]"
	else
		H.real_name = "[pick(global.first_names_female)] [pick(global.last_names)]"

	H.name = H.real_name
	var/obj/item/weapon/card/id/W = H.wear_id
	W.assignment = "Prisoner"
	W.rank = W.assignment
	W.assign(H.real_name)
	H.sec_hud_set_ID()
	W.access = list(access_external_airlocks, access_maint_tunnels)
	H.add_language(LANGUAGE_GUTTER)
	H.forced_language = LANGUAGE_GUTTER

//Deserters
/datum/outfit/late_party/deserter
	name = "Late Party: Deserter"

	l_ear = /obj/item/device/radio/headset/headset_sec/marinad
	mask = /obj/item/clothing/mask/breath
	glasses = /obj/item/clothing/glasses/sunglasses/hud/sechud/tactical
	suit = /obj/item/clothing/suit/space/surplus
	suit_store = /obj/item/weapon/gun/projectile/automatic/m41a
	head = /obj/item/clothing/head/helmet/space/surplus
	uniform = /obj/item/clothing/under/tactical/marinad
	gloves = /obj/item/clothing/gloves/security/marinad
	shoes = /obj/item/clothing/shoes/boots
	back = /obj/item/weapon/storage/backpack/dufflebag/marinad

	l_pocket = /obj/item/weapon/tank/emergency_oxygen/double
	r_pocket = /obj/item/weapon/storage/pouch/pistol_holster/marines

	id = /obj/item/weapon/card/id

	belt = /obj/item/weapon/storage/belt/security/tactical/deserters

/obj/item/weapon/storage/belt/security/tactical/deserters
	startswith = list(
	/obj/item/ammo_box/magazine/m41a = 3,
	/obj/item/ammo_box/magazine/colt = 2,
	/obj/item/device/flashlight/seclite = 1,
	/obj/item/weapon/kitchenknife/combat = 1,
	/obj/item/weapon/lighter = 1,
	/obj/item/weapon/storage/fancy/cigarettes = 1)

/datum/outfit/late_party/deserter/post_equip(mob/living/carbon/human/H)
	if(H.gender == "male")
		H.real_name = "[pick(global.first_names_male)] [pick(global.last_names)]"
	else
		H.real_name = "[pick(global.first_names_female)] [pick(global.last_names)]"

	H.name = H.real_name
	var/obj/item/weapon/card/id/W = H.wear_id
	W.assignment = "Marine"
	W.rank = W.assignment
	W.assign(H.real_name)
	H.sec_hud_set_ID()
	W.access = list(access_external_airlocks, access_maint_tunnels)


/datum/outfit/late_party/military_police
	name = "Late Party: Military Police"
	uniform = /obj/item/clothing/under/tactical/marinad
	suit = /obj/item/clothing/suit/armor/vest/fullbody/military_police
	suit_store = /obj/item/weapon/gun/projectile/automatic/l13
	head = /obj/item/clothing/head/helmet/tactical/marinad/leader
	glasses = /obj/item/clothing/glasses/sunglasses/hud/sechud/tactical
	gloves = /obj/item/clothing/gloves/security/marinad
	belt = /obj/item/weapon/storage/belt/security/tactical/military_police
	shoes = /obj/item/clothing/shoes/boots
	l_ear = /obj/item/device/radio/headset/headset_sec/marinad
	back = /obj/item/weapon/storage/backpack/security

	id = /obj/item/weapon/card/id

	l_pocket = /obj/item/weapon/crowbar/red
	r_pocket = /obj/item/weapon/tank/emergency_oxygen/double

	backpack_contents = list(
	/obj/item/weapon/storage/firstaid/small_firstaid_kit/civilian,
	/obj/item/clothing/mask/gas/sechailer
	)

	implants = list(/obj/item/weapon/implant/mind_protect/loyalty)

	var/rank = "Cpl."
	var/assignment = "Military Police"

/obj/item/weapon/storage/belt/security/tactical/military_police
	startswith = list(
	/obj/item/ammo_box/magazine/l13 = 5,
	/obj/item/ammo_box/magazine/l13/lethal = 2,
	/obj/item/device/flashlight/seclite = 1,
	/obj/item/weapon/kitchenknife/combat = 1
	)

/datum/outfit/late_party/military_police/post_equip(mob/living/carbon/human/H)
	H.real_name = "[rank] [pick(global.last_names)]"
	H.name = H.real_name
	var/obj/item/weapon/card/id/ID = H.wear_id
	ID.registered_name = H.real_name
	ID.assignment = assignment
	ID.rank = assignment
	ID.access = list(access_security, access_sec_doors, access_brig, access_maint_tunnels)

	H.sec_hud_set_ID()


/datum/outfit/late_party/military_police/lieutenant
	name = "Late Party: Military Police Lieutenant"
	head = /obj/item/clothing/head/helmet/HoS //ОТДЕЛЬНЫЙ ТАЙП КОГДА ПОЯВИТСЯ СПРАЙТ
	glasses = /obj/item/clothing/glasses/sunglasses/hud/sechud
	suit = /obj/item/clothing/suit/armor/military_police_coat //СПРАЙТ
	suit_store = /obj/item/weapon/gun/projectile/revolver/heavy
	belt = /obj/item/weapon/storage/belt/security/tactical/military_police_lieutenant
	back = /obj/item/weapon/storage/backpack/satchel
	rank = "Lt."
	assignment = "Military Police Squad Leader"

/obj/item/weapon/storage/belt/security/tactical/military_police_lieutenant
	startswith = list(
	/obj/item/ammo_box/speedloader/a44 = 1,
	/obj/item/weapon/handcuffs = 3,
	/obj/item/weapon/shield/riot/tele = 1,
	/obj/item/device/flashlight/seclite = 1,
	/obj/item/weapon/kitchenknife/combat = 1,
	/obj/item/weapon/melee/telebaton = 1
	)

//inspection
/datum/outfit/late_party/inspector
	name = "Late Party: Inspector"

	l_ear = /obj/item/device/radio/headset/ert
	head = /obj/item/clothing/head/beret/centcomofficer
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/centcom/representative
	shoes = /obj/item/clothing/shoes/centcom
	belt = /obj/item/weapon/clipboard

	back = /obj/item/weapon/storage/backpack/satchel

	id = /obj/item/weapon/card/id/centcom/representative

	l_pocket = /obj/item/weapon/pen/blue
	r_pocket = /obj/item/device/camera

	backpack_contents = list(
	/obj/item/weapon/paper,
	/obj/item/weapon/storage/box/engineer
	)

	implants = list(/obj/item/weapon/implant/mind_protect/loyalty)

/datum/outfit/late_party/inspector/post_equip(mob/living/carbon/human/H)
	if(H.gender == "male")
		H.real_name = "[pick(global.first_names_male)] [pick(global.last_names)]"
	else
		H.real_name = "[pick(global.first_names_female)] [pick(global.last_names)]"

	H.name = H.real_name
	var/obj/item/weapon/card/id/W = H.wear_id
	W.rank = "Nanotrasen Representative"
	W.assign(H.real_name)
	ADD_TRAIT(H, TRAIT_NT_INSPECTOR, ROUNDSTART_TRAIT)


/datum/outfit/late_party/blueshield
	name = "Late Party: Blueshield"

	l_ear = /obj/item/device/radio/headset/headset_int/blueshield
	head = /obj/item/clothing/head/helmet/blueshield
	glasses = /obj/item/clothing/glasses/sunglasses/hud/sechud/tactical
	uniform = /obj/item/clothing/under/rank/blueshield
	suit = /obj/item/clothing/suit/storage/flak/blueshield
	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/weapon/storage/belt/security/late_party_blueshield

	back = /obj/item/weapon/storage/backpack/satchel

	id = /obj/item/weapon/card/id/blueshield

	l_pocket = /obj/item/device/pda/blueshield
	r_pocket = /obj/item/weapon/storage/pouch/pistol_holster/ert

	backpack_contents = list(
	/obj/item/weapon/storage/box/engineer,
	/obj/item/weapon/storage/firstaid/small_firstaid_kit/civilian
	)

	implants = list(/obj/item/weapon/implant/mind_protect/loyalty)

/datum/outfit/late_party/blueshield/post_equip(mob/living/carbon/human/H)
	if(H.gender == "male")
		H.real_name = "[pick(global.first_names_male)] [pick(global.last_names)]"
	else
		H.real_name = "[pick(global.first_names_female)] [pick(global.last_names)]"

	H.name = H.real_name
	var/obj/item/weapon/card/id/W = H.wear_id
	W.rank = "Blueshield Officer"
	W.assign(H.real_name)
	W.access = list(access_blueshield, access_heads, access_maint_tunnels,
	access_sec_doors, access_medical, access_research, access_mailsorting, access_engineering_lobby,
	access_security, access_engine)
	H.mind.skills.add_available_skillset(/datum/skillset/blueshield)
	H.mind.skills.maximize_active_skills()

/obj/item/weapon/storage/belt/security/late_party_blueshield
	startswith = list(
	/obj/item/ammo_box/magazine/glock/extended = 2,
	/obj/item/ammo_box/magazine/glock/extended/rubber = 3,
	/obj/item/weapon/melee/baton = 1,
	/obj/item/weapon/shield/riot/tele = 1
	)


/datum/outfit/late_party/assassin
	name = "Late Party: Assassin"

	l_ear = /obj/item/device/radio/headset/syndicate
	head = /obj/item/clothing/head/chameleon
	mask =  /obj/item/clothing/mask/chameleon
	glasses = /obj/item/clothing/glasses/chameleon
	uniform = /obj/item/clothing/under/chameleon
	suit = /obj/item/clothing/suit/chameleon
	shoes = /obj/item/clothing/shoes/chameleon
	gloves = /obj/item/clothing/gloves/chameleon
	belt = /obj/item/weapon/gun/projectile/chameleon

	back = /obj/item/weapon/storage/backpack/chameleon

	id = /obj/item/weapon/card/id/syndicate

	l_pocket = /obj/item/device/pda/syndicate
	r_pocket = /obj/item/weapon/gun/projectile/automatic/pistol/supb

	backpack_contents = list(
	/obj/item/weapon/storage/box/engineer,
	/obj/item/weapon/storage/firstaid/small_firstaid_kit/nutriment
	)

	implants = list(/obj/item/weapon/implant/dexplosive)

/datum/outfit/late_party/assassin/post_equip(mob/living/carbon/human/H)
	if(H.gender == "male")
		H.real_name = "[pick(global.first_names_male)] [pick(global.last_names)]"
	else
		H.real_name = "[pick(global.first_names_female)] [pick(global.last_names)]"

	H.name = H.real_name
	var/obj/item/weapon/card/id/W = H.wear_id
	W.assign(H.real_name)
	to_chat(H, "<span class='italics'>На тебя надет костюм-хамелеон. Используй его.</span>")
	H.add_language(LANGUAGE_SYCODE)
