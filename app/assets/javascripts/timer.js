var ready;
ready = function() {
	
	if( $('.timer').length ) {
		$('.timer').addClass('start');
		// trigger wrong answer
		console.log($('.answer').attr('href'))
		var val = $('.answer').attr('href').split('=');
		valOne = val[0];
		newHref = valOne + '=1';

		var timer;
		timer = setTimeout(function() {
		 	window.location.replace(newHref);
		}, 10000);
		
		$('.answer').on('click', function() {
			clearTimeout(timer);
		});
	}
}

$(document).ready(ready);
$(document).on('page:load', ready);