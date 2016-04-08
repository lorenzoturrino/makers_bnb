$(document).ready(function() {
  $(function() {
      function setRange(start, end) {
          $('#reportrange span').html(start.format('D MMMM YYYY') + ' - ' + end.format('D MMMM YYYY'));
          $('input[name="booking_start"]').val(start.format('YYYY-MM-DD'));
          $('input[name="booking_end"]').val(end.format('YYYY-MM-DD'));
      }
      setRange(moment().subtract(29, 'days'), moment());
      $('#reportrange').daterangepicker({
          "locale": {
              "format": "D MMMM YYYY",
              "separator": " - ",
              "applyLabel": "Select dates",
              "cancelLabel": "Clear"
            },
          "isInvalidDate": function(date){
            for(i=0;i<booked_dates.length;i++){
              if (date.format('YYYY-MM-DD') === booked_dates[i]){
                return true;
              }
            }
          },
        }, setRange);
  });

})
