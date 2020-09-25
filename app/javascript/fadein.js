function scroll_fadein(){
  jQuery('.exam-content').each(function(){
      var elemPos = jQuery(this).offset().top;
      var scroll = jQuery(window).scrollTop();
      var windowHeight = jQuery(window).height();
      if (scroll > elemPos - windowHeight + 150){
          jQuery(this).addClass('scrollin');
      }
  });
}

jQuery(function(){
  jQuery(window).scroll(function (){
      scroll_fadein();
  });
  scroll_fadein();
});