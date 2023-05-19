class User < ApplicationRecord
  has_many :messages
  validates_uniqueness_of :username
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }

  def self.find_or_create_by_username(username)
    user = User.where(username).first
    if user
      user
    else
      User.create(username)
    end
  end

  private

  def current_user_is_authenticated?
    redirect_to '/signin' unless current_user
  end
end