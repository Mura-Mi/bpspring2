// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require picker
//= require picker.date
//= require picker.time
//= require bootstrap-sprockets
//= require fileinput.min
//= require masonry.pkgd.min
//= require imagesloaded.pkgd.min
//= require bgh-masonry
//= require exif
//= require ios-megafile-megapixel
//= require nested_form_fields
//= require typeahead.jquery.min
//= require bloodhound
//= require_tree .

/// <reference path='typings/tsd.d.ts' />

$(() => {
  $(".datepicker").pickadate();
  $('.js-replace-no-image').error(() => {
    $(this).attr({
      src: 'images/no_image.png',
      alt: 'no image'
    });
  });
});
