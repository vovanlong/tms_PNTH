$(document).ready(function() {
   var navoffeset=$('.agileits_header').offset().top;
   $(window).scroll(function(){
    var scrollpos=$(window).scrollTop();
    if(scrollpos >=navoffeset){
      $('.agileits_header').addClass('fixed');
    }else{
      $('.agileits_header').removeClass('fixed');
    }
   });

  $('.dropdown').hover(
    function() {
      $('.dropdown-menu', this).stop( true, true ).slideDown('fast');
      $(this).toggleClass('open');
    },
    function() {
      $('.dropdown-menu', this).stop( true, true ).slideUp('fast');
      $(this).toggleClass('open');
    }
  );
});
