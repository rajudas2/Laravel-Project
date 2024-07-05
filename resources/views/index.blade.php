<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Products</title>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.css">
    
    <!-- Include DataTables JS -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.js"></script>

      <!-- Bootstrap CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
     <!-- Font-awesome -->
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    </head>
    <body>

        <div class="container" style="margin-top: 50px;">

            <h3 class="text-center text-danger"><b>Products</b> </h3>
            <a href="/create" class="btn btn-outline-success">Add New Product</a>

            <table class="table" id="datatble">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Product Price</th>
                    <th>Description</th>
                    <th>Update</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                <tbody>


                    @foreach ($posts as $post)
                 <tr>
                       <th scope="row">{{ $post->id }}</th>
                       <td>{{ $post->product_name }}</td>
                       <td>{{ $post->product_price }}</td>
                       <td>{{ $post->product_desccription }}</td>
                      
                       <td><a href="/edit/{{ $post->id }}" class="btn btn-outline-primary">Edit</a></td>
                       <td>
                           <form action="/delete/{{ $post->id }}" method="post">
                            <button class="btn btn-outline-danger" onclick="return confirm('Are you sure?');" type="submit">Delete</button>
                            @csrf
                            @method('delete')
                        </form>
                       </td>

                   </tr>
                   @endforeach

                </tbody>
              </table>
        </div>




    </body>
</html>
<script>
$(document).ready(function() {
    $('#datatble').DataTable();
});
</script>
