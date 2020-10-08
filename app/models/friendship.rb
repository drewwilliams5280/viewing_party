class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  # def self.establish_friendship(user, friend)
  #   Friendship.new(user: user, friend: friend)
  #   Friendship.new(user: friend, friend: user)
  # end
end
