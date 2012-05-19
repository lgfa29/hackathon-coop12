function add_fact(obj) {
	$('#message_text').append("\n" + $(obj).find("td").text());
}

function add_canned(obj) {
	$('#message_text').append("\n" + $(obj).find(".hidden").text());
}