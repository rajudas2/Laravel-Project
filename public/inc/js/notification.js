
$(document).ready(function(){
	//$('.clockpicker').clockpicker();
	
    function goToNextTab(){

       var $active = $('.wizard .nav-wizard li.active');

       $active.next().removeClass('disabled');

       nextTab($active);   

   }
	
	$("#add_notification").on("submit", function(e){ 
	    e.preventDefault();
			 var noti = $("#add_notification").serialize();
			 
			 $.ajaxSetup({
				 headers: {
					'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
					 }
				  });
			 $.ajax({
				 type: "POST",
				 url:  base_url+'/insertInfo',
				 data: noti,
				 success:function(data){
				   if($.isEmptyObject(data.error)){
						goToNextTab(); 
					  }else{ 
						   printErrorMsg(data.error);
					  } 
						
				 }
	        });
	
    });
	   function printErrorMsg (msg) {

        $(".print-error-msg").find("ul").html('');

        $(".print-error-msg").css('display','block');

        $.each( msg, function( key, value ) {

                $(".print-error-msg").find("ul").append('<li>'+value+'</li>');  

        });

    }
	
   $(document).on("submit","#notification_tr",function(event){
	       event.preventDefault();
	        $.ajaxSetup({
               headers: {
                  'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                   }
                });
                var notification = $("#notification_tr").serialize();
                $.ajax({
                type:"POST",
                url: base_url+'/targetAudience',
                data: notification,
                success:function(data){
				   if($.isEmptyObject(data.error)){
                    window.location.href= base_url+'/notification/success/Added'; 
					}
					else{
						audiErrorMsg(data.error);
					}
				  }
				  
                });  
   });
   function audiErrorMsg (msg) {
	$(".audi-error-msg").find("ul").html('');
	$(".audi-error-msg").css('display','block');
	$.each( msg, function( key, value ) {
			$(".audi-error-msg").find("ul").append('<li>'+value+'</li>');  
	});
 }
	$(".notification_delete").click(function(){
		     var noti_deleteUrl = $(this).attr("data-url");
			 $(".notiDelClass").attr("href",noti_deleteUrl);			 
		});
	$("#notificationDel").click(function(){
			$('.notiDelClass')[0].click();
		});
	$(document).on("submit","#edit_notification",function(event){
		event.preventDefault();
		$.ajaxSetup({
			headers: {  'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') }
		});
		var noti = $("#edit_notification").serialize();
		$.ajax({
			type: "POST",
			url: base_url+'/edit_noti',
			data: noti,
			success:function(data){
				if($.isEmptyObject(data.error)){
					 goToNextTab(); 
				}
				else{
					 printErrorMsg(data.error);
				}
			  	
			}
		});
	});
	$(document).on("submit","#notification_step2",function(event){
		event.preventDefault();
		$.ajaxSetup({
			headers: {  'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') }
		});
		var noti = $("#notification_step2").serialize();
		$.ajax({
			type: "POST",
			url: base_url+'/editNotiAcc',
			data: noti,
			success:function(data){
                if($.isEmptyObject(data.error)){
					window.location.href = base_url + '/notification/success/Updated';
			   }
			   else{
				     audiErrorMsg(data.error);
			   }
				 
				  
			}
		});
	});
	
	// notification keyword wise search
    var engine = new Bloodhound({
        remote: {
			 wildcard: '%QUERY',
             url: "notificationSearch/%QUERY"
        },
        datumTokenizer: Bloodhound.tokenizers.whitespace('q'),
        queryTokenizer: Bloodhound.tokenizers.whitespace
    });
	
    $(".search-notification").typeahead({
        hint: true,
        highlight: true,
        minLength: 2
    }, {
        source: engine.ttAdapter(),
        // This will be appended to "tt-dataset-" to form the class name of the suggestion menu.
        name: 'notification',
		displayKey: 'notification_title',
        // the key from the array we want to display (name,id,email,etc...)
        templates: {
            empty: [
                '<div class="list-group search-results-dropdown"><h5>Notifications</h5><div class="list-group-item">Nothing found.</div></div>'
            ],
            header: [
                '<div class="list-group search-results-dropdown"><h5>Notifications</h5>'
            ],
            suggestion: function (data) {
				
                return '<a href="notification/' + data.noti_id + '/edit" class="list-group-item" target="_blank">' + data.notification_title + '</a>'
           }
        }
    }
	
	);


	$(document).on("change",".accounts , .jobposition",function(){
		var acct = $(".accounts").val();
		var jobposition = $(".jobposition").val();
		$.ajaxSetup({
			headers: {  'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') }
		});
		$.ajax({
			type: "POST",
			url: base_url+'/filter', 
			data: { "account": acct, "jobp": jobposition },
			success:function(data){
			  $("#notifications").html(data);
			}
		});
	});
	
	$('#rp_training_select')
	  .multiselect({
		maxHeight: 300,
		enableFiltering: true,
		enableCaseInsensitiveFiltering: true,
		allSelectedText: 'All',
		includeSelectAllOption: true,
		nonSelectedText:'Select Training',
		onSelectAll: function() {
			$('button[class="multi_jobpositions"]').attr('title',false);
		},
		buttonTitle: function() {},
	  }).multiselect('updateButtonText');
	  
	  $('#rep_select_1')
	  .multiselect({
		maxHeight: 300,
		enableFiltering: true,
		enableCaseInsensitiveFiltering: true,
		allSelectedText: 'All',
		includeSelectAllOption: true,
		nonSelectedText:'Select Training',
		onSelectAll: function() {
			$('button[class="multi_jobpositions"]').attr('title',false);
		},
		buttonTitle: function() {},
	  }).multiselect('updateButtonText');
	  
	$('.multi_account')
	  .multiselect({
		maxHeight: 300,
		enableFiltering: true,
		enableCaseInsensitiveFiltering: true,
		allSelectedText: 'All',
		includeSelectAllOption: true,
		nonSelectedText:'Select Account',
		onSelectAll: function() {
			$('button[class="multi_jobpositions"]').attr('title',false);
		},
		buttonTitle: function() {},
	  }).multiselect('updateButtonText');


	$('.multi_jobpositions')
	  .multiselect({
		maxHeight: 300,
		enableFiltering: true,
		enableCaseInsensitiveFiltering: true,
		allSelectedText: 'All',
		includeSelectAllOption: true,
		nonSelectedText:'Select Jobposition',
		onSelectAll: function() {
			$('button[class="multi_jobpositions"]').attr('title',false);
		},
		buttonTitle: function() {},
	  }).multiselect('updateButtonText');
	  
	  $('.noti_user_type')
	  .multiselect({
		maxHeight: 300,
		search: false,
		enableFiltering: false,
		enableCaseInsensitiveFiltering: true,
		allSelectedText: 'All',
		includeSelectAllOption: true,
		nonSelectedText:'Select User Type',
		onSelectAll: function() {
			$('button[class="multi_jobpositions"]').attr('title',false);
		},
		buttonTitle: function() {},
	  }).multiselect('updateButtonText');
	  
	  
	  
	  
	  $(document).on("change",".noti_user_type",function(){
	    var noti_user_type=$(this).val();
	    if (noti_user_type=="") {
		$(".multi_jobpositions").multiselect("enable");
	    }
	    else{
		$(".multi_jobpositions").multiselect("disable");
	    }
	  });
	  
	  $(document).on("change",".multi_jobpositions",function(){
	    var multi_jobpositions=$(this).val();
	    if (multi_jobpositions=="") {
		$(".noti_user_type").multiselect("enable");
	    }
	    else{
		$(".noti_user_type").multiselect("disable");
	    }
	  });
		 
});	


