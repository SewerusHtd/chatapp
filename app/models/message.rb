class Message < ApplicationRecord
  belongs_to :user
  after_create_commit { MessageBroadcastJob.perform_later self}

  def can_manage?(user)
    user.id == self.user_id or user.is_a? Admin
  end
end
