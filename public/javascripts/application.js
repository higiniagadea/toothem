
$(document).ready(function(){
   jQuery.ajaxSetup({'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript,application/javascript,text/html")}})
});


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


 
     /*$('input:text').keypress(function(e){
        if (e.keyCode == 13) {
            //on_submit
            return false;
        }
      });*/

      /*$('input:text').keypress(function(e){
        if (e.keyCode == 13) {
            $('form').submit();
        }
      }); */


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

    })



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
   $('#consult').load(this.href)
   return false
  });

  $('div.consulto a').live('click', function() {
    $('#consult').load(this.href)
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

  $('div.ajax-pagination a').live('click', function() {
    $('#obra ').load(this.href)
    return false
  });

  $('div.social a').live('click', function() {
    $('#obra').load(this.href)
    return false
  });

  $('div.ajax-pagination a').live('click', function() {
    $('#clinicas ').load(this.href)
    return false
  });

  $('div.clinica a').live('click', function() {
    $('#clinicas').load(this.href)
    return false
  });

  $('div.ajax-pagination a').live('click', function() {
    $('#profesionales ').load(this.href)
    return false
  });
  $('div.profesional a').live('click', function() {
    $('#profesionales').load(this.href)
    return false
  });

  $('div.ajax-pagination a').live('click', function() {
    $('#varios').load(this.href)
    return false
  });

  $('div.diente a').live('click', function() {
    $('#varios').load(this.href)
    return false
  });

 $('div.ajax-pagination a').live('click', function() {
    $('#busq_turnos').load(this.href)
    return false
  });

  $('div.bturno a').live('click', function() {
    $('#busq_turnos').load(this.href)
    return false
  });

  $('div.ajax-pagination a').live('click', function() {
    $('#periodoresult').load(this.href)
    return false
  });

  $('div.periodos a').live('click', function() {
    $('#periodoresult').load(this.href)
    return false
  });

 $('div.ajax-pagination a').live('click', function() {
    $('#cuentas').load(this.href)
    return false
  });

  $('div.cuenta a').live('click', function() {
    $('#cuentas').load(this.href)
    return false
  });


  $('div.ajax-pagination a').live('click', function() {
    $('#periodoobrasocial').load(this.href)
    return false
  });

  $('div.periodo a').live('click', function() {
    $('#periodoobrasocial').load(this.href)
    return false
  });

  $('div.ajax-pagination a').live('click', function() {
    $('#cuenta_pac').load(this.href)
    return false
  });

  $('div.cuenta_tratam a').live('click', function() {
    $('#cuenta_pac').load(this.href)
    return false
  });


   $('div.ajax-pagination a').live('click', function() {
    $('#cuentass').load(this.href)
    return false
  });

  $('div.c_tratamientos a').live('click', function() {
    $('#cuentass').load(this.href)
    return false
  });

   $('div.ajax-pagination a').live('click', function() {
    $('#pagosos').load(this.href)
    return false
  });

  $('div.ospago a').live('click', function() {
    $('#pagosos').load(this.href)
    return false
  });

  $('div.ajax-pagination a').live('click', function() {
    $('#tareas').load(this.href)
    return false
  });

  $('div.btareas a').live('click', function() {
    $('#tareas').load(this.href)
    return false
  });

  $('div.ajax-pagination a').live('click', function() {
    $('#usuario_pag').load(this.href)
    return false
  });

  $('div.usuario a').live('click', function() {
    $('#usuario_pag').load(this.href)
    return false
  });
});
     
    

   /* $(function () {
  $('#resultados th a').live('click', function () {
    $.load(this.href);
    return false;
  });
});

$(function () {
  $('#resultados th a, #resultados .pagination a').live('click',function () {
      $.load(this.href);
      return false;
    }
  );
})*/