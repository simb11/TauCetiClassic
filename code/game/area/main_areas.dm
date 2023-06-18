 //////////////
 //MAIN AREAS//
 //////////////

/area/space
	name = "Space"
	icon_state = "space"
	requires_power = 1
	always_unpowered = 1
	power_light = 0
	power_equip = 0
	power_environ = 0
	valid_territory = 0
	looped_ambience = 'sound/ambience/loop_space.ogg'
	is_force_ambience = TRUE
	ambience = list(
		'sound/ambience/space_1.ogg',
		'sound/ambience/space_2.ogg',
		'sound/ambience/space_3.ogg',
		'sound/ambience/space_4.ogg',
		'sound/ambience/space_5.ogg',
		'sound/ambience/space_6.ogg',
		'sound/ambience/space_7.ogg',
		'sound/ambience/space_8.ogg'
	)
	outdoors = TRUE
	var/dust_time = 0

/area/space/Enter(atom/movable/A)
	. = ..()
	if(ishuman(A))
		START_PROCESSING(SSobj, src)

/area/space/process()
	if(world.time > dust_time + 10 MINUTES)
		for(var/mob/living/carbon/human/T in src)
			spawns_dust_shells(target = T)
			dust_time = world.time

/area/start            // will be unused once kurper gets his login interface patch done
	name = "start area"
	icon_state = "start"
	requires_power = 0
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED
	has_gravity = 1

// other environment areas
/area/space/snow
	name = "Snow field"

/proc/spawns_dust_shells(target)
	for(var/i in 1 to 5)
		spawn_dust_shells(target)

/proc/spawn_dust_shells(mob/target)
	var/obj/item/projectile/bullet/pellet/dust/P
	var/dir
	var/step_target
	var/turf/spawn_turf = get_turf(target)
	dir = target.dir
	for(var/i in 1 to 9)
		spawn_turf = get_step(spawn_turf, dir)
	if(!isspaceturf(spawn_turf))
		return
	P = new(spawn_turf)
	step_target = get_step(target, dir)
	P.current = step_target
	P.starting = get_turf(P)
	P.original = step_target
	spawn(0)
		P.process()
