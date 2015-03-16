$ = require('jquery')

module.exports = ->
  # Get the form.
  form = $(role('request-form'))
  # Get the messages div.
  formMessages = $(role('form-messages'))
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
