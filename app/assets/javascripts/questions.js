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
      $('.answerfield').find('input').css('border', '3px solid red');
      $('.answerfield').first().find('input').css('border', '3px solid green');
      $('.jsTriggerAnswers1').remove()
    }
    if ( $('.jsTriggerAnswers2').length ) {
      for (i = 0; i < 2; i++) {
        $('.jsTriggerAnswers2').trigger('click');
      }
      $('.answerfield').find('input').css('border', '3px solid red');
      $('.answerfield').first().find('input').css('border', '3px solid green');
      $('.jsTriggerAnswers2').remove()
    }
    if ( $('.jsTriggerAnswers3').length ) {
      $('.jsTriggerAnswers3').trigger('click');
      $('.answerfield').first().find('input').css('border', '3px solid green');
      $('.jsTriggerAnswers3').remove()
    }

  }

}

$(document).ready(ready);
$(document).on('page:load', ready);