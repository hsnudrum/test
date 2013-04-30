jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $('.dropdown-toggle').dropdown()
  $('a.whitelink').css('color', '#fff')
  $('.tabs a:first').tab('show')