var ready;
ready = function() {

	if( $('.question-types').length ) {
		var questionType = $('.js-set-active').attr('data-class-name');
		$('.question-types').find(questionType).addClass('active')
	}

  if ( $('.jsTriggerAnswers1').length ) {
    $('.jsTriggerAnswers1').trigger('click');
    $('.jsTriggerAnswers1').trigger('click');
    $('.jsTriggerAnswers1').trigger('click');
    $('.jsTriggerAnswers1').trigger('click');
    $('.jsTriggerAnswers1').remove()
  }
  if ( $('.jsTriggerAnswers2').length ) {
    $('.jsTriggerAnswers2').trigger('click');
    $('.jsTriggerAnswers2').trigger('click');
    $('.jsTriggerAnswers2').remove()
  }
  if ( $('.jsTriggerAnswers3').length ) {
    $('.jsTriggerAnswers3').trigger('click');
    $('.jsTriggerAnswers3').remove()
  }

}

$(document).ready(ready);
$(document).on('page:load', ready);