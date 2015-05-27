
// Varialbles
var correctAnswer;
var answerShuffled;
var addedLetterToAnswer;


var ready;
ready = function() {
	
	if( $('.js-write-word').length ) {
		correctAnswer = $('.js-write-word').attr('data-answer').toUpperCase();

		// Setting the points in the view
		for (var i = 0; i < correctAnswer.length; i++) {
			$('.js-write-word').append('<div class="dots"></div>');
		}

		// Adding letters to the answer
		addLettersToShuffledAnswer(correctAnswer);	

		// Extra shuffle
		shuffleAnswer(answerShuffled);

		// Appending the shulled letter to the view
		appendLetterToView(answerShuffled);

		// Giving the letter a position absolute
		setPositionOfLetter();
	}

}

$(document).ready(ready);
$(document).on('page:load', ready);


/*
	Adding letters to the answer
*/

function addLettersToShuffledAnswer(answer) {
	var alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var lettersToAdd = Math.ceil(answer.length / 2)
	addedLetterToAnswer = answer;
	for ( var i = 0; i < lettersToAdd; i++) {
		addedLetterToAnswer += alphabet.charAt(Math.floor(Math.random() * alphabet.length));
	}
	shuffleAnswer(addedLetterToAnswer);
}

/*
 	Shuffling the correct answer with added charaters.
*/

function shuffleAnswer(answer) {
	answerShuffled = answer.toUpperCase().split('').sort(function() {
		return 0.5-Math.random()
	}).join('');

	if (correctAnswer == answerShuffled) {
		shuffleAnswer(answerShuffled)
	}
}

/*
	Appending the letters to the view /!! Don't forget to bind the click event !!/
*/

function appendLetterToView(letters) {
	for (var i = 0; i < letters.length; i++) {
		var letter = letters.split('')[i];
		$('.js-set-letters').append('<div class="letter" data-letter="'+letter+'">'+letter+'</div>')
	} 
}

/*
	Setting to an absolute position, so they can be moved
*/

function setPositionOfLetter() {
	var containerOffsetTop = $('.js-set-letters').offset().top;
	var containerOffsetLeft = $('.js-set-letters').offset().left;
	$('.js-set-letters').parent().css('height', $('.js-set-letters').parent().height() + 'px')

	$('.js-set-letters').find('.letter').each(function() {
		var elOffsetTop = Math.round($(this).offset().top - containerOffsetTop);
		var elOffsetLeft = Math.round($(this).offset().left - containerOffsetLeft);
		console.log(elOffsetLeft, 'Left');
		console.log(elOffsetTop, 'Top');
		$(this).css({
			'left' : elOffsetLeft + 'px',
			'top' : elOffsetTop + 'px'
		});
	});

	$('.js-set-letters').find('.letter').each(function(){
		$(this).css('position', 'absolute')
	});
}




