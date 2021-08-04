# frozen_string_literal: true

class MessageUserComponent < ViewComponent::Base
  def initialize(email:, time:)
    @email = email
    @time = time
  end

end
