GLOBAL_LIST_EMPTY(legal_team_requests)

/datum/legal_team_request
	var/datum/weakref/requester_ref
	var/requester_name = "Unknown"
	var/reason = ""
	var/status = LEGAL_REQUEST_PENDING
	var/created_at_text
	/// "intranet" or "beacon" — shown in the responder queue UI.
	var/source = "intranet"

/datum/legal_team_request/New(mob/requester, reason_text, source_label = "intranet")
	. = ..()
	requester_ref = WEAKREF(requester)
	requester_name = requester.real_name
	reason = reason_text
	created_at_text = time2text(world.timeofday, "hh:mm:ss")
	source = source_label

/datum/legal_team_request/Destroy()
	GLOB.legal_team_requests -= src
	return ..()

/// Queues a Corporate Legal Team request and broadcasts notifications
/proc/transmit_legal_team_request(mob/user, reason, atom/origin, source_label = "intranet")
	var/datum/legal_team_request/request = new(user, reason, source_label)
	GLOB.legal_team_requests += request

	var/from_beacon = source_label == "beacon"
	var/header = from_beacon ? "CORPORATE LEGAL BEACON" : "CORPORATE LEGAL REQUEST"
	var/via = from_beacon ? "via the Corporate Affairs handheld beacon" : "via the WY Intranet"
	var/header_html = "<b><font color='#8babc5'>[header]: </font></b>"

	var/admin_msg = SPAN_STAFF_IC("[header_html][key_name(user, 1)] [ADMIN_JMP_USER(user)] requested a Corporate Legal Team [via]. Reason: <i>[reason]</i>")
	if(from_beacon)
		admin_msg += " (<a href='byond://?_src_=admin_holder;[HrefToken(forceGlobal = TRUE)];legal_beacon_approve=\ref[request]'>SEND LAWYERS</a>) (<a href='byond://?_src_=admin_holder;[HrefToken(forceGlobal = TRUE)];legal_beacon_deny=\ref[request]'>DENY</a>)"

	for(var/client/admin_client in GLOB.admins)
		if(!admin_client.admin_holder)
			continue
		if(!((R_ADMIN|R_MOD) & admin_client.admin_holder.rights))
			continue
		to_chat(admin_client, admin_msg)
		if(from_beacon)
			playsound_client(admin_client, 'sound/effects/sos-morse-code.ogg', 10)
		else if(admin_client.prefs?.toggles_sound & SOUND_FAX_MACHINE)
			admin_client << 'sound/effects/incoming-fax.ogg'
	log_admin("[key_name(user)] requested a Corporate Legal Team [via]. Reason: [reason]")

	var/responder_msg = SPAN_NOTICE("[header_html][user.real_name] aboard [MAIN_SHIP_NAME] has requested a Corporate Legal Team [via]. Reason: <i>[reason]</i> Review on your intranet terminal.")
	if(SSticker?.mode)
		for(var/mob/living/carbon/human/responder in SSticker.mode.fax_responders)
			if(responder.stat == DEAD || responder.job != JOB_FAX_RESPONDER_WY)
				continue
			to_chat(responder, responder_msg)
			if(responder.client?.prefs?.toggles_sound & SOUND_FAX_MACHINE)
				responder.client << 'sound/effects/incoming-fax.ogg'

	if(origin)
		origin.visible_message(SPAN_NOTICE("[origin] beeps and transmits a Corporate Legal Team request via secure relay."))
		playsound(origin, 'sound/machines/fax.ogg', 25, TRUE)
	to_chat(user, SPAN_NOTICE("Your Corporate Legal Team request has been transmitted to Weyland-Yutani HC."))
	return request

/// Approves or denies a queued request
/proc/resolve_legal_team_request(mob/approver, datum/legal_team_request/request, approve)
	if(!istype(request) || request.status != LEGAL_REQUEST_PENDING)
		return FALSE

	request.status = approve ? LEGAL_REQUEST_APPROVED : LEGAL_REQUEST_DENIED
	var/mob/requester = request.requester_ref?.resolve()
	var/verb = approve ? "approved" : "denied"

	if(approve && SSticker?.mode)
		SSticker.mode.get_specific_call(/datum/emergency_call/inspection_wy/lawyer, TRUE, TRUE, request.reason)

	message_admins(SPAN_STAFF_IC("[key_name(approver)] [verb] [request.requester_name]'s Corporate Legal Team request ([request.source])."))
	log_game("[key_name(approver)] [verb] a Corporate Legal Team request from [request.requester_name] ([request.source]): [request.reason]")
	if(requester)
		if(approve)
			to_chat(requester, SPAN_NOTICE("Your Corporate Legal Team request has been <b>APPROVED</b>. Lawyers are being dispatched."))
		else
			to_chat(requester, SPAN_WARNING("Your Corporate Legal Team request has been <b>DENIED</b>."))

	qdel(request)
	return TRUE

/// Fires the lawyer ERT without a queued request
/proc/dispatch_legal_team_unilaterally(mob/dispatcher, reason, atom/origin)
	if(!SSticker?.mode)
		return FALSE
	SSticker.mode.get_specific_call(/datum/emergency_call/inspection_wy/lawyer, TRUE, TRUE, reason)
	message_admins(SPAN_STAFF_IC("[key_name(dispatcher)] dispatched a Corporate Legal Team unilaterally via WY HC intranet. Reason: [reason]"))
	log_game("[key_name(dispatcher)] dispatched a Corporate Legal Team unilaterally via WY HC intranet. Reason: [reason]")
	if(origin)
		origin.visible_message(SPAN_NOTICE("[origin] hums as it transmits dispatch authorisation."))
		playsound(origin, 'sound/machines/fax.ogg', 25, TRUE)
	return TRUE
