var ready;
ready = function() {

	if( $('.question-types').length ) {
		var questionType = $('.js-set-active').attr('data-class-name');
		$('.question-types').find(questionType).addClass('active')
	}
}

$(document).ready(ready);
$(document).on('page:load', ready);