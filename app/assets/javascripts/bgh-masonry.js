bgh_masonry_exec = function() {
  $('.grid').masonry({
    itemSelector:    '.grid-item',
    columnWidth:     '.grid-sizer',
    percentPosition: true
  }).masonry('layout');
};

$().imagesLoaded(bgh_masonry_exec);
