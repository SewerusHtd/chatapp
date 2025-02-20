import consumer from "./consumer"

App.room = consumer.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']

  speak: (message) ->
    @perform 'speak', message: message

received: (data) ->

#speak function
$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 #return/enter = send
    if event.target.value == 'clear'
      $('#messages').html("")
      event.target.value = ''
      event.preventDefault()
    else
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()