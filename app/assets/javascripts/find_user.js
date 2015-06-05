var ready;
var searchFormVal;

ready = function() {

	$('.jsSearchForm').on('keyup', function() {
		setTimeout(function() {
			searchFormVal = $('.jsSearchForm').val();
			if(searchFormVal.length > 1) {
				$('.jsSearchForm').submit();
			}
		}, 200);
	});

	$('.jsFindUser').on('ajax:success', function(evt, post, status) {
		$('.jsFoundUsers').html('');
		searchFormVal = $('.jsSearchForm').val();
		if(post.length) {
			for(i = 0; i < post.length; i++) {
				if(i < 10) {
					$('.jsFoundUsers').append('<p>Naam: <a href="/users/' + post[i].id + '">' + post[i].name + '</a></p>');
				} else {
					return false;
				}
			}
		} else {
			$('.jsFoundUsers').append('<p>Er zijn geen gebruikers gevonden met de naam: '+ searchFormVal +'</p>')
		}
	});

}

$(document).ready(ready);
$(document).on('page:load', ready);