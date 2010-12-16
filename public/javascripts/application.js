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
  
   