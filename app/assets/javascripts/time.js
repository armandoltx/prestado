//jQuery is required to run this code
$( document ).ready(function() {

  var startDate, endDate;

  var calculatePrice = function () {
    if (startDate === undefined || endDate === undefined) {
      return;
    }

    var days = parseInt((endDate - startDate) / (24 * 60 * 60 * 1000));
    $('#days').text(days);
    // var rate = 20; // FIXME
    $('#amount').text('$' + days * rate);
    $('#preview').show();
  };

  //time picker
    $('.datepicker-start').datetimepicker({
      inline: true,
      format:'d.m.Y h:i a',
      step: 30,
      onChangeDateTime: function (d) {
        startDate = d;
        calculatePrice();
      }
    });

    $('.datepicker-end').datetimepicker({
      inline: true,
      format:'d.m.Y h:i a',
      step: 30,
      onChangeDateTime: function (d) {
        endDate = d;
        calculatePrice();
      }
    });

    console.log('before triggers');

    // for the timepicker to show when loads the page
    $('.xdsoft_today_button').click(function(){
      $(this).datetimepicker('show');
    });
    $('.xdsoft_today_button')[0].click();



    console.log('after triggers');

});
