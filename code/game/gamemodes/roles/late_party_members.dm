/datum/role/late_party_member
	name = LATE_PARTY_MEMBER
	id = LATE_PARTY_MEMBER
	disallow_job = TRUE

	logo_state = "late_party_logo"
	antag_hud_type = ANTAG_HUD_LATE_PARTY
	antag_hud_name = "hud_late_party_member"
	skillset_type = /datum/skillset/max

/datum/role/late_party_member/communist
	name = LATE_PARTY_MEMBER_COMMUNIST
	id = LATE_PARTY_MEMBER_COMMUNIST
	disallow_job = TRUE

	logo_state = "soviet"
	skillset_type = /datum/skillset/soviet

/datum/role/late_party_member/communist/comissar
	name = "Comissar"
	skillset_type = /datum/skillset/soviet_leader
