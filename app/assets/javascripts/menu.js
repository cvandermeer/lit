var ready;
ready = function() {

	$('.hamburger, .overlay').on('click', function() {
		$('.menu, .overlay, .hamburger, body').toggleClass('active');
	});

}

$(document).ready(ready);
$(document).on('page:load', ready);