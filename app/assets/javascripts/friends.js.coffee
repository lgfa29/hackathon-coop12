$(document).ready ->
	$('#facts tr').click ->
		$('#message_text').append("\n"+$(this).find("td").text())