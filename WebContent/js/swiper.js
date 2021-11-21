$(function(){
    
    var mySwiper = new Swiper('#visual .swiper-container', {
       
        loop: true, // 무한반복
        pagination: {
            el: '#visual .swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '#visual .swiper-button-next',
            prevEl: '#visual .swiper-button-prev',
        },
        
    });
    
    var swiper = new Swiper('#best_item .swiper-container', {

        loop : true, // 무한반복
        navigation: {
            nextEl: '#best_item .swiper-button-next', // 다음 버튼 지정
            prevEl: '#best_item .swiper-button-prev', // 이전 버튼 지정
        },
        
        // 모바일에서 값
        slidesPerView: 1, 
        slidesPerGroup: 1,
        spaceBetween: 25,
        
        // 반응형 - 수치마다 바뀔값 입력
        breakpoints: {
            640: {
              slidesPerView: 2,
              slidesPerGroup: 2,
            },
            768: {
              slidesPerView: 3,
              slidesPerGroup: 3,
            },
            980: {
              slidesPerView: 4,
              slidesPerGroup: 4,
            },
        }
    });
    
    var swiper = new Swiper('#new_item .swiper-container', {
        loop : true, // 무한반복
        navigation: {
            nextEl: '#new_item .swiper-button-next', // 다음 버튼 지정
            prevEl: '#new_item .swiper-button-prev', // 이전 버튼 지정
        },
    });
  
    var swiper = new Swiper('#md_pick .pic.swiper-container', {
        loop : true, // 무한반복
        
        navigation: {
            nextEl: '#md_pick .swiper-button-next', // 다음 버튼 지정
            prevEl: '#md_pick .swiper-button-prev', // 이전 버튼 지정
        },
    });
  
    var swiper = new Swiper('#md_pick .back.swiper-container', {
        loop : true, // 무한반복
        effect: 'fade',
        navigation: {
            nextEl: '#md_pick .swiper-button-next', // 다음 버튼 지정
            prevEl: '#md_pick .swiper-button-prev', // 이전 버튼 지정
        },
    });
    
    var swiper = new Swiper('#gallery .swiper-container', {
        effect: 'coverflow',
        grabCursor: true,
        centeredSlides: true,
        slidesPerView: 'auto',
        coverflowEffect: {
            rotate: 50,
            stretch: 0,
            depth: 100,
            modifier: 1,
            slideShadows: true,
        },
        pagination: {
            el: '#gallery .swiper-pagination',
        },
        navigation: {
            nextEl: '#gallery .swiper-button-next', // 다음 버튼 지정
            prevEl: '#gallery .swiper-button-prev', // 이전 버튼 지정
        },
    });
  
    
    
    
});










