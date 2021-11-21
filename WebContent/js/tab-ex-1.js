$(function(){

    $('#parade .tab>li>a').on('click', function(evnet){
        event.preventDefault();
        $('.panel').hide();
        $(this).next('.panel').show();
    });

    $('#parade .tab>li>a').first().trigger('click');

});