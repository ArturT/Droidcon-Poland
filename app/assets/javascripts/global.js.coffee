window.goToByScroll = (obj, allowed_margin, up_limit) ->
  if $(obj).length > 0
    current = $(document).scrollTop()
    destination = $(obj).offset().top
    allowed_min = destination - allowed_margin
    allowed_max = destination + allowed_margin
    destination -= up_limit if destination >= up_limit
    if current < allowed_min or current > allowed_max
      $('html,body').animate
        scrollTop: destination, 'slow'
      , ->
        window.location.hash = obj

window.bindGoToByScrollLinks = ->
  $('.x-go-to-by-scroll-links a').click (e) ->
    unless $('.menu-icon').is(':visible')
      e.preventDefault()
      id = $(@).attr('href')
      if window.location.pathname == '/'
        window.goToByScroll(id, 0, 50)
      else
        window.location.href = window.location.origin + '/' + id

window.bindGoToByScrollPerson = ->
  $('.x-go-to-person').click (e) ->
    e.preventDefault()
    id = $(@).attr('href')
    window.goToByScroll(id, 0, 0)
