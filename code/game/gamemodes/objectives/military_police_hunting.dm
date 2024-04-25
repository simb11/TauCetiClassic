/datum/objective/military_police_hunting
	explanation_text = "Deserters must die."

/datum/objective/military_police_hunting/check_completion()
	var/list/deserters = list()

	for(var/mob/living/carbon/human/H in global.human_list)
		if(isdeserter(H))
			LAZYADD(deserters, H)

	for(var/mob/living/carbon/human/H in deserters)
		if(H.stat != DEAD)
			return OBJECTIVE_LOSS

	return OBJECTIVE_WIN

