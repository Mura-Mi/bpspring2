$(function() {
  var querying = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    identify: function(obj) { return obj.name },
    remote: {
      url: '/places.json?search=%QUERY',
      wildcard: '%QUERY'
    }
  });

  $('#ta-event-place').typeahead({
    hint: true,
    minLength: 0,
    highlight: true
  }, {
    name: 'hoge',
    display: 'name',
    source: querying
  }).on('typeahead:selected', function(event, data) {
    $('#bgh-event-place-id').val(data.id)
  }).on('change', function(e) {
    var val = $('#bgh-event-place-id').val();
    if(val == null || val === '') {
      $('#bgh-event-place-id').val('')
    }
  });
})
