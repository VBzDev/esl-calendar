

$(".update-booking").on("click", function(){

  var booking = $(this).attr("id");

  $.ajax({
    url: `/bookings/${booking}`,
    type: 'PUT',
    data: {
      booking: {
        name: name,
        subject: subject,
        start_time: start_time,
        end_time: end_time
      }
    },
    success: () => {
    }
  });
});

$(".delete-booking").on("click", function(){
  let booking = $(this).attr("id");

  if(confirm('Deseja cancelar esse agendamento?')){
    $.ajax({
      url: `/bookings/${booking}`,
      type: 'DELETE',
      data: {},
      success: () => $(`#display-item-${booking}`).remove()
    });
  }
});

