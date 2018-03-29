class User < ActiveRecord::Base
  has_many :game_users
  has_many :games, through: :game_users


# Returns Users with same platform
# Get users into an array (by platform)

  def self.with_console(platform)
    binding.pry
    User.all.games.select do |game|
      game.console == platform
    end
  end


  def game_console(platform)
    self.games.select do |game|
      game.console == platform
    end
  end
end
