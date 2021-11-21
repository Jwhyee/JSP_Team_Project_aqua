$(function(){

    var win_w = $(window).width();  

    $(window).on('resize', function(){
        win_w = $(this).width();

        if(win_w > 980){
            $('.submenu').removeAttr('style'); // Attr = html속성, removeAttr = html 속성 제거
            $('.gnb_wrap').removeClass('on');
        }
    });

   
    
    /*----- 하위메뉴가 있는 경우에만 아래 코드 생성함 ------*/
    $('.gnb').on('mouseenter', function(){
        if( win_w > 980 ){  
            $('.bg_gnb').stop(1,1).fadeIn();
            $('.submenu').stop(1,1).fadeIn();
        } else{ 
            $('.gnb>li>a').off(); 
            $('.gnb>li>a').on('click', function(){
                $('.submenu').stop().slideUp(); 
                $(this).next('.submenu').stop().slideToggle();
            });
        }
    });
    
    $('#header').on('mouseleave', function(){
        if( win_w > 980 ){
            $('.bg_gnb').stop(1,1).fadeOut();
            $('.submenu').stop(true, true).fadeOut();
        }        
    });






    $('.toggle').on('click', function(){
        // $('.gnb_wrap').fadeToggle();
        $('.gnb_wrap').toggleClass('on'); // 해당요소에 on 클래스를 추가해라
    });

});

