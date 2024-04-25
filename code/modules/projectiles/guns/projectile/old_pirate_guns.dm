/obj/item/weapon/gun/projectile/automatic/a28/nonlethal
	name = "A28 assault rifle NL"
	desc = "Модифицированная автоматическая винтовка типа булл-пап с воздушным охлаждением и интегрированным глушителем, используемая спецотрядами ВСНТ. Использует патроны калибром 5.56мм."
	icon_state = "a28w"
	item_state = "a28w"
	silenced = TRUE
	initial_mag = /obj/item/ammo_box/magazine/a28/nonlethal
	fire_sound = 'sound/weapons/guns/gunshot_silencer.ogg'

/obj/item/ammo_box/magazine/a28/nonlethal
	name = "A28 magazine (.556NL)"
	icon_state = "a28_mag_nl"
	ammo_type = /obj/item/ammo_casing/a556/nonlethal
	caliber = "5.56mm"
	max_ammo = 30

/obj/item/ammo_box/magazine/silenced_pistol/nonlethal
	name = "magazine (.45NL)"
	icon_state = "silenced_pistol_mag_nl"
	ammo_type = /obj/item/ammo_casing/c45/nonlethal
	caliber = ".45"
	max_ammo = 12

/obj/item/ammo_casing/a556/nonlethal
	desc = "A 5.56mm bullet casing."
	projectile_type = /obj/item/projectile/bullet/weakbullet/nl_rifle

/obj/item/ammo_casing/c45/nonlethal
	desc = "A .45 bullet casing."
	caliber = ".45"
	projectile_type = /obj/item/projectile/bullet/weakbullet/nl_rifle

/obj/item/projectile/bullet/weakbullet/nl_rifle
	stutter = 10
	agony = 55
