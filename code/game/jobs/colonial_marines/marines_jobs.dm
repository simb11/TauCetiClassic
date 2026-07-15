/datum/department/colonial_marines_event/commanding
	title = DEP_SGMC_COMMAND
	head = JOB_COMMANDING_OFFICER
	order = 101
	color = "#7275ff"

/datum/job/colonial_marines_event/comm_officer
	title = JOB_COMMANDING_OFFICER
	departments = list(DEP_SGMC_COMMAND)
	order = CREW_INTEND_HEADS(1)
	total_positions = 1
	spawn_positions = 1
	supervisors = "High Command"
	selection_color = "#d5ceff"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/commanding_officer
	skillsets = list("Captain" = /datum/skillset/captain)

/datum/job/colonial_marines_event/comm_officer/get_access()
	return get_all_accesses()

/datum/job/colonial_marines_event/mp
	title = JOB_MP
	departments = list(DEP_SGMC_COMMAND)
	order = CREW_INTEND_EMPLOYEE(1)
	total_positions = 2
	spawn_positions = 2
	supervisors = "Commanding Officer"
	selection_color = "#ffc3a8"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/military_police
	skillsets = list("Captain" = /datum/skillset/captain)

/datum/job/colonial_marines_event/mp/get_access()
	return get_all_accesses()


/datum/department/colonial_marines_event/medical
	title = DEP_SGMC_MEDICAL
	head = JOB_FIELD_SURGEON
	order = 102
	color = "#00ff73"

/datum/job/colonial_marines_event/field_surgeon
	title = JOB_FIELD_SURGEON
	departments = list(DEP_SGMC_MEDICAL)
	order = CREW_INTEND_HEADS(2)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Commanding Officer"
	selection_color = "#acffd1"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/field_surgeon
	skillsets = list("Captain" = /datum/skillset/captain)

/datum/job/colonial_marines_event/field_surgeon/get_access()
	return get_all_accesses()

/datum/job/colonial_marines_event/nurse
	title = JOB_NURSE
	departments = list(DEP_SGMC_MEDICAL)
	order = CREW_INTEND_EMPLOYEE(1)
	total_positions = 2
	spawn_positions = 2
	supervisors = "Field Surgeon"
	selection_color = "#dfffed"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marines_nurse
	skillsets = list("Captain" = /datum/skillset/captain)

/datum/job/colonial_marines_event/nurse/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(istype(H.wear_id, /obj/item/weapon/card/id)) // check id card
		var/obj/item/weapon/card/id/id = H.wear_id
		id.sec_hud_icon = "marinesnurse"
		H.sec_hud_set_ID()
	return


/datum/department/colonial_marines_event/auxiliary
	title = DEP_SGMC_AUXILIARY_SUPPORT
	head = JOB_AUXILIARY_OFFICER
	order = 103
	color = "#00eeff"

/datum/job/colonial_marines_event/auxiliary_officer
	title = JOB_AUXILIARY_OFFICER
	departments = list(DEP_SGMC_AUXILIARY_SUPPORT)
	order = CREW_INTEND_HEADS(3)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Commanding Officer"
	selection_color = "#9ef9ff"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/auxiliary_officer
	skillsets = list("Captain" = /datum/skillset/captain)

/datum/job/colonial_marines_event/auxiliary_officer/get_access()
	return get_all_accesses()

/datum/job/colonial_marines_event/ordnance_technician
	title = JOB_ORDNANCE_TECHNICIAN
	departments = list(DEP_SGMC_AUXILIARY_SUPPORT)
	order = CREW_INTEND_EMPLOYEE(1)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Auxiliary Officer"
	selection_color = "#d2fcff"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine
	skillsets = list("Captain" = /datum/skillset/captain)

/datum/job/colonial_marines_event/mech_operator
	title = JOB_MECH_OPERATOR
	departments = list(DEP_SGMC_AUXILIARY_SUPPORT)
	order = CREW_INTEND_EMPLOYEE(2)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Auxiliary Officer"
	selection_color = "#d2fcff"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine
	skillsets = list("Captain" = /datum/skillset/captain)

/datum/job/colonial_marines_event/researcher
	title = JOB_RESEARCHER
	departments = list(DEP_SGMC_AUXILIARY_SUPPORT)
	order = CREW_INTEND_EMPLOYEE(3)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Auxiliary Officer"
	selection_color = "#d2fcff"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/researcher
	skillsets = list("Captain" = /datum/skillset/captain)



/datum/department/colonial_marines_event/alpha
	title = DEP_ALPHA_SQUAD
	head = JOB_ALPHA_LEADER
	order = 104
	color = "#ff0000"

/datum/job/colonial_marines_event/alpha_leader
	title = JOB_ALPHA_LEADER
	departments = list(DEP_ALPHA_SQUAD)
	order = CREW_INTEND_HEADS(4)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Commanding Officer"
	selection_color = "#fdcdcd"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine/squad_leader
	skillsets = list("Captain" = /datum/skillset/captain)


/datum/job/colonial_marines_event/alpha_smartgunner
	title = JOB_ALPHA_SMARTGUNNER
	departments = list(DEP_ALPHA_SQUAD)
	order = CREW_INTEND_EMPLOYEE(1)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Squad Leader"
	selection_color = "#ffe0e0"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine
	skillsets = list("Captain" = /datum/skillset/captain)


/datum/job/colonial_marines_event/alpha_specialist
	title = JOB_ALPHA_SPECIALIST
	departments = list(DEP_ALPHA_SQUAD)
	order = CREW_INTEND_EMPLOYEE(2)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Squad Leader"
	selection_color = "#ffe0e0"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine
	skillsets = list("Captain" = /datum/skillset/captain)


/datum/job/colonial_marines_event/alpha_corpsman
	title = JOB_ALPHA_CORPSMAN
	departments = list(DEP_ALPHA_SQUAD)
	order = CREW_INTEND_EMPLOYEE(3)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Squad Leader"
	selection_color = "#ffe0e0"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine
	skillsets = list("Captain" = /datum/skillset/captain)


/datum/job/colonial_marines_event/alpha_technician
	title = JOB_ALPHA_TECHNICIAN
	departments = list(DEP_ALPHA_SQUAD)
	order = CREW_INTEND_EMPLOYEE(4)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Squad Leader"
	selection_color = "#ffe0e0"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine
	skillsets = list("Captain" = /datum/skillset/captain)


/datum/job/colonial_marines_event/alpha_rifleman
	title = JOB_ALPHA_RIFLEMAN
	departments = list(DEP_ALPHA_SQUAD)
	order = CREW_INTEND_EMPLOYEE(5)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Squad Leader"
	selection_color = "#fff0f0"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine
	skillsets = list("Captain" = /datum/skillset/captain)


/datum/department/colonial_marines_event/bravo
	title = DEP_BRAVO_SQUAD
	head = JOB_BRAVO_LEADER
	order = 104
	color = "#eeff00"

/datum/job/colonial_marines_event/bravo_leader
	title = JOB_BRAVO_LEADER
	departments = list(DEP_BRAVO_SQUAD)
	order = CREW_INTEND_HEADS(4)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Commanding Officer"
	selection_color = "#faffad"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine
	skillsets = list("Captain" = /datum/skillset/captain)


/datum/job/colonial_marines_event/bravo_smartgunner
	title = JOB_BRAVO_SMARTGUNNER
	departments = list(DEP_BRAVO_SQUAD)
	order = CREW_INTEND_EMPLOYEE(1)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Squad Leader"
	selection_color = "#fbffc8"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine
	skillsets = list("Captain" = /datum/skillset/captain)


/datum/job/colonial_marines_event/bravo_specialist
	title = JOB_BRAVO_SPECIALIST
	departments = list(DEP_BRAVO_SQUAD)
	order = CREW_INTEND_EMPLOYEE(2)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Squad Leader"
	selection_color = "#fbffc8"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine
	skillsets = list("Captain" = /datum/skillset/captain)

/datum/job/colonial_marines_event/bravo_corpsman
	title = JOB_BRAVO_CORPSMAN
	departments = list(DEP_BRAVO_SQUAD)
	order = CREW_INTEND_EMPLOYEE(3)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Squad Leader"
	selection_color = "#fbffc8"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine
	skillsets = list("Captain" = /datum/skillset/captain)

/datum/job/colonial_marines_event/bravo_technician
	title = JOB_BRAVO_TECHNICIAN
	departments = list(DEP_BRAVO_SQUAD)
	order = CREW_INTEND_EMPLOYEE(4)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Squad Leader"
	selection_color = "#fbffc8"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine
	skillsets = list("Captain" = /datum/skillset/captain)

/datum/job/colonial_marines_event/bravo_rifleman
	title = JOB_BRAVO_RIFLEMAN
	departments = list(DEP_BRAVO_SQUAD)
	order = CREW_INTEND_EMPLOYEE(5)
	total_positions = 1
	spawn_positions = 1
	supervisors = "Squad Leader"
	selection_color = "#fcffdb"
	idtype = /obj/item/weapon/card/id/gold
	access = list() 			//See get_access()
	outfit = /datum/outfit/job/marine
	skillsets = list("Captain" = /datum/skillset/captain)

/datum/department/colonial_marines_event/aliens
	title = DEP_ALIENS
	head = "Xenomorph"
	order = 105
	color = "#a31898"

/datum/job/colonial_marines_event/xeno
	title = "Xenomorph"
	departments = list(DEP_ALIENS)
	order = CREW_INTEND_HEADS(5)
	total_positions = 0
	spawn_positions = 6
	supervisors = "mom"
	selection_color = "#c972c1"
