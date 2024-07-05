$(document).ready(function () { 
//for add employee

      $(document).on("change", "#employee_email", function () {
        // remove classes from all
        var emval = $(this).val();
        if (emval != '') {

          $('#employee_uploadfiles').prop("disabled", true);
          $('#employee_msg').text("You Can't Add Both File With Email Address ");


          //event.preventDefault();
        }
        else {
          $('#employee_uploadfiles').prop("disabled", false);
          $('#employee_msg').text("");

        }
      });



      ///employee permission change

      $('.employeeselect').change(function () {

        var employeeid = $(this).attr('employeeid');
        var role = $(this).val();;

        // console.log(employeeid);
        // console.log(role);


         $.ajaxSetup({
        headers: {
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
      });
      // var formdata =  $('#training_edit_form').serialize();
      $.ajax({
        type: "POST",
        url: base_url + '/empupdate',


        data: { 'employeeid': employeeid, 'role': role },
        success: function (data) {
         // $("#target-attempt-table").html(data);
         // console.log(data);

          document.location.reload(); 

        }
      });


     



      });
     


      //other


    arrVal=[];
      
      $('#optionsCheckboxes').click(function(){
        
            if($(this).prop("checked") == true){
               $('input:checkbox').not(this).prop('checked', this.checked);
               $(".chk").each(function(){
               arrVal.push($(this).val());
               });
            }
            else if($(this).prop("checked") == false){
               $('input:checkbox').not(this).prop('checked', false);
               arrVal=[];
               $(emailvalues).val(arrVal);
            }         
            
           // console.log(arrVal);
             $(emailvalues).val(arrVal);

            
        });

        $('.chk').click(function(){


          if($(this).prop("checked") == true){
              arrVal.push($(this).val());              

             $(emailvalues).val(arrVal);
            }
            else if($(this).prop("checked") == false){
              arrVal.remByVal($(this).val()); 

             $(emailvalues).val(arrVal);
            }



        
          console.log(arrVal);
         // alert($(this).val());
        
             
       
        });


$(document).on("change","#training_list",function() {
  training_audience('',0);
  training_audience2('',0);
});
 
//Sync Account---------------------------------------
$(document).on("click","#sync_account",function() {
   var current_effect = 'bounce';
  $.LoadingOverlay("show",{
    text        : "Please wait..."
  });
$.ajaxSetup({
            headers: {
                     'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
          }); 
              
          $.ajax({
              type: "POST",
              url: ajax_url + '/sync_account',
                  success: function(data){
                     // console.log(data);
                      $.LoadingOverlay("hide");
                      alertify.success('Account synchronization done.');
                }
          });
});
//---------------------------------------------------
//Sync Jobpositions----------------------------------
$(document).on("click","#sync_jp",function() {
   var current_effect = 'bounce';
  $.LoadingOverlay("show",{
    text        : "Please wait..."
  });
$.ajaxSetup({
            headers: {
                     'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
          }); 
              
          $.ajax({
              type: "POST",
              url: ajax_url + '/sync_jp',
                  success: function(data){
                      //console.log(data);
                      $.LoadingOverlay("hide");
                      alertify.success('Jobpositions synchronization done.');
                }
          });
});
//---------------------------------------------------

//Sync Jobpositions----------------------------------
$(document).on("click","#sync_tr_qn",function() {
   var current_effect = 'bounce';
  $.LoadingOverlay("show",{
    text        : "Please wait..."
  });
$.ajaxSetup({
            headers: {
                     'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
          }); 
              
          $.ajax({
              type: "POST",
              url: ajax_url + '/sync_tranining_notes',
                  success: function(data){
                      //console.log(data);
                      $.LoadingOverlay("hide");
                      alertify.success('Training notes synchronization done.');
                }
          });
});
//---------------------------------------------------

function run_waitMe(effect){
 
        $('#change_settings').waitMe({
                effect: effect,
                text: 'Please waiting...',
                bg: 'rgba(255,255,255,0.7)',
                color:'#000'
        });
}

});

    Array.prototype.remByVal = function(val) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] === val) {
            this.splice(i, 1);
            i--;
        }
    }
    return this;
}





function training_audience(text,offset) {

  var training=document.getElementById("training_list").value;
  
  //console.log(text);
  if (training!='') {
   
      $.ajaxSetup({
                 headers: {
                          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                         }
               }); 
               // var formdata =  $('#training_edit_form').serialize();
                 $.ajax({
                         type: "POST",
                        // url: "<?php echo url('/showtrainingaudience/');?>",

                     url: base_url + '/showtrainingaudience',
                         data: {'training': training,'searchStr':text},
                         success: function(data){
                              $("#target-audience-table").html(data);
                             //console.log(data);
                       }
                 });
  }
  else{
    $("#target-audience-table").html('');
  }
  
}

function training_audience2(text,offset) {

  var training=document.getElementById("training_list").value;
   // var text=document.getElementById("targetaudiencesearch").value;
//console.log(text);
  
 
 if (training!='') {

   $.ajaxSetup({
                 headers: {
                          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                         }
               }); 
               // var formdata =  $('#training_edit_form').serialize();
                 $.ajax({
                         type: "POST",
                     url: base_url + '/showtrainingcomplete',

                         
                           data: {'training': training,'searchStr':text},
                         success: function(data){
                              $("#target-attempt-table").html(data);
                             //console.log(data);
                       }
                 });

 }
 else{
  $("#target-attempt-table").html('');
 }
}


$("#targetaudiencesearch").keyup(function(){
   var targetaudiencesearch=$("#targetaudiencesearch").val();

    var offset=0;
      training_audience(targetaudiencesearch,offset);
});

$("#target-audience-button").click(function(){
    var targetaudiencesearch=$("#targetaudiencesearch").val();
    var offset=0;
      training_audience(targetaudiencesearch,offset);
});

$("#targetattemptsearch").keyup(function(){
  var targetattemptsearch=$("#targetattemptsearch").val();
    var offset=0;
      training_audience2(targetattemptsearch,offset);
});
$("#target-attempt-button").click(function(){
    var targetattemptsearch=$("#targetattemptsearch").val();
    var offset=0;
      training_audience2(targetattemptsearch,offset);

   //   alert(targetattemptsearch);
});


function fileSelect(id) {
 // console.log(e.target.files[0].name);

  var filename = $('input[type=file]').val().replace(/.*(\/|\\)/, '');
  $('#employee_msg').prepend(filename + '<a href="javascript:location.reload(true)"> &nbsp; <i class="material-icons">delete</i></a>');
  $('#employee_email').prop("disabled", true);
}