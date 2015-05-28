var ready;
ready = function() {
	
	if( $('.timer').length ) {
		$('.timer').addClass('start');

		// trigger wrong answer
		var val = $('.js-answer-trigger').attr('href').split('=');
		valOne = val[0];
		newHref = valOne + '=1';

		var timer;
		timer = setTimeout(function() {
			window.location.replace(newHref);
		}, 10000);
		
		$('.js-answer-trigger').on('click', function() {
			clearTimeout(timer);
		});
	}
}

$(document).ready(ready);
$(document).on('page:load', ready);