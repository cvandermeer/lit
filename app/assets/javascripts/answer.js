var ready;
ready = function() {

	$('.show_answer').on('click', function(){
		$(this).fadeOut();
		$('.js_hidden_answer').fadeIn();

	});

};

$(document).ready(ready);
$(document).on('page:load', ready);