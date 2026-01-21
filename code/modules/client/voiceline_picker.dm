// Voice Line Picker - Allows players to select individual voice lines for emotes

// List of rare sound paths - these have a low chance of playing when enable_rare_sounds is on
GLOBAL_LIST_INIT(rare_voice_lines, list(
	// Rare warcries
	'sound/voice/warcry/warcry_male_rare_1.ogg',
	'sound/voice/warcry/warcry_male_rare_2.ogg',
	'sound/voice/warcry/warcry_male_rare_3.ogg',
	'sound/voice/warcry/warcry_male_rare_4.ogg',
	'sound/voice/warcry/warcry_male_rare_5.ogg',
	// Rare screams
	'sound/voice/human_jackson_scream.ogg',
	'sound/voice/human_ack_scream.ogg',
	'sound/voice/human_tantrum_scream.ogg',
	// Rare pain
	'sound/voice/human_male_pain_rare_1.ogg',
	'sound/voice/human_bobby_pain.ogg',
	'sound/voice/tomscream.ogg',
	// Rare medic
	'sound/voice/human_male_medic_rare_1.ogg',
	'sound/voice/human_male_medic_rare_2.ogg'
))

GLOBAL_LIST_INIT(voice_line_categories, list(
	"warcry" = list(
		"name" = "Warcry",
		"description" = "Battle cries used with the *warcry emote",
		"sounds" = list(
			// Male warcries
			'sound/voice/warcry/male_go.ogg',
			'sound/voice/warcry/male_attack.ogg',
			'sound/voice/warcry/male_charge.ogg',
			'sound/voice/warcry/male_charge2.ogg',
			'sound/voice/warcry/warcry_male_1.ogg',
			'sound/voice/warcry/warcry_male_2.ogg',
			'sound/voice/warcry/warcry_male_3.ogg',
			'sound/voice/warcry/warcry_male_4.ogg',
			'sound/voice/warcry/warcry_male_5.ogg',
			'sound/voice/warcry/warcry_male_6.ogg',
			'sound/voice/warcry/warcry_male_7.ogg',
			'sound/voice/warcry/warcry_male_8.ogg',
			'sound/voice/warcry/warcry_male_9.ogg',
			'sound/voice/warcry/warcry_male_10.ogg',
			'sound/voice/warcry/warcry_male_11.ogg',
			'sound/voice/warcry/warcry_male_12.ogg',
			'sound/voice/warcry/warcry_male_13.ogg',
			'sound/voice/warcry/warcry_male_14.ogg',
			'sound/voice/warcry/warcry_male_15.ogg',
			'sound/voice/warcry/warcry_male_16.ogg',
			'sound/voice/warcry/warcry_male_17.ogg',
			'sound/voice/warcry/warcry_male_18.ogg',
			'sound/voice/warcry/warcry_male_19.ogg',
			'sound/voice/warcry/warcry_male_20.ogg',
			'sound/voice/warcry/warcry_male_21.ogg',
			'sound/voice/warcry/warcry_male_22.ogg',
			'sound/voice/warcry/warcry_male_23.ogg',
			'sound/voice/warcry/warcry_male_24.ogg',
			'sound/voice/warcry/warcry_male_25.ogg',
			'sound/voice/warcry/warcry_male_26.ogg',
			'sound/voice/warcry/warcry_male_27.ogg',
			'sound/voice/warcry/warcry_male_28.ogg',
			'sound/voice/warcry/warcry_male_29.ogg',
			'sound/voice/warcry/warcry_male_30.ogg',
			'sound/voice/warcry/warcry_male_31.ogg',
			'sound/voice/warcry/warcry_male_32.ogg',
			'sound/voice/warcry/warcry_male_33.ogg',
			'sound/voice/warcry/warcry_male_34.ogg',
			'sound/voice/warcry/warcry_male_35.ogg',
			// Female warcries
			'sound/voice/warcry/female_charge.ogg',
			'sound/voice/warcry/female_yell1.ogg',
			'sound/voice/warcry/warcry_female_1.ogg',
			'sound/voice/warcry/warcry_female_2.ogg',
			'sound/voice/warcry/warcry_female_3.ogg',
			'sound/voice/warcry/warcry_female_4.ogg',
			'sound/voice/warcry/warcry_female_5.ogg',
			'sound/voice/warcry/warcry_female_6.ogg',
			'sound/voice/warcry/warcry_female_7.ogg',
			'sound/voice/warcry/warcry_female_8.ogg',
			'sound/voice/warcry/warcry_female_9.ogg',
			'sound/voice/warcry/warcry_female_10.ogg',
			'sound/voice/warcry/warcry_female_11.ogg',
			'sound/voice/warcry/warcry_female_12.ogg',
			'sound/voice/warcry/warcry_female_13.ogg',
			'sound/voice/warcry/warcry_female_14.ogg',
			'sound/voice/warcry/warcry_female_15.ogg',
			'sound/voice/warcry/warcry_female_16.ogg',
			'sound/voice/warcry/warcry_female_17.ogg',
			'sound/voice/warcry/warcry_female_18.ogg',
			'sound/voice/warcry/warcry_female_19.ogg',
			'sound/voice/warcry/warcry_female_20.ogg'
		),
		"rare_sounds" = list(
			'sound/voice/warcry/warcry_male_rare_1.ogg',
			'sound/voice/warcry/warcry_male_rare_2.ogg',
			'sound/voice/warcry/warcry_male_rare_3.ogg',
			'sound/voice/warcry/warcry_male_rare_4.ogg',
			'sound/voice/warcry/warcry_male_rare_5.ogg'
		)
	),
	"scream" = list(
		"name" = "Scream",
		"description" = "Screams used with the *scream emote",
		"sounds" = list(
			// Male screams
			'sound/voice/human_male_scream_1.ogg',
			'sound/voice/human_male_scream_2.ogg',
			'sound/voice/human_male_scream_3.ogg',
			'sound/voice/human_male_scream_4.ogg',
			'sound/voice/human_male_scream_5.ogg',
			'sound/voice/human_male_scream_6.ogg',
			// Female screams
			'sound/voice/human_female_scream_1.ogg',
			'sound/voice/human_female_scream_2.ogg',
			'sound/voice/human_female_scream_3.ogg',
			'sound/voice/human_female_scream_4.ogg',
			'sound/voice/human_female_scream_5.ogg'
		),
		"rare_sounds" = list(
			'sound/voice/human_jackson_scream.ogg',
			'sound/voice/human_ack_scream.ogg',
			'sound/voice/human_tantrum_scream.ogg'
		)
	),
	"pain" = list(
		"name" = "Pain",
		"description" = "Pain sounds used with the *pain emote",
		"sounds" = list(
			// Male pain
			'sound/voice/human_male_pain_1.ogg',
			'sound/voice/human_male_pain_2.ogg',
			'sound/voice/human_male_pain_3.ogg',
			'sound/voice/human_male_pain_4.ogg',
			// Female pain
			'sound/voice/human_female_pain_1.ogg',
			'sound/voice/human_female_pain_2.ogg',
			'sound/voice/human_female_pain_3.ogg',
			'sound/voice/human_female_pain_4.ogg',
			'sound/voice/human_female_pain_5.ogg'
		),
		"rare_sounds" = list(
			'sound/voice/human_male_pain_rare_1.ogg',
			'sound/voice/human_bobby_pain.ogg',
			'sound/voice/tomscream.ogg'
		)
	),
	"medic" = list(
		"name" = "Medic",
		"description" = "Calls for corpsman used with the *medic emote",
		"sounds" = list(
			// Male medic calls
			'sound/voice/corpsman.ogg',
			'sound/voice/corpsman_up.ogg',
			'sound/voice/corpsman_over_here.ogg',
			'sound/voice/i_need_a_corpsman_1.ogg',
			'sound/voice/i_need_a_corpsman_2.ogg',
			'sound/voice/im_hit_get_doc_up_here.ogg',
			'sound/voice/get_doc_up_here_im_hit.ogg',
			'sound/voice/i_cant_feel_my_legs_corpsman.ogg',
			'sound/voice/human_male_medic.ogg',
			// Female medic calls
			'sound/voice/human_female_medic.ogg'
		),
		"rare_sounds" = list(
			'sound/voice/human_male_medic_rare_1.ogg',
			'sound/voice/human_male_medic_rare_2.ogg'
		)
	),
	"fragout" = list(
		"name" = "Grenade",
		"description" = "Callouts when throwing grenades",
		"sounds" = list(
			// Male fragout
			'sound/voice/human_male_grenadethrow_1.ogg',
			'sound/voice/human_male_grenadethrow_2.ogg',
			'sound/voice/human_male_grenadethrow_3.ogg',
			// Female fragout
			'sound/voice/human_female_grenadethrow_1.ogg',
			'sound/voice/human_female_grenadethrow_2.ogg',
			'sound/voice/human_female_grenadethrow_3.ogg'
		)
	)
))

/datum/voiceline_picker

/datum/voiceline_picker/ui_state(mob/user)
	return GLOB.always_state

/datum/voiceline_picker/ui_static_data(mob/user)
	. = ..()
	.["categories"] = list()
	for(var/category_key in GLOB.voice_line_categories)
		var/list/category = GLOB.voice_line_categories[category_key]
		var/list/sounds = list()
		for(var/sound_path in category["sounds"])
			var/filename = "[sound_path]"
			// Extract just the filename from the path
			var/last_slash = findlasttext(filename, "/")
			if(last_slash)
				filename = copytext(filename, last_slash + 1)
			// Remove the .ogg extension for display
			var/display_name = copytext(filename, 1, findlasttext(filename, ".ogg"))
			sounds += list(list(
				"path" = "[sound_path]",
				"name" = display_name,
				"rare" = FALSE
			))
		// Add rare sounds if the category has them
		var/list/rare_sounds = list()
		if(category["rare_sounds"])
			for(var/sound_path in category["rare_sounds"])
				var/filename = "[sound_path]"
				var/last_slash = findlasttext(filename, "/")
				if(last_slash)
					filename = copytext(filename, last_slash + 1)
				var/display_name = copytext(filename, 1, findlasttext(filename, ".ogg"))
				rare_sounds += list(list(
					"path" = "[sound_path]",
					"name" = display_name,
					"rare" = TRUE
				))
		.["categories"] += list(list(
			"key" = category_key,
			"name" = category["name"],
			"description" = category["description"],
			"sounds" = sounds,
			"rare_sounds" = rare_sounds
		))

/datum/voiceline_picker/ui_data(mob/user)
	. = ..()
	var/datum/preferences/prefs = user.client?.prefs
	if(!prefs)
		return

	.["selected"] = list()
	for(var/category_key in GLOB.voice_line_categories)
		if(prefs.selected_voice_lines && prefs.selected_voice_lines[category_key])
			var/list/category_list = prefs.selected_voice_lines[category_key]
			.["selected"][category_key] = category_list.Copy()
		else
			.["selected"][category_key] = list()
	.["enable_rare_sounds"] = prefs.enable_rare_sounds

/datum/voiceline_picker/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	var/datum/preferences/prefs = ui.user.client?.prefs
	if(!prefs)
		return FALSE

	if(!prefs.selected_voice_lines)
		prefs.selected_voice_lines = list()

	switch(action)
		if("toggle")
			var/category = params["category"]
			var/sound_path = params["sound"]

			// Validate the category exists
			if(!(category in GLOB.voice_line_categories))
				return FALSE

			// Initialize category list if needed
			if(!prefs.selected_voice_lines[category])
				prefs.selected_voice_lines[category] = list()

			// Toggle the sound
			if(sound_path in prefs.selected_voice_lines[category])
				prefs.selected_voice_lines[category] -= sound_path
			else
				// Validate sound exists in category (regular or rare sounds)
				var/list/category_data = GLOB.voice_line_categories[category]
				var/valid = FALSE
				for(var/valid_sound in category_data["sounds"])
					if("[valid_sound]" == sound_path)
						valid = TRUE
						break
				if(!valid && category_data["rare_sounds"])
					for(var/valid_sound in category_data["rare_sounds"])
						if("[valid_sound]" == sound_path)
							valid = TRUE
							break
				if(valid)
					prefs.selected_voice_lines[category] += sound_path
			return TRUE

		if("preview")
			var/sound_path = params["sound"]
			if(sound_path)
				playsound_client(ui.user.client, sound_path, null, 50)
			return FALSE // Don't update UI for preview

		if("select_all")
			var/category = params["category"]
			if(!(category in GLOB.voice_line_categories))
				return FALSE

			var/list/category_data = GLOB.voice_line_categories[category]
			prefs.selected_voice_lines[category] = list()
			for(var/sound_path in category_data["sounds"])
				prefs.selected_voice_lines[category] += "[sound_path]"
			// Also include rare sounds if enabled
			if(prefs.enable_rare_sounds && category_data["rare_sounds"])
				for(var/sound_path in category_data["rare_sounds"])
					prefs.selected_voice_lines[category] += "[sound_path]"
			return TRUE

		if("clear")
			var/category = params["category"]
			if(!(category in GLOB.voice_line_categories))
				return FALSE

			prefs.selected_voice_lines[category] = list()
			return TRUE

		if("toggle_rare_sounds")
			prefs.enable_rare_sounds = !prefs.enable_rare_sounds
			return TRUE

	return FALSE

/datum/voiceline_picker/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "VoicelinePicker", "Voice Line Picker")
		ui.open()
		ui.set_autoupdate(FALSE)

/// Sanitizes voice line selections, removing invalid entries
/proc/sanitize_voice_lines(list/voice_lines)
	if(!islist(voice_lines))
		return list()

	var/list/sanitized = list()
	for(var/category_key in GLOB.voice_line_categories)
		if(!voice_lines[category_key])
			continue

		var/list/category_data = GLOB.voice_line_categories[category_key]
		var/list/valid_sounds = list()

		for(var/sound_path in voice_lines[category_key])
			// Check if sound exists in the category (regular sounds)
			var/found = FALSE
			for(var/valid_sound in category_data["sounds"])
				if("[valid_sound]" == sound_path)
					valid_sounds += sound_path
					found = TRUE
					break
			// Also check rare sounds
			if(!found && category_data["rare_sounds"])
				for(var/valid_sound in category_data["rare_sounds"])
					if("[valid_sound]" == sound_path)
						valid_sounds += sound_path
						break

		if(length(valid_sounds))
			sanitized[category_key] = valid_sounds

	return sanitized

/// Gets a voice line for an emote category, respecting user preferences and rare sound settings
/// Returns a sound path to play
/proc/get_voice_line(mob/living/carbon/human/H, category)
	if(!ishuman(H))
		return null

	// If the user has selected specific voice lines for this category, use those
	if(H.selected_voice_lines?[category] && length(H.selected_voice_lines[category]))
		return pick(H.selected_voice_lines[category])

	// Otherwise, return null to use default behavior
	return null
