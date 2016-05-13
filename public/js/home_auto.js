$(function(){
  $('.dimmer').on('slidestop', function(event, ui) {
    var dimmer_value = $(this).val();
    var dimmer_id = $(this).attr('id')
    $.post('/set_dimmer', {dimmer_value: dimmer_value, dimmer_id: dimmer_id});
  });

  $('.switch').on('change', function(event) {
    switch_value = !$(this).data('value');
    switch_number = $(this).attr('id');
    $(this).data('value', switch_value)
    $.post('/set_switch', {switch_value: switch_value, switch_number: switch_number});
  });
})
