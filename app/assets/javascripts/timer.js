var ready;
ready = function() {
	
	if( $('.timer').length ) {
		$('.timer').addClass('start');
		wrongAnswerId = $('.answer-container').attr('data-wrong-answer-id');
		// trigger wrong answer
		var val = $('.js-answer-trigger').attr('href').split('=');
		console.log(val)	
		valOne = val[0];
		newHref = valOne + '=' + wrongAnswerId;

		var timer;
		timer = setTimeout(function() {
			window.location.replace(newHref);
		}, 30000);
		
		$('.js-answer-trigger').on('click', function() {
			clearTimeout(timer);
		});
	}
}

$(document).ready(ready);
$(document).on('page:load', ready);