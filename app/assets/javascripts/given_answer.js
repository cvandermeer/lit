var ready;

ready = function() {

	$('.js-answer-trigger').on('ajax:success', function(evt, post, status) {
		console.log(evt, post, status);
		var givenAnswerId =  parseInt($('.js-answer-trigger').attr('href').split('=')[1]);
		//console.log(givenAnswerId);
		var correctAnswerId = post.correct_answer_id;
		//console.log(correctAnswerId);
		
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