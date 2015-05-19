var ready;
ready = function() {

	$('.js-show-answer').on('click', function(){
		$('.hidden-answer').addClass('active');
		$(this).remove()
	});

};

$(document).ready(ready);
$(document).on('page:load', ready);