var ready;

var correctAnswer;

ready = function() {
	
	if ($('.jsData').length) {
		correctAnswer = $('.jsData').attr('data-answer');
		$('.jsData').attr('data-answer', '');
	}

	$('.js-answer-trigger').on('ajax:success', function(evt, post, status) {
		btnClicked = $(btnClicked);
		if (post.category_id == 2) {
			correctAnswer = '<img src="'+correctAnswer+'"/>'
			if ($(btnClicked).attr('src')) {
				btnClicked = btnClicked.parent()
			}
		}

		var givenAnswerId = parseInt(btnClicked.attr('href').split('=')[1])
		
		var correctAnswerId = post.correct_answer_id;
		
		if (givenAnswerId == correctAnswerId) {
			$('.question-popup p').addClass('correct').append('Goed geantwoord het is: ' + correctAnswer);
		} else {
			$('.question-popup p').addClass('fail').append('Fout, het antwoord is: ' + correctAnswer);
		}
		$('.question-popup, .overlay-popup').addClass('active')

	});

}

$(document).ready(ready);
$(document).on('page:load', ready);