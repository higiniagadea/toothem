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