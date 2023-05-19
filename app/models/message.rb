class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_create_commit { 
    broadcast_append_to self.room
    broadcast_append_to "users"
  }

  before_create :confirm_participant

  def broadcast
    broadcast_to "rooms" 
    broadcast_append_to self.room
  end

  def confirm_participant
    if self.room.is_private
      is_participant = Participant.where(user_id: self.user.id, room_id: self.room.id).first
      throw :abort unless is_participant
    end
  end
end
