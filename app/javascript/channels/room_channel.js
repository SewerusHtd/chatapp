import consumer from "./consumer";

var app_room = consumer.subscriptions.create("RoomChannel", {
    connected: function() {},
    // Called when the subscription is ready for use on the server
    disconnected: function() {},
    // Called when the subscription has been terminated by the server
    received: function(data) {
        return $('#messages').append(data['message']);
    },
    speak: function(message) {
        return this.perform('speak', {
            message: message
        });
    }
});

({
    received: function(data) {}
});

//speak function
$(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
    if (event.keyCode === 13) { //return/enter = send
        if (event.target.value === 'clear') {
            $('#messages').html("");
            event.target.value = '';
            return event.preventDefault();
        } else {
            app_room.speak(event.target.value);
            event.target.value = '';
            return event.preventDefault();
        }
    }
});
