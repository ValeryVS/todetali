$ = require('jquery')

module.exports = ->
  # mobile check
  @mobileCheck = ->
    (/Android|iPhone|iPad|iPod|BlackBerry/i)
      .test(navigator.userAgent or
            navigator.vendor or
            window.opera)

  # role selector
  @role = (s) -> "[role=\"#{s}\"]"

  # smooth anchor links
  @smoothAnchorLinks = ->
    $("a[href*=#]:not([href=#])").click ->
      if (location.pathname.replace(/^\//, "") is
          @pathname.replace(/^\//, "") and
          location.hostname is @hostname)
        target = $(@hash)
        if target.length
          target = target
        else
          target = $("[name=" + @hash.slice(1) + "]")
        if target.length
          if typeof skrollrEl isnt 'undefined'
            skrollrEl.animateTo(target.offset().top)
          else
            $("html,body").animate
              scrollTop: target.offset().top
            , 1000
            false

    $("a[href=#]").click ->
      $("html,body").animate
        scrollTop: 0
      , 1000
      false
      return
  return
