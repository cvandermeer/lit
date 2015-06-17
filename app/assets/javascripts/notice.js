var ready;

ready = function() {

	if( $('.notice').length ) {
		$('.notice').addClass('active');
		setTimeout(function() {
			$('.notice').removeClass('active');		
		}, 5000);
	}
}

$(document).ready(ready);
$(document).on('page:load', ready);