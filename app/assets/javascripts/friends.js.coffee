$(document).ready ->
	$('#facts tr').click ->
		$('#message_text').append($(this).find("td").text())