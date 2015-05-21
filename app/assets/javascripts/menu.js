var ready;
ready = function() {

	$('.hamburger').on('click', function() {
		$(this).toggleClass('active');
		$('.menu, .overlay').toggleClass('active');
	});

}



$(document).ready(ready);
$(document).on('page:load', ready);