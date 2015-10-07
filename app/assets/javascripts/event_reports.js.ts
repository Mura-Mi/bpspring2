// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/// <reference path='typings/tsd.d.ts' />

// Hide delete buttons for already-uploaded images
$(() => {
  $('.bgh-delete-button').css('display', 'none');
})
