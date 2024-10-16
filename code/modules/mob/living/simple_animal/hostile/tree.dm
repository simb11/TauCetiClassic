/mob/living/simple_animal/hostile/tree
	name = "pine tree"
	desc = "A pissed off tree-like alien. It seems annoyed with the festivities..."
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_1"
	icon_living = "pine_1"
	icon_dead = "pine_1"
	icon_gib = "pine_1"
	speak_chance = 0
	turns_per_move = 5
	w_class = SIZE_GYGANT
	response_help = "brushes the"
	response_disarm = "pushes the"
	response_harm = "hits the"
	speed = -1
	maxHealth = 250
	health = 250

	pixel_x = -16

	harm_intent_damage = 5
	melee_damage = 10
	attacktext = "gnaw"
	attack_sound = list('sound/weapons/bite.ogg')

	//Space carp aren't affected by atmos.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	faction = "carp"
	has_head = TRUE
	has_arm = TRUE

/mob/living/simple_animal/hostile/tree/FindTarget()
	. = ..()
	if(.)
		me_emote("growls at [.]")

/mob/living/simple_animal/hostile/tree/AttackingTarget()
	. =..()
	var/mob/living/L = .
	if(istype(L))
		if(prob(15))
			L.Weaken(3)
			L.visible_message("<span class='danger'>\the [src] knocks down \the [L]!</span>")

/mob/living/simple_animal/hostile/tree/death()
	..()
	visible_message("<span class='warning'><b>[src]</b> is hacked into pieces!</span>")
	new /obj/item/stack/sheet/wood(loc)
	qdel(src)
