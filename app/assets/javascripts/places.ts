/// <reference path='typings/tsd.d.ts' />

$(() => {
  $('#bgh-place-filter').change(() => {
    var name:string = $('#bgh-place-filter').val();
    if(name != null && name != '') {
      var pat:RegExp = new RegExp(name, 'i');
      $('.place-grid').each((i, e) => {
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
