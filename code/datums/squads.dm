/datum/squad
	var/name
	var/squad_trait = TRAIT_GENERIC_SQUAD_MEMBER
	var/mob/living/carbon/human/leader = null
	var/list/members = list()


/datum/squad/proc/assign_to_squad(mob/living/carbon/human/H)
	for(var/mob/living/carbon/human/member in members)
		if(H == member)
			return FALSE
	if(!leader)
		make_leader(H)
	members += H
	ADD_TRAIT(H, squad_trait, IMPLANT_TRAIT)
	return TRUE

/datum/squad/proc/remove_leader()
	leader = null
	return TRUE

/datum/squad/proc/make_leader(mob/living/carbon/human/H)
	if(leader)
		remove_leader()
	leader = H
	return TRUE

/datum/squad/proc/remove_from_squad(mob/living/carbon/human/H)
	members -= H
	REMOVE_TRAIT(H, squad_trait, IMPLANT_TRAIT)
	return TRUE

/datum/squad/alpha
	name = DEP_ALPHA_SQUAD
	squad_trait = TRAIT_ALPHA_SQUAD_MEMBER


/datum/squad/bravo
	name = DEP_BRAVO_SQUAD
	squad_trait = TRAIT_BRAVO_SQUAD_MEMBER

/obj/item/clothing/glasses/sunglasses/hud/sechud/tactical/event
	var/datum/squad/selected_squad

	item_action_types = list(
		/datum/action/item_action/hands_free/open_squads_menu,
	)

/datum/action/item_action/hands_free/open_squads_menu
	name = "Open Squads Menu"
	button_icon_state = "board"
	action_type = AB_INNATE


/datum/action/item_action/hands_free/open_squads_menu/Activate()
	var/obj/item/clothing/glasses/sunglasses/hud/sechud/tactical/event/S = target
	S.ui_interact(usr)


/obj/item/clothing/glasses/sunglasses/hud/sechud/tactical/ui_interact(mob/user)
	var/dat = "<div class='Section__title'>Squads Information</div>"
	for(var/datum/squad/squad in global.colonial_marines_squads)
		if(squad.members.len == 0)
			continue
		dat += "<div class='Section'>"
		dat += "<div><h1>[squad.name]</h1></div>"
		if(squad.leader)
			dat += "<div><h2>Leader: [squad.leader.name] ([squad.leader.job])</h2></div>"
		for(var/mob/living/carbon/human/member in squad.members)
			if(squad.leader.name == member.name)
				continue
			dat += "<div>[member.name] ([member.job])</div>"


		dat += "</div>"

	var/datum/browser/popup = new(user, "main", "Tactical HUD", 520, 605)	//Set up the popup browser window
	popup.set_content(dat)
	popup.open()
