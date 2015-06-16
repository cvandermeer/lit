var ready;
ready = function() {

	if( $('.question-types').length ) {
		var questionType = $('.js-set-active').attr('data-class-name');
		$('.question-types').find(questionType).addClass('active')
	}
  
  if ( $('.jsTriggerAnswers').length ) {
    var timesToTrigger = parseInt($('.jsTriggerAnswers').attr('data_trigger_times'));
    for (i = 0; i < timesToTrigger; i++) {
     $('.jsTriggerAnswers').trigger('click');
    }
    $('.jsTriggerAnswers').remove();
    if ($('form .fields').length > timesToTrigger) {
      var timesToRemove = $('form .fields').length - timesToTrigger
      for (i = 0; i < timesToRemove; i++) {
        $('form p .fields').last().remove();
      }
    }
  }
}

$(document).ready(ready);
$(document).on('page:load', ready);