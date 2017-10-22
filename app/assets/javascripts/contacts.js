$(document).on('turbolinks:load', function() {
  $('#send-message').on("submit", function(e) {
    e.preventDefault();
    body = $('textarea').val();
    id = $('#contact-id-field').val();
    token = $("input[name='token'").val();
    $ajax({
      url: ""
    })
  })

  $('.open-modal').click(function() {
    contact = $(this).parent();
    $('#recipient').text("Message to " + contact.find('.full-name').text());
    $('#contact-id-field').val(contact.find('.contact-id').text());
  })
})
