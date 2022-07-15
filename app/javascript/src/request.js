$(".update-booking").on("click", function(){
  let booking = $(this).attr("id");
  console.log(booking)
  $.ajax({
    url: `/bookings/${booking}`,
    type: 'PUT',
    data: {},
    success: (res) => console.log(res)
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