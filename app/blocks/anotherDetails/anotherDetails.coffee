$ = require('jquery')

module.exports = ->
  $(role('open-another-details-popup')).click ->
    $(role('another-details-popup')).addClass 'active'
    return

  $(role('another-details-popup-close')).click ->
    $(role('another-details-popup')).removeClass 'active'
    return

  # Get the form.
  form = $(role('details-request-form'))
  # Get the messages div.
  formMessages = $(role('details-form-messages'))
  # Set up an event listener for the contact form.
  $(form).submit (event) ->
    # Stop the browser from submitting the form.
    event.preventDefault()
    # Serialize the form data.
    formData = $(form).serialize()
    # Submit the form using AJAX.
    $.ajax(
      type: 'POST'
      url: $(form).attr('action')
      data: formData
    ).done((response) ->
      # Make sure that the formMessages div has the 'success' class.
      $(formMessages).removeClass 'error'
      $(formMessages).addClass 'success'
      # Set the message text.
      $(formMessages).text response
      # Clear the form.
      form.find('[name="vin"]').val ''
      form.find('[name="name"]').val ''
      form.find('[name="contact"]').val ''
      return
    ).fail (data) ->
      # Make sure that the formMessages div has the 'error' class.
      $(formMessages).removeClass 'success'
      $(formMessages).addClass 'error'
      # Set the message text.
      if data.responseText != ''
        $(formMessages).text data.responseText
      else
        $(formMessages).text 'Ошибка'
      return
    return
  return
