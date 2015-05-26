var ready;
ready = function() {
	
	if( $('.timer').length ) {
		$('.timer').addClass('start');
		// trigger wrong answer
		var val = $('.button').attr('href').split('=');
		valOne = val[0];
		newHref = valOne + '=1';
		setTimeout(function() {
			window.location.replace(newHref);
		}, 10000);
	}

}

$(document).ready(ready);
$(document).on('page:load', ready);