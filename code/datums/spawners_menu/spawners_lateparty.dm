var/global/datum/late_party/current_late_party

/datum/spawner/late_party
	name = "Поздняя Группа"
	desc = "."
	ranks = list(ROLE_GHOSTLY)
	priority = 1001

	register_only = TRUE

	var/datum/late_party/late_party_type
	var/list/datum/late_party/possible_parties = list()


/datum/spawner/late_party/New()
	for(var/party_type in subtypesof(/datum/late_party))
		var/datum/late_party/party = new party_type
		if(!party.name)
			qdel(party)
			continue
		LAZYADD(possible_parties, party)
	late_party_type = pick(possible_parties)
	global.current_late_party = late_party_type
	//time_for_registration = rand(25 MINUTES, 45 MINUTES)
	time_for_registration = rand(30 SECONDS, 45 SECONDS)
	positions = late_party_type.members.len
	to_chat(world, "[late_party_type.name]")
	to_chat(world, "[late_party_type.members.len]")
	..()


/datum/spawner/late_party/roll_registrations()
	if(registered_candidates.len < late_party_type.members.len)
		//REROLL
		for(var/party_type in subtypesof(/datum/late_party))
			var/datum/late_party/party = new party_type
			if(!party.name)
				qdel(party)
				continue
			LAZYADD(possible_parties, party)
		late_party_type = pick(possible_parties)
		time_for_registration = 5 MINUTES
		positions = late_party_type.members.len
		global.current_late_party = late_party_type
		start_timers()
		for(var/mob/dead/M in registered_candidates)
			to_chat(M, "<span class='notice'><B>Недостаточно кандидатов для создания поздней группы! Следующая попытка набора через 5 минут!</B></span>")
		return
	..()

/datum/spawner/late_party/spawn_body(mob/dead/spectator)
	var/datum/late_party_member/member = pick(late_party_type.members)
	LAZYREMOVE(late_party_type.members, member)
	to_chat(world, "[member.name]")

	var/client/C = spectator.client

	var/datum/faction/F = find_faction_by_type(member.faction)
	var/mob/living/carbon/human/H = new(null)
	C.create_human_apperance(H)

	var/turf/T = pick(landmarks_list[member.spawnloc])
	H.loc = get_turf(T)
	H.key = C.key

	create_and_setup_role(member.role, H)
	add_faction_member(F, H, FALSE, TRUE)
	H.equipOutfit(member.outfit)
	to_chat(H, "<B>Вот ты и здесь...</B>")
	if(member.fluff_text)
		to_chat(H, "[member.fluff_text]")


/datum/late_party
	var/name
	var/list/datum/late_party_member/members = list() //members of lateparty (/datum/late_party_member)

/datum/late_party/proc/post_spawn()                   //for announcements and events after the party appears.
	return

/datum/late_party_member
	var/name = "Generic Name"
	var/datum/role/role                               //member role
	var/datum/faction/faction                         //member faction
	var/spawnloc                                      //spawn landmark name
	var/outfit                                        //holder outfit
	var/fluff_text

////////////////////////////////Communists!///////////////////////////////////////////////////////////

/datum/late_party/test

/datum/late_party/commy
	name = "Отряд СССП"
	members = list(
	/datum/late_party_member/soviet_soldier,
	///datum/late_party_member/soviet_soldier,
	///datum/late_party_member/soviet_soldier,
	///datum/late_party_member/soviet_soldier,
	///datum/late_party_member/soviet_soldier,
	///datum/late_party_member/soviet_soldier,
	///datum/late_party_member/soviet_soldier,
	///datum/late_party_member/soviet_comissar
	)

/datum/late_party_member/soviet_soldier
	name = "Красноармеец"
	role = /datum/role/late_party_member
	faction = /datum/faction/late_party/communists
	spawnloc = "lp_communist"
	outfit = /datum/outfit/responders/ussp
	fluff_text = "Ты - солдат взвода СССП! Верховное Командование дало твоему вздводу задание - захватить и освободить [station_name_ru] от влияния треклятых капиталистов! Буржуев-глав - к стенке, а их работникам нечего терять, кроме цепей!"

/datum/late_party_member/soviet_commisar
    name = "Коммисар"
    role = /datum/role/late_party_member/communist/comissar
    faction = /datum/faction/late_party/communists
    spawnloc = "lp_comissar"
    outfit = /datum/outfit/responders/ussp/leader
    fluff_text = "Ты - <B>комиссар</B> взвода СССП! Верховное Командование дало твоему вздводу задание - захватить и освободить [station_name_ru] от влияния треклятых капиталистов! Буржуев-глав - к стенке, а их работникам нечего терять, кроме цепей!"
