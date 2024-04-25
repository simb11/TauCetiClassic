/* CENTRAL COMMAND */
/datum/announcement/centcomm
	title = "Оповещение Центрального Командования"
	subtitle = "Оповещение НаноТрейзен"
	sound = "commandreport"
	flags = ANNOUNCE_TEXT | ANNOUNCE_SOUND

/datum/announcement/centcomm/play()
	..()
	SSStatistics.add_communication_log(type = "centcomm", title = title, content = message)


/datum/announcement/centcomm/admin
	name = "Centcomm: Admin Stub"
	message = "\[Введите свое сообщение здесь.\]"
	flags = ANNOUNCE_ALL

/datum/announcement/centcomm/yesert
	name = "Centcomm: ERT Approved"
	subtitle = "Центральное Командование"
	sound = "yesert"
/datum/announcement/centcomm/yesert/New()
	message = "Внимание! Мы получили запрос на отряд быстрого реагирования. Запрос одобрен. Отряд будет подготовлен и отправлен в кратчайшие сроки."

/datum/announcement/centcomm/noert
	name = "Centcomm: ERT Denied"
	subtitle = "Центральное Командование"
	sound = "noert"
/datum/announcement/centcomm/noert/New()
	message = "Внимание! Мы получили запрос на отряд быстрого реагирования. Запрос отклонен. Попытайтесь решить проблемы своими силами."

/datum/announcement/centcomm/narsie_summon
	name = "Central Command Higher Dimensional Affairs"
	subtitle = "Центральное Командование"
	sound = "portal"
/datum/announcement/centcomm/narsie_summon/New(mob/user)
	message = "Зафиксирована блюспейс аномалия в [get_area(user)], возможно раскрытие неизвестного портала."

/datum/announcement/centcomm/prisoners
	name = "Prisoner escape"
	subtitle = "Отдел по Борьбе с Организованной Преступностью"
	announcer = "Дежурный офицер"
	sound = "gang_announce"
/datum/announcement/centcomm/prisoners/New()
	message = "Здравствуйте, экипаж." + \
	" Рядом с [station_name_ru()] оборвалась связь с одним из наших конвоев, перевозивших заключённых." + \
	" Вероятно, часть заключённых оказалось на территории станции." + \
	" Просим охрану станции арестовать и отправить на ЦК сбежавших заключённых. Живых!"

/datum/announcement/centcomm/deserters
	name = "Deserters"
	subtitle = "Центральное Командование"
	sound = "commandreport"
/datum/announcement/centcomm/deserters/New()
	message = "Внимание!" + \
	" ВКН Икар зафиксировал рядом с [station_name_ru()] группу вооружённых и крайне опасных военных дезертиров." + \
	" Мы просим вас ни в коем случае не вступать с ними в контакт." + \
	" Вскоре прибудет отряд военной полиции для решения вопроса с дезертирами."

/datum/announcement/centcomm/inspection
	name = "Inspection"
	subtitle = "Центральное Командование"
	sound = "commandreport"
/datum/announcement/centcomm/inspection/New()
	message = "Доброго дня, экипаж." + \
	" Вскоре на [station_name_ru()] прибудет инспектор для внеплановой проверки." + \
	" Надеемся на ваше гостеприимство."
