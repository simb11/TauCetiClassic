/datum/faction/late_party
	name = "Late Party"
	ID = F_LATE_PARTY
	logo_state = "late_party_logo"

	initroletype = /datum/role/late_party_member

	var/objective = /datum/objective

/datum/faction/late_party/forgeObjectives()
	. = ..()
	if(objective)
		AppendObjective(objective)

/datum/faction/late_party/communists
	name = F_LP_COMMUNISTS
	ID = F_LP_COMMUNISTS
	logo_state = "soviet"
	objective = /datum/objective/target/assassinate_heads
	initroletype = /datum/role/late_party_member/communist

/datum/faction/late_party/pirate
	name = F_LP_PIRATES
	ID = F_LP_PIRATES
	objective = /datum/objective/plunder
	logo_state = "raider-logo"
	initroletype = /datum/role/late_party_member/pirate
	var/booty = 0 //money stolen from station

/datum/faction/late_party/prisoners
	name = F_LP_PRISONERS
	ID = F_LP_PRISONERS
	objective = /datum/objective/escape
	logo_state = "prisoner"
	initroletype = /datum/role/late_party_member/prisoner

/datum/faction/late_party/deserters
	name = F_LP_DESERTERS
	ID = F_LP_DESERTERS
	objective = /datum/objective/escape
	logo_state = "deserters-logo"
	initroletype = /datum/role/late_party_member/deserter

/datum/faction/late_party/military_police
	name = F_LP_MILITARY_POLICE
	ID = F_LP_MILITARY_POLICE
	objective = /datum/objective/military_police_hunting
	logo_state = "nano-logo"
	initroletype = /datum/role/late_party_member/military_police

/datum/faction/late_party/nt_inspection
	name = F_LP_INSPECTON
	ID = F_LP_INSPECTON
	objective = /datum/objective/escape/nt_inspector
	logo_state = "nano-logo"
	initroletype = /datum/role/late_party_member/nt_inspector

/datum/faction/late_party/assassins
	name = F_LP_ASSASSINS
	ID = F_LP_ASSASSINS
	objective = /datum/objective/target/assassinate_nt_inspector
	logo_state = "synd-logo"
	initroletype = /datum/role/late_party_member/nt_inspector
