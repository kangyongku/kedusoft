
/*************************************************************************************************
 
 *  Slider JS
 
 *************************************************************************************************/

$(function(){
	
	"use strict";

/*---------------------------------------------------------------------------------------------------------------------------
 *  Main : Visaul Slide1
 *--------------------------------------------------------------------------------------------------------------------------*/	
	
	var swiper1 = new Swiper('.visu_slide1', {
		pagination:false,
		spaceBetween: 0,
		autoplayDisableOnInteraction: false,
		autoplay: 4500,
		effect: 'fade',
		speed: 1500,
		loop:true,
		centeredSlides:true,
		allowSlidePrev:false,
		allowSlideNext:false,
        paginationClickable: false
	}); 


/*---------------------------------------------------------------------------------------------------------------------------
 *  Main : Visaul Slide2
 *--------------------------------------------------------------------------------------------------------------------------*/	
	
	var swiper2 = new Swiper('.visu_slide2', {
		pagination: false,
		nextButton: '.visu-next',
        prevButton: '.visu-prev',
		spaceBetween: 20,
		slidesPerView: 4,
		loop:true,
		speed: 500,
		autoplay: 3000,	
		autoplayDisableOnInteraction: false,
        paginationClickable: true,
		breakpoints: {  
  
			1200: {       
				slidesPerView: 3,       
				spaceBetween: 20     
			},
			940: {       
				 slidesPerView: 2,       
				 spaceBetween: 10     
			},
			480: {       
				 slidesPerView:1,       
				 spaceBetween: 10     
			}  
		}
	}); 

	// var slNum = swiper2.activeIndex;
	// alert(slNum);

	$('.visu_slide2 .swiper-slide a').on('focusin',function(e){
		swiper2.stopAutoplay();
		
		//alert(num2);
		swiper2.slideTo(0,1000);
	})

	$('.visu_slide2 .swiper-slide a').on('focusout',function(){
		swiper2.startAutoplay();
	})
	

/*---------------------------------------------------------------------------------------------------------------------------
 *  Main : photo_slide
 *--------------------------------------------------------------------------------------------------------------------------*/
 
	var swiper3 = new Swiper('.photo_slide', {
		pagination: false,
		nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
		spaceBetween: 12,
		slidesPerView: 3,
		autoplayDisableOnInteraction: false,
		autoplay: 3000,
		loop:true,
		speed: 500,
		breakpoints: {  
     
			600: {       
				 slidesPerView: 2,       
				},
		   } 
		   	
	}); 
	
	$('.photo a.start-autoplay').click(function () {
		swiper3.startAutoplay();
	});
	$('.photo a.stop-autoplay').click(function () {
		swiper3.stopAutoplay();
	});
	

	$('.photo_slide .swiper-slide a').on('focusin',function(e){
		swiper3.stopAutoplay();
		
		//alert(num2);
		swiper3.slideTo(0,1000);
	})

	$('.photo_slide .swiper-slide a').on('focusout',function(){
		swiper3.startAutoplay();
	})



/*---------------------------------------------------------------------------------------------------------------------------
 *  Main : link_slide
 *--------------------------------------------------------------------------------------------------------------------------*/
 
	var swiper4 = new Swiper('.link_slide', {
		pagination: false,
		nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
		slidesPerView: 7,
		autoplayDisableOnInteraction: false,
		autoplay: 2000,
		loop:true,
		breakpoints: {  
  
			1024: {       
				 slidesPerView: 5,       
			  },
			768: {       
				 slidesPerView: 3,       
			  },
		   } 
		   
	}); 
	
	$('.banner_link a.start-autoplay').click(function () {
		swiper4.startAutoplay();
	});
	$('.banner_link a.stop-autoplay').click(function () {
		swiper4.stopAutoplay();
	});

	$('.link_slide .swiper-slide a').on('focusin',function(e){
		swiper4.stopAutoplay();
		
		//alert(num2);
		swiper4.slideTo(0,1000);
	})

	$('.link_slide .swiper-slide a').on('focusout',function(){
		swiper4.startAutoplay();
	})
	
});
