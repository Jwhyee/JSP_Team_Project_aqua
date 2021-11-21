$(function(){

    var win_w = $(window).width();
    var pos = [];
    var base = -300;

    function save_section_offset(){
        pos = [];
        $('section').each(function(){
            pos.push( $(this).offset().top );
        });
        pos[0] = 0;
    }
    save_section_offset(); //최초 실행

    $(window).on('resize', function(){
        win_w = $(this).width();
        save_section_offset();
    });

    $(window).on('scroll', function(){
        var scroll = $(this).scrollTop();

        $('section').each(function(n){
            if(scroll > pos[n] + base){
                $(this).addClass('on').siblings().removeClass('on');
            }
        });
    });


    $('.tab>li>a').on('click', function(event){
        // event 매개변수에 click에 대한 정보 가져옴. 
        // preventDefault() = 기본기능 막겠다 = 링크 막음.
        event.preventDefault(); 
        var i = $(this).parent().index();
        $('.pannel').hide().eq(i).fadeIn();

    });

    $('.toggle').on('click', function(){
        $('.gnb_wrap').toggleClass('on');
    });



});