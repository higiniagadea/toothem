// hover effect
$(document).ready(function() {
  $('div.demo-show h3').add('div.demo-show2 h3').hover(function() {
    $(this).addClass('hover');
  }, function() {
    $(this).removeClass('hover');
  });
});

// independently show and hide
$(document).ready(function() {
  $('div.demo-show:eq(0) > div').hide();  
  $('div.demo-show:eq(0) > h3').click(function() {
    $(this).next().slideToggle('slow');
  });
});

// one showing at a time

$(document).ready(function() {
  $('div.demo-show:eq(1) > div:gt(0)').hide();  
  $('div.demo-show:eq(1) > h3').click(function() {
    $(this).next('div:hidden').slideDown('slow')
    .siblings('div:visible').slideUp('slow');
  });
});


//simultaneous showing and hiding

$(document).ready(function() {
  $('div.demo-show2:eq(0) > div').hide();
  $('div.demo-show2:eq(0) > h3').click(function() {
    $(this).next('div').slideToggle('slow')
    .siblings('div:visible').slideUp('slow');
  });
});

//queued showing and hiding
$(document).ready(function() {
  $('div.demo-show2:eq(1) > div').hide();  
  $('div.demo-show2:eq(1) > h3').click(function() {
    var $nextDiv = $(this).next();
    var $visibleSiblings = $nextDiv.siblings('div:visible');

    if ($visibleSiblings.length ) {
      $visibleSiblings.slideUp('slow', function() {
        $nextDiv.slideToggle('slow');
      });
    } else {
       $nextDiv.slideToggle('slow');
    }
  });
});

