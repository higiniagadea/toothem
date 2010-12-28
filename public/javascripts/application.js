function ttip_edit_field(objeto, campof, id){
    $("#"+objeto).qtip(
        {
           content:{
               url:'/pacientes/'+id+'/editfield',
               data:{campo: campof},
               method: 'get'
            },
           position: 'topLeft', // Set its position
           hide: {
              fixed: true // Make it fixed so it can be hovered over
           },
           style: {
              padding: '2px 2px', // Give it some extra padding
              name: 'blue' // And style it with the preset dark theme
           }
        });
}
$(document).ready(function(){
  //Oculta los notice
    function runEffect() {

        var selectedEffect = 'blind';

        var options = {};

        $(".notice-error div").hide(selectedEffect, options, 500);};
        setTimeout(function() {
            $(".notice-error div").hide('blind', {}, 500)
        }, 4000);

        $(".notice-error p").click(function() {
                runEffect();
                return false;
        });


    $(":submit").button();
    $(":button").button();


})
  jQuery.ajaxSetup({'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript,application/javascript,text/html")}})
    $(":submit").button();
    $(":button").button();
    $(function() {
  $('input[datatype=numeric]').keypress(function(e) {
    key = (document.all) ? e.keyCode : e.which;
    if (key==8) return true;
    patron =/\d/;
    te = String.fromCharCode(key);
    return patron.test(te);
   });

   jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
   })

  jQuery(document).ready(function($) {
    $('div.ajax-pagination a').live('click', function() {
    $('#resultados').load(this.href)
    return false
  });
 

  $('div.result a').live('click', function() {
    $('#resultados').load(this.href)
    return false
  });

 $('div.ajax-pagination a').live('click', function() {
    $('#trata').load(this.href)
    return false
  });
 

  $('div.tratam a').live('click', function() {
    $('#trata').load(this.href)
    return false
  });



$('div.ajax-pagination a').live('click', function() {
    $('#ficha_pag').load(this.href)
    return false
  });


  $('div.ficha_pag a').live('click', function() {
    $('#fich').load(this.href)
    return false
  });

$('div.ajax-pagination a').live('click', function() {
    $('#presta ').load(this.href)
    return false
  });


  $('div.pres a').live('click', function() {
    $('#presta').load(this.href)
    return false
  });








})
    })