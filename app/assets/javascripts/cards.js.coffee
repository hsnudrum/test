# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  card.setupform()

card =
  setupform: ->
    $('#new_card').submit ->
      $('input[type=submit]').attr('disabled',true)
      if $('#card_number').length
        card.processCard()
        false
      else
        true

  processCard: ->
    card_info =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card_info, card.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#card_stripe_card_token').val(response.id)
      $('#new_card')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled',false)
