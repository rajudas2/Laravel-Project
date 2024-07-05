$(document).ready(function () {
 //Set Account on Repo--------------------------
 $(document).on("click",".set_acc",function(e){
    e.preventDefault();
   var acc_id=$(this).attr("acc-id");
   $("#account_id").attr("value",acc_id);
   $("#folder_id").attr("value",0);
   $("#file_searh").val('');
   //Active menu function----------------
   $(".acc-ul li a").each(function(){
    $(this).removeClass("active");
   });
   
   $(this).addClass("active");
   //-----------------------------------
   var fileSearchQstr=$("#file_searh").val();
   $("#result_no").val(6);
   get_repo_list(acc_id,'',fileSearchQstr,'');
 });
 //---------------------------------------------
 //Search Account-------------------------------
 $(document).on("keyup","#search_account",function(){
     searchQstr=$(this).val();
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: ajax_url+'/get_ajax_search_account',
        data: { 'searchQstr': searchQstr },
        success: function (resp) {
            $("#acc-ul_list").html(resp);
        } 
    });
 });
 //---------------------------------------------
 //Get ajax repo details------------------------
 $(document).on("click",".rpo_list_li",function(e){
    e.preventDefault();
   var repo_id=$(this).attr("idd");
   var repo_type=$(this).attr("repo-type");
   if (repo_type!=='folder') {
   $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: ajax_url+'/get_ajax_repo_details',
        data: { 'repo_id': repo_id },
        success: function (resp) {
            $(".repository-right-panel").html(resp);
        } 
    });
   }
 });
 //---------------------------------------------
 //Delete Repo Confirm mssage-------------------
 $(document).on("click",".repo_delete",function(e){
    e.preventDefault();
    var repo_id=$(this).attr("idd");
    $("#del_repo_id").attr("value",repo_id);
    $("#repo_delete_modal").modal("show");
 });
 //---------------------------------------------
 //Delete Repo----------------------------------
 $(document).on("click","#delete_repo_item",function(){
    var repo_id=$("#del_repo_id").attr("value");
    
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: ajax_url+'/ajax_repo_delete',
        data: { 'repo_id': repo_id },
        success: function (resp) {
           //console.log(resp);
           $("#rpo_list_li"+repo_id).remove();
        } 
    });
    
 });
 //---------------------------------------------
 //Ajax Repo Load More--------------------------
 $(document).on('click','.show_more',function(){
        var ID = $(this).attr('id');
        var resno=+$("#result_no").val();
        var acc_id=$("#account_id").attr("value");
        $('.show_more').hide();
        $('.loding').show();
        var fileSearchQstr=$("#file_searh").val();
        
        $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
        });
        $.ajax({
            type:'POST',
            url:ajax_url+'/ajax_load_more',
            data:{'repo_id':ID,'resno':resno,'acc_id':acc_id,'fileSearchQstr':fileSearchQstr},
            success:function(html){
                $('#show_more_main'+ID).remove();
                $('#repo-list').append(html);
                $("#result_no").val(resno+6);
               // console.log(html);
            }
        });
    });
 //---------------------------------------------
 //---------------------------------------------
 $(document).on("click",".chkAcc",function(){
   
    var acc_id=$(this).attr("acc-id");
    if($(this).prop("checked") == true){
    $("#li"+acc_id).addClass("active");
    }
    else if($(this).prop("checked") == false){
    $("#li"+acc_id).removeClass("active");
    }
    
    var favorite = [];
    $.each($("input[name='acc_chek']:checked"), function(){
        favorite.push($(this).val());
    });
   // alert("My favourite sports are: " + favorite.join(", "));
    $("#account_id").attr("value",favorite.join(", "));       
      //console.log(favorite[0]);
    done_link(favorite[0]);
 });
 //--------------------------------------------
 //Search Account-------------------------------
 $(document).on("keyup","#search_add_account",function(){
     searchQstr=$(this).val();
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: ajax_url+'/get_ajax_add_search_account',
        data: { 'searchQstr': searchQstr },
        success: function (resp) {
            $("#add-acc-ul_list").html(resp);
        } 
    });
 });
 //---------------------------------------------
 //Search Repo files----------------------------
 $("#file_search_btn").click(function(){
   var acc_id=$("#account_id").attr("value");
   fileSearchQstr=$("#file_searh").val();
  get_repo_list(acc_id,'',fileSearchQstr,'');
 });
 $('#file_searh').keypress(function(event){
    var acc_id=$("#account_id").attr("value");
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
        fileSearchQstr=$(this).val();
        get_repo_list(acc_id,'',fileSearchQstr,'');
    }
  });
 $('#file_searh').keyup(function(){
    var acc_id=$("#account_id").attr("value");
   fileSearchQstr=$("#file_searh").val();
   if (fileSearchQstr=='') {
    get_repo_list(acc_id,'',fileSearchQstr,'');
   }
 });
 //---------------------------------------------
 //---------------------------------------------
 $(document).on("click","#chk_all",function(){
        if($(this).prop("checked") == true){
            $('input:checkbox').not(this).prop('checked', this.checked);
        }
        else if($(this).prop("checked") == false){
            $('input:checkbox').not(this).prop('checked', false);
            $("#account_id").attr("value","");
            $("#add-acc-ul_list li").removeClass("active");
        }
        
        var favorite = [];
        $.each($("input[name='acc_chek']:checked"), function(){
            var acc_id=$(this).attr("acc-id");
            $("#li"+acc_id).addClass("active");
            favorite.push($(this).val());
        });
       // alert("My favourite sports are: " + favorite.join(", "));
       //console.log(favorite.join(", "));
        $("#account_id").attr("value",favorite.join(", "));
        done_link(favorite[0]);
        });
 
 //--------------------------------------------
 //Repo Create folder--------------------------
  $(document).on("click","#create_folder",function(e){
    $("#folder_name").val('New folder');
    $("#fld_msg").hide();
    $("#repo_create_folder_modal").modal("show");
  });
  $(document).on("click","#create_folder_btn",function(e){
   acc_id=$("#account_id").attr("value");
   folder_id=$("#folder_id").attr("value");
   var folder_name=$("#folder_name").val();
   $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: ajax_url+'/ajax_repo_create_folder',
        data: { 'acc_id': acc_id,'folder_id':folder_id,'folder_name':folder_name },
        success: function (resp) {
            console.log(resp);
            if (resp==='success') {
             $("#repo_create_folder_modal").modal("hide");
             var fileSearchQstr=$("#file_searh").val();
             get_repo_list(acc_id,'','','');
            }
            else{
             $("#fld_msg").show();
            }
            
        } 
    });
  });
 //--------------------------------------------
 //Repo open folder on dblClick----------------
 $(document).on("dblclick",".rpo_list_li",function(e){
    var acc_id=$("#account_id").attr("value");
    var repo_type=$(this).attr("repo-type");
    var folder_id=$("#folder_id").attr("value");
    var repo_id=$(this).attr("idd");
    if (repo_type==='folder') {
       $("#folder_id").attr("value",repo_id);
       get_repo_list(acc_id,'','','');
    }
    
 });
 //--------------------------------------------
//Repo open folder on open butten click--------
 $(document).on("click",".open-folder",function(e){
    var acc_id=$("#account_id").attr("value");
    var repo_type=$(this).attr("repo-type");
    var folder_id=$("#folder_id").attr("value");
    var repo_id=$(this).attr("repo-id");
    if (repo_type==='folder') {
       $("#folder_id").attr("value",repo_id);
       get_repo_list(acc_id,'','','');
    }
    
 });
 //--------------------------------------------
  //Rename Repo element-------------------------
 $(document).on("click",".rename",function(e){
    e.preventDefault();
    var repo_id=$(this).attr("repo-id");
    var prv_text=$("#repo-title-"+repo_id).text();
    $("#repo-title-"+repo_id).attr('prv_text',prv_text);
    $("#repo-title-"+repo_id).attr('contentEditable',true);
    $("#repo-title-"+repo_id).focus();
    $("#repo-title-"+repo_id).css({"border-color": "#000", 
             "border-width":"1px", 
             "border-style":"solid","display": "block"});
   });
 
 $(document).on("focusout",".repo-title",function(e){
    $(this).css({"border": "none"});
    $(this).attr('contentEditable',false);
    var rename_text=$(this).text();
    var repo_id=$(this).attr("repo-id");
    var prv_text=$("#repo-title-"+repo_id).attr('prv_text');
    console.log(prv_text);
    //Call Ajax---------------------
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: ajax_url+'/rename_repo_item',
        data: { 'repo_id':repo_id,'rename_text':rename_text},
        success: function (resp) {
         if (resp==0) {
            $("#repo-title-"+repo_id).text(prv_text);  
         }
         else{
           $("#repo-title-"+repo_id).attr('prv_text',rename_text); 
         }
        } 
    });
    //------------------------------
  });
 //--------------------------------------------
 //Up one level--------------------------------
 $(document).on("click","#up_one_level",function(e){
    var acc_id=$("#account_id").attr("value");
    repo_id=$("#folder_id").attr("value");
    get_repo_list(acc_id,'','','up');
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: ajax_url+'/get_folder_id',
        data: { 'repo_id':repo_id },
        success: function (resp) {
            $("#folder_id").attr("value",resp);
        } 
    });
 });
 //--------------------------------------------

 //add_url_link--------------------------------
 $(document).on("mouseover","#add_url_link",function(e){
   var acc_id=$("#account_id").attr("value");
   var folder_id=$("#folder_id").attr("value");
   var url=base_url+'/repository/add/';
   var urll=url+'?account_id='+acc_id+'&folder_id='+folder_id;
   $(this).attr("href",urll);
  });
 //--------------------------------------------
 
 //Context menu on right click-----------------
// Make the menu-------------------------------
//$('.repo-li-style .rpo_list_li').bind('contextmenu', function (event) {
$(document).on('contextmenu','.repo-li-style .rpo_list_li', function (event) {
    event.preventDefault();
    var idd=$(this).attr('idd');
    var repo_type=$(this).attr('repo-type');
    var repo_au_type=$(this).attr('repo-au-type');
    var current_repo_user_type=$(this).attr('crpat');
    delete_str='<a href="#" idd="'+idd+'" class="fn repo_delete"><i class="fa fa-trash" aria-hidden="true"></i> Delete</a>';
    if (current_repo_user_type==2 && repo_au_type==1) {
      delete_str='';
    }
    $('div.custom-menu').hide();
    if (repo_type==='folder') {
        var menu='<div class="custom-menu"><a href="#" repo-id="'+idd+'" repo-type="'+repo_type+'" class="fr open-folder"><i class="fa fa-folder-open" aria-hidden="true"></i> Open</a><a href="#" repo-id="'+idd+'" class="fl rename"><i class="fa fa-edit" aria-hidden="true"></i> Rename</a>'+delete_str+'</div>';
    }
    else{
        var menu='<div class="custom-menu"><a href="#" repo-id="'+idd+'" class="fl rename"><i class="fa fa-edit" aria-hidden="true"></i> Rename</a>'+delete_str+'</div>';   
    }
   
    $(menu)
        .appendTo("body")
        .css({
        top: event.pageY + "px",
        left: event.pageX + "px"
    });
});

// Remove the menu
$(document).bind("click", function (event) {
    $("div.custom-menu").hide();
    //event.preventDefault();
});
 //--------------------------------------------
});

//Get account wise repo list------------------- 
function get_repo_list(acc_id,repo_id,searchStr,uplevel) {
    folder_id=$("#folder_id").attr("value");
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: ajax_url+'/get_ajax_repo_list',
        data: { 'acc_id': acc_id,'repo_id':repo_id,'folder_id':folder_id,'searchStr':searchStr,'uplevel':uplevel },
        success: function (resp) {
            $("#repo-list").html(resp);
        } 
    });
}
//---------------------------------------------

Dropzone.options.uploadWidget = {

        paramName: "file", // The name that will be used to transfer the file

        maxFilesize: 50, // MB

        dictDefaultMessage: "<img src='"+base_url+"/public/inc/images/plus.png' alt='Upload File'>",

        acceptedFiles: 'image/* ,video/* ,application/pdf/* ,application/docx/* ,text/plain/* ,application/zip/*',

        success:function( file, response){
            //console.log(response);
          if (response=='success') {
            //alertify.success('File Uploaded.');
            //$("#upload-widget").append("<div class='dz-default dz-message' style='display:block;'><span><img src='"+base_url+"/public/inc/images/plus.png' alt='Upload File'></span></div>");
            $(".dz-message").show();
            $("#done_btn").show();
            }
            else{
              alertify.error('Select Account first!');
              $(".dz-preview").remove();
              $(".dz-message").remove();
              $("#upload-widget").append("<div class='dz-default dz-message' style='display:block;'><span><img src='"+base_url+"/public/inc/images/plus.png' alt='Upload File'></span></div>");
            }
         }
      };
      
      
//-------------------------------------------
function done_link(acc_id) {
   var href=base_url+'/repository';
   var new_href=href+'?accid='+acc_id;
   if (typeof acc_id != 'undefined') {
      $("#done_btn_anc").attr("href",new_href);
   } 
}