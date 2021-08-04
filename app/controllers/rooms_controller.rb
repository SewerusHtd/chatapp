class RoomsController < ApplicationController
  def show
    @messages = Message.all
    render RoomComponent.new(messages: @messages)
  end
end
