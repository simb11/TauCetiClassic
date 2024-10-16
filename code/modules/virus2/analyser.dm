/obj/machinery/disease2/diseaseanalyser
	name = "Disease Analyser"
	icon = 'icons/obj/virology.dmi'
	icon_state = "analyser"
	anchored = TRUE
	density = TRUE

	var/scanning = 0
	var/pause = 0

	var/obj/item/weapon/virusdish/dish = null
	required_skills = list(/datum/skill/research/trained, /datum/skill/chemistry/trained)

/obj/machinery/disease2/diseaseanalyser/attackby(obj/O, mob/user)
	if(!istype(O,/obj/item/weapon/virusdish))
		return

	if(dish)
		to_chat(user, "\The [src] is already loaded.")
		return
	if(!do_skill_checks(user))
		return
	dish = O
	user.drop_from_inventory(O, src)

	user.visible_message("[user] adds \a [O] to \the [src]!", "You add \a [O] to \the [src]!")

// A special paper that we can scan with the science tool
/obj/item/weapon/paper/virus_report
	var/list/symptoms = list()

/obj/machinery/disease2/diseaseanalyser/process()
	if(stat & (NOPOWER|BROKEN))
		return

	if(scanning)
		scanning -= 1
		if(scanning == 0)
			if (dish.virus2.addToDB())
				ping("\The [src] pings, \"New pathogen added to data bank.\"")

			var/obj/item/weapon/paper/virus_report/P = new /obj/item/weapon/paper/virus_report(src.loc)
			P.name = "paper - [dish.virus2.name()]"

			var/r = dish.virus2.get_info()
			P.info = {"
				[virology_letterhead("Post-Analysis Memo")]
				[r]
				<hr>
				<u>Additional Notes:</u>&nbsp;
"}
			P.update_icon()
			for(var/datum/disease2/effectholder/symptom in dish.virus2.effects)
				P.symptoms[symptom.effect.name] = symptom.effect.level

			dish.info = r
			dish.analysed = 1
			dish.loc = src.loc
			dish = null

			icon_state = "analyser"
			state("\The [src] prints a sheet of paper.")

	else if(dish && !scanning && !pause)
		if(dish.virus2)
			scanning = 5
			icon_state = "analyser_processing"
		else
			pause = 1
			spawn(25)
				dish.loc = src.loc
				dish = null

				state("\The [src] buzzes, \"Insufficient growth density to complete analysis.\"")
				pause = 0
	return
