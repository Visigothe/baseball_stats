jQuery ->

  listenForDescAsc = (descLink, ascLink) ->
    $(descLink).click ->
      id = $(descLink).attr('id')
      console.log id
      $(ascLink).addClass('active').show()
      $(descLink).removeClass('active').hide()
      $(descLink).bind('ajax:complete', (html) ->
        $('#hitters').replaceWith(html))

    $(ascLink).click ->
      id = $(ascLink).attr('id')
      console.log id
      $(descLink).addClass('active').show()
      $(ascLink).removeClass('active').hide()
      $(ascLink).bind('ajax:complete', (html) ->
        $('#hitters').replaceWith(html))

  listenForColumnSelection = (column) ->
    $(column).click ->
      deactivateID = $('.active').attr('id')
      $('.active').removeClass('active').hide()
      $('a#'+deactivateID+'.head').show()

      activateID = $(column).attr('id')
      console.log activateID
      $('a#'+activateID+'.desc').addClass('active').show()
      $('a#'+activateID+'.head').hide()
      $('a#'+activateID+'.head').bind('ajax:complete', (html) ->
        $('#hitters').replaceWith(html))

  # Batting Average
  listenForColumnSelection('a#avg.head')
  listenForDescAsc('a#avg.desc', 'a#avg.asc')

  # Home Runs
  listenForColumnSelection('a#hr.head')
  listenForDescAsc('a#hr.desc', 'a#hr.asc')

  # RBI
  listenForColumnSelection('a#rbi.head')
  listenForDescAsc('a#rbi.desc', 'a#rbi.asc')

  # Runs
  listenForColumnSelection('a#runs.head')
  listenForDescAsc('a#runs.desc', 'a#runs.asc')

  # Steals
  listenForColumnSelection('a#sb.head')
  listenForDescAsc('a#sb.desc', 'a#sb.asc')

  # OPS
  listenForColumnSelection('a#ops.head')
  listenForDescAsc('a#ops.desc', 'a#ops.asc')


