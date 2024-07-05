$(document).ready(function(){
  
//Reports JS Functions------------------------------------
$('.testselect1').SumoSelect();
jQuery("#report_from_date").datepicker();
jQuery("#report_to_date").datepicker();
$('#data_table2').DataTable();
//--------------------------------------------------------

  $(document).on("change",".report_data",function(){
  var from_date=$("#report_from_date").val();
  var to_date=$("#report_to_date").val();
  var training_ids=$("#rep_select_1").val();
  var position_id=$("#jb_position_rp1").val();
  //console.log(from_date+'<>'+to_date);
  //Call ajax-----------------------------------------
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: ajax_url+'/ajax_get_job_position_vs_user_rate',
        data: {'from_date':from_date,'to_date':to_date,'training_ids':training_ids,'position_id':position_id}, 
        success: function (data) {
          //Chart function--------------------
          //var myObj = JSON.parse(data);
           //console.log(data);
           //var chartData = [];
           generatechartData(data);
          //----------------------------------
        }
    });
    //-----------------------------------------------
  });
 
    
//generatechartData2();

//---------------------------------------------------
$(document).on("change","#jb_position_rp1",function(){
  var position_id=$(this).val();
  //Call ajax-----------------------------------------
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: ajax_url+'/ajax_get_traning_by_position',
        data: {'position_id':position_id}, 
        success: function (data) {
          //Chart function--------------------
          $("#rep_select_1").html(data);
          $("#rep_select_1").multiselect('rebuild');
          //----------------------------------
        }
    });
    //-----------------------------------------------
});
//---------------------------------------------------
//Change training type-------------------------------
$(document).on("click",".tr_type",function(){
  var type=$(this).val();
  //Call ajax-----------------------------------------
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: ajax_url+'/ajax_get_traning_list',
        data: {'type':type}, 
        success: function (data) {
          //Chart function--------------------
         // $("#rp_training_select").html('');
          $("#rp_training_select").html(data);
          $("#rp_training_select").multiselect('rebuild');
          //----------------------------------
        }
    });
    //-----------------------------------------------
});
//---------------------------------------------------
//Get Report Data 2----------------------------------
$(document).on("change",".get_rpt2_data",function(){
var training_ids=$("#rp_training_select").val();
var position_id=$("#rpt_jobposition").val();
var from_date=$("#report_from_date").val();
var to_date=$("#report_to_date").val();
//console.log(from_date+'/'+to_date);
//Call ajax-----------------------------------------
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: ajax_url+'/ajax_get_trtype_vs_user_rate',
        data: {'from_date':from_date,'to_date':to_date,'training_ids':training_ids,'position_id':position_id}, 
        success: function (data) {
          //Chart function--------------------
          //var myObj = JSON.parse(data);
           console.log(data);
           //var chartData = [];
           generatechartData2(data);
          //----------------------------------
        }
    });
    //-----------------------------------------------
})
//---------------------------------------------------
//Get Report Data 3----------------------------------
$(document).on("change",".get_rpt3_data",function(){
var account_ids=$("#select_acc").val();
var show_count=$("#show_count").val();
var from_date=$("#report_from_date").val();
var to_date=$("#report_to_date").val();
//console.log(from_date+'/'+to_date);
//Call ajax-----------------------------------------
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        type: "POST",
        url: ajax_url+'/ajax_get_leaderboard',
        data: {'from_date':from_date,'to_date':to_date,'account_ids':account_ids,'show_count':show_count}, 
        success: function (data) {
          // console.log(data);
           $("#leader_tbody").html(data);
          //----------------------------------
        }
    });
    //-----------------------------------------------  
});
//---------------------------------------------------
});



//---Job Position vs User Rate---------------------------------------
function generatechartData(data) {
    var chartData = [];
    var firstDate = new Date();
    firstDate.setDate(firstDate.getDate() - 150);
    
    var arr = JSON.parse(data);
    var visitsj=arr.length;
   // console.log(visitsj);
            arr.forEach(function(elementObject){
              var newDate = new Date(elementObject['date']);
              console.log(newDate);
                chartData.push({
                    date: newDate,
                    visits: elementObject['rate'],
                    tname: elementObject['tname']
                });
            });
            
            
    //for (var i = 0; i < 150; i++) {
    //    // we create date objects here. In your data, you can have date strings
    //    // and then set format of your dates using chart.dataDateFormat property,
    //    // however when possible, use date objects, as this will speed up chart rendering.
    //    var newDate = new Date(firstDate);
    //    newDate.setDate(newDate.getDate() + i);
    //
    //    visits += Math.round((Math.random()<0.5?1:-1)*Math.random()*10);
    //
    //    chartData.push({
    //        date: newDate,
    //        visits: visits,
    //        cc:4
    //    });
    //    
    //    //console.log(newDate);
    //}

    
   //----------------------------------------------------
var chart = AmCharts.makeChart("chartdiv", {
    "theme": "light",
    "type": "serial",
    "marginRight": 50,
    "autoMarginOffset": 20,
    "marginTop":20,
    "dataDateFormat": "YYYY-MM",
    "dataProvider": chartData,
    "valueAxes": [{
        "id": "v1",
        "axisAlpha": 0.1
    }],
    "graphs": [{
        "useNegativeColorIfDown": true,
        "balloonText": "Traning: [[tname]]<br><b>User Rate: [[value]]</b>",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletBorderColor": "#FFFFFF",
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "lineColor": "#fdd400",
        "negativeLineColor": "#67b7dc",
        "valueField": "visits",
        "ccField": "tname"
    }],
    
    //"chartScrollbar": {
    //    "scrollbarHeight": 5,
    //    "backgroundAlpha": 0.1,
    //    "backgroundColor": "#868686",
    //    "selectedBackgroundColor": "#67b7dc",
    //    "selectedBackgroundAlpha": 1
    //},
    "categoryAxesSettings": {
        "maxSeries": 1,
        "groupToPeriods": ["MM"]
    },
    "chartCursor": {
        "valueLineEnabled": true,
        "valueLineBalloonEnabled": true
    },
    "categoryField": "date",
    "categoryAxis": {
        "parseDates": true,
        "axisAlpha": 0,
        "minHorizontalGap": 40,
        "minPeriod":"MM"
    },
    "export": {
        "enabled": true
    },
    "listeners": [{
    "event": "dataUpdated",
    "method": function(e) {
       e.chart.zoomToIndexes(30, visitsj-1);
      // console.log('Start zoom index: ', e.chart.startIndex,  'End zoom index: ', e.chart.endIndex);
    }
  }]
});  
}
//------------------------------------------------------
//Traning Type vs User Rate-----------------------------
function generatechartData2(data) {
   var chartData = [];
    var firstDate = new Date();
    firstDate.setDate(firstDate.getDate() - 150);
    
    var arr = JSON.parse(data);
    var visitsj=arr.length;
   // console.log(visitsj);
            arr.forEach(function(elementObject){
              var newDate = new Date(elementObject['date']);
              console.log(newDate);
                chartData.push({
                    date: newDate,
                    visits: elementObject['rate'],
                    tname: elementObject['tname']
                });
            });
            
            
    
   //----------------------------------------------------
var chart = AmCharts.makeChart("chartdiv2", {
    "theme": "light",
    "type": "serial",
    "marginRight": 50,
    "autoMarginOffset": 20,
    "marginTop":20,
    "dataDateFormat": "YYYY-MM",
    "dataProvider": chartData,
    "valueAxes": [{
        "id": "v1",
        "axisAlpha": 0.1
    }],
    "graphs": [{
        "useNegativeColorIfDown": true,
        "balloonText": "Traning: [[tname]]<br><b>User Rate: [[value]]</b>",
        "bullet": "round",
        "bulletBorderAlpha": 1,
        "bulletBorderColor": "#FFFFFF",
        "hideBulletsCount": 50,
        "lineThickness": 2,
        "lineColor": "#fdd400",
        "negativeLineColor": "#67b7dc",
        "valueField": "visits",
        "ccField": "tname"
    }],
    
    //"chartScrollbar": {
    //    "scrollbarHeight": 5,
    //    "backgroundAlpha": 0.1,
    //    "backgroundColor": "#868686",
    //    "selectedBackgroundColor": "#67b7dc",
    //    "selectedBackgroundAlpha": 1
    //},
    "categoryAxesSettings": {
        "maxSeries": 1,
        "groupToPeriods": ["MM"]
    },
    "chartCursor": {
        "valueLineEnabled": true,
        "valueLineBalloonEnabled": true
    },
    "categoryField": "date",
    "categoryAxis": {
        "parseDates": true,
        "axisAlpha": 0,
        "minHorizontalGap": 40,
        "minPeriod":"MM"
    },
    "export": {
        "enabled": true
    },
    "listeners": [{
    "event": "dataUpdated",
    "method": function(e) {
       e.chart.zoomToIndexes(30, visitsj-1);
      // console.log('Start zoom index: ', e.chart.startIndex,  'End zoom index: ', e.chart.endIndex);
    }
  }]
}); 
}
//------------------------------------------------------