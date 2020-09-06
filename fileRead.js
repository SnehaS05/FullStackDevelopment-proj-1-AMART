 function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#promo')
                .attr('src', e.target.result)
                .attr('alt', e.target.result)
                .width(150)
                .height(200);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
$("#imgInp").change(function() {
  readURL(this);
});