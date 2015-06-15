var ready;

var btnClicked;

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
			if($('.timer').length) {
				$('body').find('.js-answer-trigger').each(function() {
					$(this).attr('href', newHref);
					$(this).trigger('click');
					btnClicked = this;
					return false;
				});
			}
		}, 30000);
		
		$('.js-answer-trigger').on('click', function(e) {
			clearTimeout(timer);
			$('.timer').removeClass('start');
			$('.timer').css('width', $('.timer').width() + 'px');
			btnClicked = e.target;
		});
		
	}
}

$(document).ready(ready);
$(document).on('page:load', ready);