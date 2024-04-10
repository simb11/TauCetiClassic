/datum/faction/late_party
	name = "Late Party"
	ID = F_LATE_PARTY
	logo_state = "late_party_logo"

	initroletype = /datum/role/late_party_member

	var/objective = /datum/objective

/datum/faction/late_party/New()
	..()
	AppendObjective(objective)

/datum/faction/late_party/communists
	name = F_LP_COMMUNISTS
	ID = F_LP_COMMUNISTS
	logo_state = "soviet"
	initroletype = /datum/role/late_party_member/communist
	objective = /datum/objective/target/assassinate_heads
