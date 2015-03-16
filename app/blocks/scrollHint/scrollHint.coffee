$ = require('jquery')

module.exports = ->
  $('body').append('<div class="scroll-hint" role="scroll-hint" />')

  @setScrollHintVisibility = ->
    scrollTop =  $(window).scrollTop()
    if scrollTop >= 160
      $(role('scroll-hint')).hide()
    else
      $(role('scroll-hint')).show()
    return

  setScrollHintVisibility()

  $(window).on 'scroll', setScrollHintVisibility
  return
