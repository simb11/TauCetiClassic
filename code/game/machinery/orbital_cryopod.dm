/obj/machinery/cryopod_orbital
	name = "cryogenic freezer"
	desc = "A man-sized pod for entering suspended animation."
	icon = 'icons/obj/Cryogenic3.dmi'
	icon_state = "sleeper-open"
	density = TRUE
	anchored = TRUE

/obj/machinery/cryopod_orbital/proc/insert(mob/M)
	M.forceMove(src)
	icon_state = "sleeper"
	occupant = M

/obj/machinery/cryopod_orbital/proc/go_out()
	step(occupant, dir)
	occupant = null
	icon_state = "sleeper-open"

/obj/machinery/cryopod_orbital/relaymove(mob/user)
	go_out()

