// Text editor js----------------------------------------
function setEditor() {
   $(".textarea_div").each(function() {
    var idd=$(this).attr("id");
    tinymce.init({
    selector: '#editor_'+idd,
    inline: false,
    skin: "black",
    inline_boundaries: true,
    fixed_toolbar_container: '#'+idd,
    menubar: false,
    max_height: 250,
    plugins: [
      'textcolor colorpicker advlist autolink lists link image charmap print preview anchor',
      'searchreplace visualblocks code fullscreen',
      'insertdatetime media table contextmenu paste'
    ],
    toolbar: 'styleselect | bold | italic | forecolor | alignleft aligncenter | bullist numlist | link',
    setup: function (editor) {
        editor.on('blur', function (e) {
          //console.log(editor.getContent());  //get the content from the editor
          $("#text_"+idd).attr("value",editor.getContent());
        });
    }
    });
      
  });
}
//--------------------------------------------------

//Main Menu Icon JS

$(document).ready(function () {
setEditor();
});

// < !--Data Table JS-- >

$(document).ready(function () {

    $('#data_table').DataTable({"pageLength": 50});

    $('#data_table2').DataTable({"pageLength": 50});

    $('#data_table3').DataTable({"pageLength": 50});

});


//----------------------------------------------------

//LMS-------------------------------------------------------------------------
$(document).ready(function(){ 


//Priya's code-------------------------------------------------
 //for user managment.............
 $('.select_location')
     .multiselect({
     maxHeight: 300,
     enableFiltering: true,
     enableCaseInsensitiveFiltering: true,
     allSelectedText: 'All',
     includeSelectAllOption: true,
     nonSelectedText:'Send Notification',
     buttonTitle: function() {},
   }).multiselect('updateButtonText');

//for select category...........
$('.select_category')
     .multiselect({
     maxHeight: 300,
     enableFiltering: true,
     enableCaseInsensitiveFiltering: true,
     allSelectedText: 'All',
     includeSelectAllOption: true,
     nonSelectedText:'Select Category',
     buttonTitle: function() {},
   }).multiselect('updateButtonText');
//for select select_sports...........
  $('.select_sports')
     .multiselect({
     maxHeight: 300,
     enableFiltering: true,
     enableCaseInsensitiveFiltering: true,
     allSelectedText: 'All',
     includeSelectAllOption: true,
     nonSelectedText:'Add Match',
     buttonTitle: function() {},
   }).multiselect('updateButtonText');

//for select status .....
$('.select_status')
     .multiselect({
     maxHeight: 300,
     allSelectedText: 'All',
     includeSelectAllOption: true,
     nonSelectedText:'Select Status',
     buttonTitle: function() {},
   }).multiselect('updateButtonText');
     

 //user delete confirm popup------------------------

	$(".user-delete").click(function(e){
		 e.preventDefault();
		var user_id = $(this).attr("user-id");
      $("#user-delete-btn").attr("user-id",user_id);
      $("#delete_user_modal").modal("show");
	})
		$("#user-delete-btn").click(function(){
		// e.preventDefault();
      var user_id = $(this).attr("user-id");
	  //alert(user_id);
       $.ajaxSetup({
         headers: {
         'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
         }
      });
      $.ajax({
          type:"POST",
          url: base_url+'/ajax/user_delete',
          data: { 'user_id':user_id },
          success:function(res){
            if (res == 'success') {
               alertify.success('user deleted successfully.');
			   location.reload();
            }
			
          }
      });
  
   });


//location delete confirm popup------------------------
	$(".location-delete").click(function(e){
		 e.preventDefault();
         var location_id = $(this).attr("location-id");
         $("#location-delete-btn").attr("location-id",location_id);
         $("#delete_location_modal").modal("show");
	});
    
	  $("#location-delete-btn").click(function(){
		// e.preventDefault();
      var location_id = $(this).attr("location-id");
       $.ajaxSetup({
         headers: {
         'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
         }
      });
      $.ajax({
          type:"POST",
          url: base_url+'/ajax/location_delete',
          data: { 'location_id':location_id },
          success:function(res){
           // if (res == 'success') {
			   alertify.success('location deleted successfully.');
               location.reload();
            //}
          }
      });
  
   });
 


//recipe delete confirm popup------------------------

	$(".recipe-delete").click(function(){
	  var recipe_id = $(this).attr("recipe-id");
      $("#recipe-delete-btn").attr("recipe-id",recipe_id);
      $("#delete_recipe_modal").modal("show");
	});
    
	  
   $("#recipe-delete-btn").click(function(e){
	  e.preventDefault();
      var recipe_id = $(this).attr("recipe-id");
       $.ajaxSetup({
         headers: {
         'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
         }
      });
      $.ajax({
          type:"POST",
          url: base_url+'/ajax/recipe_delete',
          data: { 'recipe_id':recipe_id },
          success:function(res){
               alertify.success('recipe deleted successfully.');
			   location.reload();
          }
      });
   });
 


//recipeitem delete confirm popup------------------------
	$(".recipeitem-delete").click(function(){
		var recipeitemsid = $(this).attr("recipeitem-id");
		//alert(recipeitemsid);
      $("#recipeitem-delete-btn").attr("recipeitem-id",recipeitemsid);
      $("#delete_recipeitem_modal").modal("show");
	})
		$("#recipeitem-delete-btn").click(function(){
      var recipeitem_id = $(this).attr("recipeitem-id");
       $.ajaxSetup({
         headers: {
         'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
         }
      });
      $.ajax({
          type:"POST",
          url: base_url+'/ajax/recipeitem_delete',
          data: { 'recipeitem_id':recipeitem_id },
          success:function(res){
            //if (res == 'success') {
               alertify.success('recipeitem deleted successfully.');
			   location.reload();
			  
            //}
          }
      });
  
   });


   $("#item_category").change(function(){
      var recipeitem_id = $('#item_category option:selected').val();
      $("#hiddenCat").val(recipeitem_id);
   });
   
   $("#item_location").change(function(){
      var loc_id = $('#item_location option:selected').val();
      $("#hiddenLoc").val(loc_id);
   });
   
    $("#user_location").change(function(){
      var loc_id = $('#user_location option:selected').val();
      $("#hiddenULoc").val(loc_id);
   });
   
   $("#user_type").change(function(){

      var user_type = $('#user_type option:selected').val();
      if (user_type == 2) {
         $("#selall").remove();
         $(".select_location").multiselect('destroy');
         $('.select_location')
            .multiselect({
            maxHeight: 300,
            enableFiltering: true,
            enableCaseInsensitiveFiltering: true,
            allSelectedText: 'All',
            includeSelectAllOption: false,
            nonSelectedText:'Select Location',
            buttonTitle: function() {},
          }).multiselect('updateButtonText');
          
        $("#hiddenULoc").val('');  
      }
      else{
        $(".select_location").multiselect('destroy');
        $("#selall").remove();
        $(".select_location").prepend('<option id="selall" value="0">Select all</option>');
       
       $('.select_location')
            .multiselect({
            maxHeight: 300,
            enableFiltering: true,
            enableCaseInsensitiveFiltering: true,
            allSelectedText: 'All',
            includeSelectAllOption: false,
            nonSelectedText:'Select Location',
            buttonTitle: function() {},
          }).multiselect('updateButtonText');
      }
   });

   

 //---------------------------------------------------------------------------------------------------------------------
});

$(function() {
  $("ul.dropdown-menu [data-toggle='dropdown']").on("click", function(event) {
    event.preventDefault();
    event.stopPropagation();
    //method 2: remove show from all siblings of all your parents
    $(this).parents('.dropdown-submenu').siblings().find('.show').removeClass("show");
    
    $(this).siblings().toggleClass("show");
    
    //collapse all after nav is closed
    $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
      $('.dropdown-submenu .show').removeClass("show");
    });
  });
});


//const file = document.querySelector('#file');
//file.addEventListener('change', (e) => {
//  // Get the selected file
//  const [file] = e.target.files;
//  // Get the file name and size
//  const { name: fileName, size } = file;
//  // Convert size in bytes to kilo bytes
//  const fileSize = (size / 1000).toFixed(2);
//  // Set the text content
//  const fileNameAndSize = `${fileName} - ${fileSize}KB`;
//  document.querySelector('.file-name').textContent = fileNameAndSize;
//});

