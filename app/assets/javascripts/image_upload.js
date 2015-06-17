var ready;
ready = function() {

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $(input).parent().find('.imagePreview').append('<img src="'+e.target.result+'", class="image-preview" />');
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    
    $(".imageUpload").on('change', function(){
        readURL(this);
    });
    
    setTimeout(function() {
        $('.imageUploadAnswer').bind('change', function() {
            readURL(this);
        }); 
    }, 1000);

    if($('.imagePreviewFill').length) {
        $('body').find('.imagePreview').each(function(i) {
            $(this).attr('src', $('.imagePreviewFill').attr('data-image-'+i));
        });
    }

}

$(document).ready(ready);
$(document).on('page:load', ready);