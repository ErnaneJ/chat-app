class User < ApplicationRecord
  has_many :messages
  validates_uniqueness_of :username
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }

  def self.find_or_create_by_username(username)
    user = User.find_by(username)
    if user
      user
    else
      User.create(username)
    end
  end
end