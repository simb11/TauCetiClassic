/datum/department/colonial_marines_event
	order = 200

/datum/department/colonial_marines_event/isallowed()
	if(SSmapping.config.map_name != "SGS Rover")
		return FALSE
	return TRUE


/datum/job/colonial_marines_event


/datum/job/colonial_marines_event/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(istype(H.wear_id, /obj/item/weapon/card/id)) // check id card
		var/obj/item/weapon/card/id/id = H.wear_id
		id.sec_hud_icon = title
		H.sec_hud_set_ID()
	return

/datum/job/colonial_marines_event/map_check()
	if(SSmapping.config.map_name != "SGS Rover")
		return FALSE
	return TRUE



