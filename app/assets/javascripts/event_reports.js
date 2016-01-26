// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/// <reference path='typings/tsd.d.ts' />

// Hide delete buttons for already-uploaded images
$(function() {
  $('.bgh-delete-button').css('display', 'none');

  var querying = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    identify: function(obj) { return obj.name },
    remote: {
      url: '/events.json?search=%QUERY',
      wildcard: '%QUERY'
    }
  });

  $('.ta').typeahead({
    hint: true,
    minLength: 0,
    highlight: true
  }, {
    name: 'hoge',
    display: 'name',
    source: querying
  }).on('typeahead:selected', function(event, data) {
    $('#bgh-event-report-event-id').val(data.id)
  }).on('change', function(e) {
    var val = $('.ta').val();
    if(val == null || val === '') {
      $('#bgh-event-report-event-id').val('')
    }
  });

  $('#event_report_modal').on('show.bs.modal', function(e) {
    var button = $(e.relatedTarget);
    var recipient = button.data('url');
    var modal = $(this)
    modal.find('.modal-body').append("<img class='img-responsive' src='"+ recipient +"'/>")
  });

  $('#event_report_modal').on('hidden.bs.modal', function(e) {
    $(this).find('.modal-body').empty();
  });
})
