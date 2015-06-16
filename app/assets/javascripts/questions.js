var ready;
ready = function() {

	if( $('.question-types').length ) {
		var questionType = $('.js-set-active').attr('data-class-name');
		$('.question-types').find(questionType).addClass('active')
	}
  if ( $('.jsNoTrigger').length < 1 ) {

    if ( $('.jsTriggerAnswers1').length ) {
      for (i = 0; i < 4; i++) {
        $('.jsTriggerAnswers1').trigger('click');
      }
      $('.jsTriggerAnswers1').remove()
    }
    if ( $('.jsTriggerAnswers2').length ) {
      for (i = 0; i < 2; i++) {
        $('.jsTriggerAnswers2').trigger('click');
      }
      $('.jsTriggerAnswers2').remove()
    }
    if ( $('.jsTriggerAnswers3').length ) {
      $('.jsTriggerAnswers3').trigger('click');
      $('.jsTriggerAnswers3').remove()
    }

  } else if ( $('.jsTriggerAnswers3, .jsTriggerAnswers2, .jsTriggerAnswers1').length ) {
    $('.jsTriggerAnswers3, .jsTriggerAnswers2, .jsTriggerAnswers1').remove()
  }

}

$(document).ready(ready);
$(document).on('page:load', ready);