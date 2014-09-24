//= require spree/frontend
//= require jquery.hoverIntent
//= require jquery.ui.all
//= require jquery.bxslider
//= require jquery.dotdotdot-1.5.2
//= require matchMedia
//= require enquire


$(function(){

  // Hide flash messages after timeout
  setTimeout('$(".flash").fadeOut(1000)', 5000);

  // Home sliders
  if($('#main-slider').length > 0) {

    var cached_carousel_1 = $('#featured-products .carousel').html();
    var cached_carousel_2 = $('#latest-products .carousel').html();

    $('#main-slider > ul').bxSlider({
      adaptiveHeight: true,
      auto: true,
      autoHover: true,
      useCSS: true,
      controls: false,
      pagerSelector: '.slider-pager',
      touchEnabled: true
    });

    $('.carousel').bxSlider({
      minSlides: 1,
      maxSlides: 4,
      useCSS: true,
      slideWidth: 230,
      slideMargin: 10,
      auto: true,
      autoHover: true,
      controls: false,
      touchEnabled: true
    });

    $("#main-slider .slide-description").dotdotdot({
      watch: true,
      height: 250
    });

  }

});

