//jQuery is required to run this code
$( document ).ready(function() {

  //time picker
    $('.datepicker').datetimepicker({
      inline: true,
      format:'d.m.Y h:i a',
      step: 30
    });
    console.log('before triggers');

    // for the timepicker to show when loads the page
    $('.xdsoft_today_button').click(function(){
      $(this).datetimepicker('show');
    });
    $('.xdsoft_today_button')[0].click();



    console.log('after triggers');

});
