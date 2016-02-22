$(function() {
  $('#bgh-place-filter').change(function() {
    var name = $('#bgh-place-filter').val();
    if(name != null && name != '') {
      var pat = new RegExp(name, 'i');
      $('.place-grid').each(function(i, e) {
        if (!pat.test($(e).attr('name'))) {
          $(e).css('display', 'none')
        } else {
          $(e).css('display', 'inherit')
        }
      });
    } else {
      $('.place-grid').css('display', 'inherit')
    }
  });
});
