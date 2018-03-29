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
    all_platform_users.flatten.uniq
  end

# ***See what games other people have on the same console
# return an array of games on the same console
#
  def same_games_as(other_person)
    # grab self games
    # grab other_person games
    # pick out which in common


    mutual_games = []
    self.games.each do |selfs_game|
      other_person.games.each do |others_game|
        if selfs_game == others_game
          mutual_games << selfs_game
        end
      end
    end
    mutual_games


#     self_consoles = self.games.collect do |game|
#       game.console
#     end.uniq
#
# # get all the games for each console
#     throwaway_array = []
#     self_consoles.each do |console|
#       x = Game.all.select do |one_game|
#         one_game.console == console
#       end
#       throwaway_array << x
#     end
#     binding.pry
# # collect only games that have users
#   throwaway_array.flatten!
#
  end



  #
end
