var ready;

var correctAnswer;

ready = function() {
	
	if ($('.jsData').length) {
		correctAnswer = $('.jsData').attr('data-answer');
		console.log(correctAnswer)
		$('.jsData').attr('data-answer', '');
	}

	$('.js-answer-trigger').on('ajax:success', function(evt, post, status) {
		if (post.category_id == 3) {
			var givenAnswerId = parseInt($('.js-answer-trigger').attr('href').split('=')[1]);
		} else {
			var givenAnswerId = parseInt($(btnClicked.target).attr('href').split('=')[1])
		}
		
		var correctAnswerId = post.correct_answer_id;
		
		if (givenAnswerId == correctAnswerId) {
			console.log('Congrats', correctAnswer);
			$('.question-popup p').addClass('correct').append('Goed geantwoord het is: ' + correctAnswer);
		} else {
			$('.question-popup p').addClass('fail').append('Fout, het antwoord is: ' + correctAnswer);
		}
		$('.question-popup, .overlay-popup').addClass('active')

	});

}

$(document).ready(ready);
$(document).on('page:load', ready);