var video = document.getElementById("video");

function selectUser(form) {
	// set up the phone
	var phone = window.phone = PHONE({
	    number        : form.username.value || "Anonymous",
	    publish_key   : 'pub-c-a7775e85-ea67-4ecf-84d1-09f306ed9939',
	    subscribe_key : 'sub-c-df5175dc-2dcb-11e6-8bc8-0619f8945a4f',
			ssl : (('https:' == document.location.protocol) ? true : false)
	});
	// denote it's ready
	phone.ready(function(){ form.username.style.background="#55ff5b"; });
	// set up callbacks that execute upon start or finish of session
	phone.receive(function(session){
	    session.connected(function(session) { video.appendChild(session.video); });
	    session.ended(function(session) { video.innerHTML=''; });
	});
	return false;
}

function makeCall(form){
	// dial a phone number; this is initiating the peer connection over STUN/TURN servers
	phone.dial(form.number.value);
	return false;
}
