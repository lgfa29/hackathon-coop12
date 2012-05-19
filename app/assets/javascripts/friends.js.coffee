

		
$(document).ready ->
	$('#inspiration').click ->
		$('#message_text').append("\n"+$(this).find(".hidden").text())
		
$(document).ready ->
	messages = new Array()
	messages[0] = "May you always look forward to your Birthday as a day that brings you new milestones and ventures to accomplish in life, not as a day of growing old. Happy Birthday!"
	messages[1] = "Wishing you a happy and prosperous birthday and a sweet night of birthday dreams. "
	messages[2] = "It's your birthday and You are again one year older now and I hope that you be delightful throughout your life. Happy Birthday "
	messages[3] = "You're older today than yesterday but younger than tomorrow, Happy Bday! "
	messages[4] = "Wishing you a happy and prosperous birthday and a sweet night of birthday dreams. "
	messages[5] = "It's your birthday and You are again one year older now and I hope that you be delightful throughout your life. Happy Birthday "
	messages[6] = "A simple celebration, a gathering of friends; here is wishing you great happiness, a joy that never ends. Happy Birthday!"
	messages[7] = "Another year has passed in your life, making you even wiser and stronger. Let your age, not age your spirits. Happy birthday. "
	messages[8] = "Count your life by smiles, not tears. Count your age by friends, not years."
	messages[9] = "Being young is a privilege. Being attractive a genetic gift. Being cool, that is all you. Happy Birthday. "
	messages[10] = "Older, wiser and even more good-looking. Every birthday holds the promise of a bright new beginning."
	messages[11] = "Happy Birthday! Wish I could be there to pop out of your cake! "
	i = Math.floor(11 * Math.random())
	
	$("#inspiration").click ->
		$("#message_text").append "\n" + messages[i]
		i = Math.floor(11 * Math.random())

