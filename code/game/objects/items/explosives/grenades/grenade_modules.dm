// Grenade modification modules
// These can be installed by Ordinance Technicians during custom grenade construction

/obj/item/grenade_module
	name = "grenade module"
	desc = "A modification module that can be installed on grenades during custom construction. Install before locking the assembly with a screwdriver."
	icon = 'icons/obj/items/weapons/grenade.dmi'
	icon_state = "module_base"
	w_class = SIZE_TINY
	var/module_type = "base"

/obj/item/grenade_module/examine(mob/user)
	..()
	to_chat(user, SPAN_INFO("This module can be installed on custom grenades before locking them with a screwdriver."))

// Called when the grenade with this module is thrown
/obj/item/grenade_module/proc/on_grenade_thrown(obj/item/explosive/grenade/G, datum/launch_metadata/LM)
	return

// Called when the grenade with this module is primed
/obj/item/grenade_module/proc/on_grenade_primed(obj/item/explosive/grenade/G)
	return

// Bounce Module - Makes grenades bounce once before exploding
/obj/item/grenade_module/bounce
	name = "grenade bounce module"
	desc = "A specialized spring-loaded mechanism that allows grenades to bounce once off surfaces before detonating. Useful for getting around corners or into trenches."
	icon_state = "module_bounce"
	module_type = "bounce"

/obj/item/grenade_module/bounce/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("Grenades with this module will bounce once off walls or objects before exploding."))

/obj/item/grenade_module/bounce/on_grenade_thrown(obj/item/explosive/grenade/G, datum/launch_metadata/LM)
	// Enable bounce mechanics
	G.rebounds = TRUE
	G.bounces_remaining = 1
