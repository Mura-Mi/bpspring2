// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/// <reference path='typings/tsd.d.ts' />

// Hide delete buttons for already-uploaded images
$(function() {
  $('.bgh-delete-button').css('display', 'none');

  var data = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/events.json?search=%QUERY',
      wildcard: '%QUERY'
    }
  });

  $('.ta').typeahead({}, {
    name: 'hoge',
    source: data
  });
})
