jQuery ->
  listenForClick = (statistic) ->
    $(statistic).on('click', (e) ->
      id = e.currentTarget.id
      desc_arrow = '#' + id + '-desc'
      asc_arrow = '#' + id + '-asc'
      $(desc_arrow).toggle()
      $(asc_arrow).show()
      console.log e
      console.log id
      console.log desc_arrow
      console.log asc_arrow
    )

  listenForClick('#avg')
  listenForClick('#hr')
  listenForClick('#rbi')
  listenForClick('#runs')
  listenForClick('#sb')
  listenForClick('#ops')