$(function(){

    $('#theme .tab_1>li>a').on('click', function(evnet){
        event.preventDefault();
        $('.panel').hide();
        $(this).next('.panel').show();
    });

    $('#theme .tab_1>li>a').first().trigger('click');

});