/datum/bodytype
	var/bodytype_name = ""
	var/abbreviation = "" //for bodyparts icon

	//sprites
	var/uniform_sprites = 'icons/mob/uniform.dmi'
	var/suit_sprites = 'icons/mob/suit.dmi'
	var/gloves_sprites = 'icons/mob/hands.dmi'
	var/shoes_sprites = 'icons/mob/feet.dmi'

	var/undershirt_sprites = 'icons/mob/human_undershirt.dmi'
	var/underwear_sprites = 'icons/mob/human_underwear.dmi'
	var/socks_sprites = 'icons/mob/human_socks.dmi'

	var/spare_uniform_sprites = 'icons/mob/uniform.dmi' //in case if the sprite from uniform_sprites is MISSING
	var/spare_shoes_sprites = 'icons/mob/feet.dmi' //in case if the sprite from shoes_sprites is MISSING
	var/spare_gloves_sprites = 'icons/mob/hands.dmi' //in case if the sprite from gloves_sprites is MISSING

/datum/bodytype/normal
	bodytype_name = "Normal body type"

/datum/bodytype/femine
	bodytype_name = "Femine body type"
	abbreviation = "_femine"
	uniform_sprites = 'icons/mob/uniform_fem.dmi'
	gloves_sprites = 'icons/mob/hands_fem.dmi'
	shoes_sprites = 'icons/mob/feet_fem.dmi'

	undershirt_sprites = 'icons/mob/human_undershirt_fem.dmi'
	underwear_sprites = 'icons/mob/human_underwear_fem.dmi'
	socks_sprites = 'icons/mob/human_socks_fem.dmi'

/datum/bodytype/fat
	bodytype_name = "Fat body type"
	abbreviation = "_fat"
	uniform_sprites = 'icons/mob/uniform_fat.dmi'
	suit_sprites = 'icons/mob/suit_fat.dmi'

	undershirt_sprites = 'icons/mob/human_undershirt_fat.dmi'
	underwear_sprites = 'icons/mob/human_underwear_fat.dmi'
	socks_sprites = 'icons/mob/human_socks_fat.dmi'
