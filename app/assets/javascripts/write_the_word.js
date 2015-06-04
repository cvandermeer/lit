
// Varialbles
var answerShuffled;
var addedLetterToAnswer;
var givenLetters = '';

var ready;
ready = function() {
	
	if( $('.js-write-word').length ) {
		correctAnswer = correctAnswer.toUpperCase();
		$('.js-write-word').attr('data-answer', '')
		// Setting the points in the view
		for (var i = 0; i < correctAnswer.length; i++) {
			$('.js-write-word').append('<div class="dot" data-set="0" data-letter-id="" data-letter=""></div>');
		}

		// Adding letters to the answer
		addLettersToShuffledAnswer(correctAnswer);	

		// Extra shuffle
		shuffleAnswer(answerShuffled);

		// Appending the shulled letter to the view
		appendLetterToView(answerShuffled);

		// Giving the letter a position absolute
		setPositionOfLetter();

		$('.js-answer-trigger').on('click', function() {
			$('.js-set-letters').find('.letter').each(function() {
				$(this).unbind('click')
			});
		});
	}

}

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
	Appending the letters to the view
*/

function appendLetterToView(letters) {
	for (var i = 0; i < letters.length; i++) {
		var letter = letters.split('')[i];
		$('.js-set-letters').append('<div class="letter" data-letter="'+letter+'" data-letter-id="'+i+'" data-set="0">'+letter+'</div>');
	} 
}

/*
	Setting to an absolute position, so they can be moved
*/

function setPositionOfLetter() {
	var containerOffsetTop = $('.write-word').offset().top;
	var containerOffsetLeft = $('.write-word').offset().left;
	$('.js-set-letters').parent().css('height', $('.js-set-letters').parent().height() + 'px')

	$('.js-set-letters').find('.letter').each(function() {
		var elOffsetTop = Math.round($(this).offset().top - containerOffsetTop);
		var elOffsetLeft = Math.round($(this).offset().left - containerOffsetLeft);
		$(this).css({
			'left' : elOffsetLeft + 'px',
			'top' : elOffsetTop + 'px'
		});

		$(this).attr('data-top', elOffsetTop);
		$(this).attr('data-left', elOffsetLeft);
	});

	$('.js-set-letters').find('.letter').each(function(){
		$(this).css('position', 'absolute');
		$(this).bind('click', function(){
			letterClicked(this);
		});
	});
}

/*
	One of the letters is clicked, check first his data-set is true or false
*/

var dot;

function letterClicked(el) {
	// Set the letter back to its old sate
	
	var elId = $(el).attr('data-letter-id');
	var elLetter = $(el).attr('data-letter');
	if($(el).attr('data-set') == 1) {
		$(el).attr('data-set', '0');
		$('.js-write-word').find('.dot').each(function() {
			if($(this).attr('data-letter-id') == elId) {
				dot = this
				return false
			}
		});
		$(dot).attr('data-set', 0);
		$(dot).attr('data-letter-id', '');
		$(dot).attr('data-letter', '');

		setLetterToOldPosition(el);
	
	// Set the letter to the first empty dot
	} else if($(el).attr('data-set') == 0){
		$(el).attr('data-set', '1');
		// Getting back the correct dot
		$('.js-write-word').find('.dot').each(function() {
			if($(this).attr('data-set') == 0) {
				dot = this
				return false
			}
		});
		
		if (givenLetters.length == correctAnswer.length) {
			var oldElId = $('.js-write-word .dot:last-child').attr('data-letter-id');
			var oldEl;
			// find old element by id
			$('.js-set-letters').find('.letter').each(function() {
				if($(this).attr('data-letter-id') == oldElId) {
					oldEl = this
					return false
				}
			});
			$(oldEl).attr('data-set', '0');
			setLetterToOldPosition(oldEl);
		}

		$(dot).attr('data-set', 1);
		$(dot).attr('data-letter-id', elId);
		$(dot).attr('data-letter', elLetter)
		
		checkIfAlDotsAreTake();
		
		setLetterOnTheDot(dot, el);		
		
	}
}

/*
	Checking if there are any dots left
*/

function checkIfAlDotsAreTake() {
	givenLetters = '';
	$('.js-write-word').find('.dot').each(function() {
		givenLetters += $(this).attr('data-letter');
	});

	checkIfAnswerIsCorrect(givenLetters);

}

/*
	Setting the letter on the dot
*/

function setLetterOnTheDot(dot, el) {
	var containerOffsetTop = $('.write-word').offset().top + 32;
	var containerOffsetLeft = $('.write-word').offset().left + 32;
	var elOffsetTop = Math.round($(dot).offset().top - containerOffsetTop);
	var elOffsetLeft = Math.round($(dot).offset().left - containerOffsetLeft);
	$(el).css({
		'left' : elOffsetLeft + 'px',
		'top' : elOffsetTop + 'px'
	});
}

/* 
	Setting the letter to the old position
*/

function setLetterToOldPosition(el) {
	var elOffsetLeft = $(el).attr('data-left');
	var elOffsetTop = $(el).attr('data-top');
	$(el).css({
		'left' : elOffsetLeft + 'px',
		'top' : elOffsetTop + 'px'
	});
}

/*
	Checking if the given answer is correct
*/

function checkIfAnswerIsCorrect(answer) {
	if (answer.length == correctAnswer.length) {
		if (answer == correctAnswer) {
			$('.js-set-letters').find('.letter').each(function() {
				$(this).unbind('click')
			});
			$('.letter').css('cursor', 'default');

			var newHref = window.location + '/submit_answer?answer_id=' + $('.js-write-word').attr('data-answer-id');
			// Add the correct url, to give a point

			$('.js-answer-trigger').attr('href', newHref);
		}
	}
}


$(document).ready(ready);
$(document).on('page:load', ready);