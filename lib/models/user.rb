class User < ActiveRecord::Base
  has_many :game_users
  has_many :games, through: :game_users

  def self.with_console_users(platform)
    platform_games = Game.all.select do |game|
      game.console == platform
    end
    users_of_games = []
    all_platform_users = platform_games.map do |game|
      game.users
    end
    binding.pry
    all_platform_users.flatten.uniq
  end

# ***See what games other people have on the same console
# return an array of games on the same console
#
  def same_games
    
  end
end
