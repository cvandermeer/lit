var ready;
ready = function() {

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $(input).parent().find('.imagePreview').attr('src', e.target.result);
            }
            
            reader.readAsDataURL(input.files[0]);
        }
    }
    
    $(".imageUpload").on('change', function(){
        readURL(this);
    });
    
    setTimeout(function() {
        $('.imageUpload').bind('change', function() {
            readURL(this);
        }); 
    }, 300);

    if($('.imagePreviewFill').length) {
        $('body').find('.imagePreview').each(function(i) {
            $(this).attr('src', $('.imagePreviewFill').attr('data-image-'+i));
        });

    }

}

$(document).ready(ready);
$(document).on('page:load', ready);