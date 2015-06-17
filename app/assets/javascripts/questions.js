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
    $('.fields input[type="text"]').addClass('wrong_answer').attr('placeholder', 'Voeg een fout antwoord toe!');
    $('.fields').first().find('input[type="text"]').removeClass('wrong_answer').addClass('correct_answer').attr('placeholder', 'Voeg het JUISTE antwoord toe!');
    if($('.fields input[type="text"]').length == 0) {
      $('.fields label').addClass('wrong_answer').html('Voeg een foute afbeelding toe!');
      $('.fields').first().find('label').removeClass('wrong_answer').addClass('correct_answer').html('Voeg de JUISTE afbeelding'); 
    }
  }
}

$(document).ready(ready);
$(document).on('page:load', ready);