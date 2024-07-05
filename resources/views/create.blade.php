<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Laravel</title>

      <!-- Bootstrap CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
     <!-- Font-awesome -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    </head>
    <body>

        <div class="container" style="margin-top: 50px;">
            <div class="row">


                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <h3 class="text-center text-danger"><b>Add New Product</b> </h3>
				    <div class="form-group">
                        <form action="/post" method="post" enctype="multipart/form-data">
                         @csrf
        				 <input type="text" name="product_name" class="form-control m-2" placeholder="product name" required>
        				 <input type="text" name="product_price" class="form-control m-2" placeholder="product price" required>
                         <Textarea name="product_desccription" cols="20" rows="4" class="form-control m-2" placeholder="product_desccription" required></Textarea>


                         <label class="m-2">Images</label>
                         <input type="file" id="input-file-now-custom-3" class="form-control m-2" name="images[]" multiple required>

                        <button type="submit" class="btn btn-danger mt-3 ">Submit</button>
                        </form>
                   </div>
                </div>
            </div>



         </body>
</html>
<script>

        $(document).ready(function() {
    $("#form").on('submit', function(e) {
        e.preventDefault();
        
        var formData = new FormData(this);
        var _token = $("#_token").val().trim();
        formData.append('product_name', $("#product_name").val());
        formData.append('product_price', $("#product_price").val());
        formData.append('product_description', $("#product_description").val());
        formData.append("file", $("#file")[0].files[0]);
        
        $.ajax({
            url: "/post",
            type: "POST",
            data: formData,
            headers: {
                'X-CSRF-Token': _token // Include CSRF token in headers if required
            },
            contentType: false,
            cache: false,
            processData: false,
            success: function(data) {
                // Handle success response
                console.log(data);
                alert(data);
            },
            error: function(xhr, status, error) {
                // Handle error
                console.error(xhr.responseText);
            }
        });
    });
});

</script>









