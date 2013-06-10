jQuery ->
  $('#hitters th a').live 'click', ->
    $.getScript @.href
    return false