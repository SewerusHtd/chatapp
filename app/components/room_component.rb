# frozen_string_literal: true

class RoomComponent < ViewComponent::Base
  def initialize(messages:)
    @messages = messages
  end

end
