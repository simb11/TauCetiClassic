/proc/pick_late_party()
	for(var/party_type in subtypesof(/datum/late_party))
		var/list/security = list()
		var/list/command = list()
		var/datum/late_party/party = new party_type

		if(!party.name)
			qdel(party)
			continue


		if(player_list.len < party.req_players)
			continue

		for(var/mob/M in global.player_list)
			if(M.mind?.assigned_role in security_positions)
				LAZYADD(security, M)
			if(M.mind?.assigned_role in command_positions)
				LAZYADD(command, M)
		if(security.len < party.req_security)
			continue
		if(command.len < party.req_command)
			continue
		if(party.already_used == TRUE)
			continue

		LAZYADD(global.possible_late_parties, party)

	if(global.possible_late_parties.len == 0)
		addtimer(CALLBACK(PROC_REF(pick_late_party)), 5 MINUTE)
		return
	create_spawners(/datum/spawner/late_party, 0)

/datum/spawner/late_party
	name = "Поздняя Группа"
	desc = "Вернитесь на станцию в качестве члена одной из поздних групп, например - пиратов или дезертиров!"
	ranks = list(ROLE_GHOSTLY)
	priority = 99

	register_only = TRUE

	var/datum/late_party/late_party_type
	var/list/datum/late_party/possible_parties = list()

/datum/spawner/late_party/New()
	late_party_type = pick(global.possible_late_parties)
	time_for_registration = rand(30 MINUTES, 45 MINUTES)
	positions = late_party_type.members.len
	..()


/datum/spawner/late_party/registration(mob/dead/spectator)
	if(!istype(spectator, /mob/dead/observer))
		to_chat(spectator, "<span class='danger'><B>Стать членом поздней группы может только умерший!</B></span>")
		return
	var/mob/dead/observer/ghost = spectator
	if(!ghost.can_reenter_corpse)
		to_chat(ghost, "<span class='danger'><B>Стать членом поздней группы может только умерший!</B></span>")
		return
	..()

/datum/spawner/late_party/roll_registrations()
	if(registered_candidates.len < late_party_type.members.len)
		time_for_registration = 5 MINUTES
		start_timers()
		for(var/mob/dead/M in registered_candidates)
			to_chat(M, "<span class='notice'><B>Недостаточно кандидатов для создания поздней группы! Следующая попытка набора через 5 минут!</B></span>")
		return
	..()

/datum/spawner/late_party/spawn_body(mob/dead/spectator)
	var/datum/late_party_member/mem = pick(late_party_type.members)
	var/datum/late_party_member/member = new mem
	LAZYREMOVE(late_party_type.members, member)

	var/client/C = spectator.client

	var/datum/faction/F = create_uniq_faction(member.faction)
	var/mob/living/carbon/human/H = new(null)

	if(member.appearance_customization)
		to_chat(C, "<span class='italics'>Твоя роль - <B>[member.name]</B></span>")
		C.create_human_apperance(H)
	else
		member.set_appearance(H)

	var/turf/T = pick(landmarks_list[member.spawnloc])
	H.loc = get_turf(T)
	H.key = C.key

	add_faction_member(F, H, FALSE, TRUE)
	H.equipOutfit(member.outfit)
	if(member.fluff_text)
		to_chat(H, "[member.fluff_text]")

	if(member.role_alert)
		H.playsound_local(null, member.role_alert, VOL_EFFECTS_MASTER, null, FALSE)

	if(late_party_type.members.len <= 1)
		late_party_type.already_used = TRUE
		late_party_type.after_spawn_lateparty()

/datum/late_party
	var/name
	var/list/datum/late_party_member/members = list() //members of lateparty (/datum/late_party_member)
	var/req_players = 20                              //number of players for party choose
	var/req_security = 0                              //number of security or command roles to choose the party
	var/req_command = 0
	var/already_used = FALSE                          //was it already in the round?

/datum/late_party/proc/after_spawn_lateparty() //for announcements and other things
	return

/datum/late_party_member
	var/name = "Generic Name"
	var/datum/faction/faction                         //member faction
	var/spawnloc                                      //spawn landmark name
	var/outfit                                        //holder outfit
	var/fluff_text
	var/appearance_customization = TRUE               //if FALSE use set_appearance()
	var/role_alert                                    //alarm s played after the giving role

/datum/late_party_member/proc/set_appearance(mob/living/carbon/human/H)
	return TRUE


//Communists!
/datum/late_party/commy
	name = "Отряд СССП"
	req_security = 3
	req_command = 1
	members = list(
	/datum/late_party_member/soviet_soldier,
	/datum/late_party_member/soviet_soldier,
	/datum/late_party_member/soviet_soldier,
	/datum/late_party_member/soviet_soldier,
	/datum/late_party_member/soviet_soldier,
	/datum/late_party_member/soviet_soldier,
	/datum/late_party_member/soviet_soldier,
	/datum/late_party_member/soviet_comissar
	)

/datum/late_party_member/soviet_soldier
	name = "Красноармеец"
	faction = /datum/faction/late_party/communists
	spawnloc = "lp_communist"
	outfit = /datum/outfit/late_party/ussp
	fluff_text = "<span class='danger'>Ты - солдат взвода СССП. Верховное Командование дало твоему взводу задание - <B>захватить и освободить одну из станций от влияния треклятых капиталистов</B>! Буржуев-глав - к стенке, а их работникам нечего терять, кроме цепей!</span>"
	role_alert = 'sound/antag/soviets_alert.ogg'

/datum/late_party_member/soviet_comissar
	name = "Комиссар"
	faction = /datum/faction/late_party/communists
	spawnloc = "lp_comissar"
	outfit = /datum/outfit/late_party/ussp/leader
	fluff_text = "<span class='danger'>Ты - <B>комиссар</B> взвода СССП. Верховное Командование дало твоему взводу задание - <B>захватить и освободить одну из станций от влияния треклятых капиталистов</B>! Буржуев-глав - к стенке, а их работникам нечего терять, кроме цепей!</span>"
	role_alert = 'sound/antag/soviets_alert.ogg'


//Raiders!
/datum/late_party/vox
	name = "Воксы-налётчики"
	req_security = 3
	members = list(
	/datum/late_party_member/vox,
	/datum/late_party_member/vox,
	/datum/late_party_member/vox,
	/datum/late_party_member/vox,
	/datum/late_party_member/vox,
	/datum/late_party_member/vox,
	/datum/late_party_member/vox,
	/datum/late_party_member/vox
	)

/datum/late_party_member/vox
	name = "Вокс-налётчик"
	faction = /datum/faction/heist
	spawnloc = "Heist"
	outfit = /datum/outfit //see H.equip_vox_raider()
	appearance_customization = FALSE

/datum/late_party_member/vox/set_appearance(mob/living/carbon/human/H)
	H.set_species(VOX)

	var/sounds = rand(2, 8)
	var/newname = ""
	for(var/i in 1 to sounds)
		newname += pick(list("ti","hi","ki","ya","ta","ha","ka","ya","chi","cha","kah"))
	H.real_name = capitalize(newname)
	H.name = H.real_name

	H.age = rand(5, 15) // its fucking lore
	H.add_language(LANGUAGE_VOXPIDGIN)
	var/datum/faction/heist/heist = find_faction_by_type(/datum/faction/heist)
	if(heist.members.len % 2 == 0 || prob(33)) // first vox always gets Sol, everyone else by random.
		H.add_language(LANGUAGE_SOLCOMMON)

	H.h_style = "Short Vox Quills"
	H.f_style = "Shaved"
	H.grad_style = "none"

	//Now apply cortical stack.
	var/obj/item/weapon/implant/cortical/I = new(H)
	I.inject(H, BP_HEAD)

	H.equip_vox_raider()
	H.regenerate_icons()




//Pirates!
/datum/late_party/pirates
	name = "Пираты"
	req_security = 3
	members = list(
	/datum/late_party_member/pirate,
	/datum/late_party_member/pirate,
	/datum/late_party_member/pirate,
	/datum/late_party_member/pirate,
	/datum/late_party_member/pirate,
	/datum/late_party_member/pirate,
	/datum/late_party_member/pirate,
	/datum/late_party_member/pirate_captain
	)

/datum/late_party_member/pirate
	name = "Пират"
	faction = /datum/faction/late_party/pirate
	spawnloc = "lp_pirate"
	outfit = /datum/outfit/late_party/pirate
	fluff_text = "<span class='danger'>Яррр! Ты - космический пират! Твоя команда решила нанести визит на станцию неподалёку и <B>как следует ограбить её</B>! Слушайся капитана и старайся никого не прикончить</span>!"

/datum/late_party_member/pirate_captain
	name = "Капитан Пиратов"
	faction = /datum/faction/late_party/pirate
	spawnloc = "lp_pirate_captain"
	outfit = /datum/outfit/late_party/pirate/leader
	fluff_text = "<span class='danger'>Яррр! Ты - <B>капитан</B> космических пиратов! Свистать всех наверх, <B>сегодня грабим (но не мочим, фортуна тебя дери!) корпоратов</B></span>!"


//Prisoners!
/datum/late_party/prisoners
	name = "Сбежавшие заключённые"
	req_security = 3
	members = list(
	/datum/late_party_member/prisoner,
	/datum/late_party_member/prisoner,
	/datum/late_party_member/prisoner,
	/datum/late_party_member/prisoner,
	/datum/late_party_member/prisoner,
	/datum/late_party_member/prisoner,
	/datum/late_party_member/prisoner,
	/datum/late_party_member/prisoner
	)

/datum/late_party/prisoners/after_spawn_lateparty()
	var/datum/announcement/announce = new /datum/announcement/centcomm/prisoners
	announce.play()

/datum/late_party_member/prisoner
	name = "Сбежавший Заключённый"
	faction = /datum/faction/late_party/prisoners
	spawnloc = "lp_prisoner"
	outfit = /datum/outfit/late_party/prisoner
	fluff_text = "<span class='danger'>Ты - сбежавший заключённый. Перевозивший тебя конвой оказался уничтожен. Ты и еще несколько заключенных взяли аварийные скафандры и прыгнули навстречу свободе, в открытый космос</span>."


//Deserters!
/datum/late_party/deserters
	name = "Дезертиры"
	members = list(
	/datum/late_party_member/deserter,
	/datum/late_party_member/deserter,
	/datum/late_party_member/deserter,
	/datum/late_party_member/deserter,
	/datum/late_party_member/military_police,
	/datum/late_party_member/military_police,
	/datum/late_party_member/military_police,
	/datum/late_party_member/military_police_lieutenant
	)

/datum/late_party/deserters/after_spawn_lateparty()
	var/datum/announcement/announce = new /datum/announcement/centcomm/deserters
	announce.play()

/datum/late_party_member/deserter
	name = "Дезертир"
	faction = /datum/faction/late_party/deserters
	spawnloc = "lp_deserter"
	outfit = /datum/outfit/late_party/deserter
	fluff_text = "<span class='danger'>Ты - дезертир. Из-за постоянных унижений, насилия и прочих непотребств, ты и ещё несколько твоих сослуживцев решились сбежать во время одного из патрулей. Ты хоть и военный, но не головорез; не стоит убивать экипаж напросну (что не касается офицеров военной полиции)</span>."
	role_alert = 'sound/antag/deserters_alert.ogg'

/datum/late_party_member/military_police
	name = "Офицер Военной Полиции"
	faction = /datum/faction/late_party/military_police
	spawnloc = "lp_mp"
	outfit = /datum/outfit/late_party/military_police
	role_alert = 'sound/antag/military_police_alert.ogg'

/datum/late_party_member/military_police/New()
	fluff_text = "<span class='notice'>Ты - офицер военной полиции. Задача отряда - <B>ликвидировать дезертиров-предателей на [station_name_ru()]</B>. Будучи рядовым членом корпуса военной полиции НТ, ты подчиняешься только ЦК и командующему отряда</span>."

/datum/late_party_member/military_police_lieutenant
	name = "Лейтенант Военной Полиции"
	faction = /datum/faction/late_party/military_police
	spawnloc = "lp_mp"
	outfit = /datum/outfit/late_party/military_police/lieutenant
	role_alert = 'sound/antag/military_police_alert.ogg'

/datum/late_party_member/military_police_lieutenant/New()
	fluff_text = "<span class='notice'>Ты - <B>лидер</B> отряда военной полиции. Задача отряда - <B>ликвидировать дезертиров-предателей на [station_name_ru()]</B>. Будучи лейтенантом корпуса военной полиции НТ, ты подчиняешься только ЦК, экипаж [station_name_ru()] не обязан исполнять твои приказы</span>."


//inspection
/datum/late_party/inspection
	name = "Инспекция"
	req_command = 1
	members = list(
	/datum/late_party_member/assassin,
	/datum/late_party_member/assassin,
	/datum/late_party_member/assassin,
	/datum/late_party_member/assassin,
	/datum/late_party_member/assassin,
	/datum/late_party_member/assassin,
	/datum/late_party_member/blueshield,
	/datum/late_party_member/inspector
	)

/datum/late_party/inspection/after_spawn_lateparty()
	var/datum/announcement/announce = new /datum/announcement/centcomm/inspection
	announce.play()

/datum/late_party_member/inspector
	name = "Инспектор"
	faction = /datum/faction/late_party/nt_inspection
	spawnloc = "lp_mp"
	outfit = /datum/outfit/late_party/inspector

/datum/late_party_member/inspector/New()
	fluff_text = "<span class='notice'>Ты - <B>инспектор</B>. Твоя задача - <B>провести осмотр [station_name_ru()] и зафиксировать в своём планшете все найденные нарушения</B>. Ну и, конечно же, приятно провести время используя своё положение</span>."

/datum/late_party_member/blueshield
	name = "Синий Щит"
	faction = /datum/faction/late_party/nt_inspection
	spawnloc = "lp_mp"
	outfit = /datum/outfit/late_party/blueshield
	fluff_text = "<span class='notice'>Ты - офицер синего щита. Твоя задача - защитить инспектора <B>любой ценой</B></span>."

/datum/late_party_member/assassin
	name = "Наёмный Убийца"
	faction = /datum/faction/late_party/assassins
	spawnloc = "lp_assassin"
	outfit = /datum/outfit/late_party/assassin
	role_alert = 'sound/antag/tatoralert.ogg'

/datum/late_party_member/assassin/New()
	fluff_text = "<span class='danger'>Ты - наёмный убийца. Скоро на [station_name_ru()] прилетит представитель НТ. Твоему отряду поручена задача незаметно <B>убить его</B></span>."
