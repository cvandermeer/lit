var ready;
ready = function() {
        
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.imagePreview').attr('src', e.target.result);
            }
            
            reader.readAsDataURL(input.files[0]);
        }
    }
    
    $(".imageUpload").change(function(){
        readURL(this);
    });
}

$(document).ready(ready);
$(document).on('page:load', ready);