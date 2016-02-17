// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/// <reference path='typings/tsd.d.ts' />

$(function() {
  $('.user-image-cache').change(function(ee) {
    if(this.files[0] != null) {

      var file = this.files[0];
      EXIF.getData(file, function(){
              var orientation = file.exifdata.Orientation;
              var mpImg = new MegaPixImage(file);
              mpImg.render($('.user-image')[0], { orientation: orientation });
          });

    }
  });
});
