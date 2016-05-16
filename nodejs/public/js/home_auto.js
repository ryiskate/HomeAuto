$(function(){
  $('.dimmer').on('slidestop', function(event, ui) {
    var dimmer_value = $(this).val();
    var dimmer_id = $(this).attr('id')
    $.post('/set_dimmer', {dimmer_value: dimmer_value, dimmer_id: dimmer_id});
  });

  $('.switch').on('change', function(event) {
    switch_status = $(this).is(':checked');
    switch_id = $(this).attr('id');
    $.post('/set_switch', {switch_status: switch_status, switch_id: switch_id});
  });
})
