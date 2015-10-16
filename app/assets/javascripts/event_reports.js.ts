// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/// <reference path='typings/tsd.d.ts' />

// Hide delete buttons for already-uploaded images
$(() => {
  $('.bgh-delete-button').css('display', 'none');

  var data:Bloodhound<any> = new Bloodhound<any>({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/events.json?search=%QUERY'
    }
  });

  var source: (query: string, cb: (result: any) => void) => void =
    (q:string, cb: (result:any) => void) => {
      cb(['takuro', 'haru', 'takanori', 'rose'])
    };

  $('.ta').typeahead({}, {
    name: 'hoge',
    source: source
  });
})
