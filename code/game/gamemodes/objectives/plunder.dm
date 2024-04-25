/datum/objective/plunder
	var/needed_amount = 100000

/datum/objective/plunder/New()
	explanation_text = "Plunder [needed_amount] credits!"
	..()

/datum/objective/plunder/check_completion()
	var/datum/faction/responders/pirates/P = find_faction_by_type(/datum/faction/responders/pirates)
	var/datum/faction/late_party/pirate/L = find_faction_by_type(/datum/faction/late_party/pirate)
	if((!isnull(P) && ((P.booty < needed_amount)) || (!isnull(L) && (L.booty < needed_amount))))
		return OBJECTIVE_LOSS
	return OBJECTIVE_WIN
