var ready;
ready = function() {
	
	if( $('.timer').length ) {
		$('.timer').addClass('start');
		
		var questionId = $('.jsData').attr('data-question-id')
		if($('.jsData').attr('data-wrong-answer-id')) {
			var wrongAnswerId = $('.jsData').attr('data-wrong-answer-id');
		} else {
			var wrongAnswerId = 1;
		}
		// trigger wrong answer
		var newHref = '/questions/' + questionId + '/submit_answer?answer_id=' + wrongAnswerId;
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