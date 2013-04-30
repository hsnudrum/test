# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('.carousel').carousel()
  $( ".jqui_accordion" ).accordion({event: "mouseover"; collapsible: false; autoHeight: false; navigation: false;}) # autoHeight: false,     # navigation: true,     # collapsible: true,     # icons: false
  $('#accordion-1').easyAccordion({ autoStart: true, slideInterval: 3000 });
