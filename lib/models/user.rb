class User < ActiveRecord::Base
  has_many :game_users
  has_many :games, through: :game_users

  def 

  end
end
