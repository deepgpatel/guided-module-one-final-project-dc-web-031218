class User < ActiveRecord::Base
  has_many :game_users
  has_many :games, through: :game_users

# # Returns an array of GameUsers log
#   def game_users
#     GameUser.all.select do {|log| log.user == self}
#   end
#
# # Returns an array of Games associated with each gameuser log
#   def games
#     game_users.map do {|games| games.user}
#   end

# Returns all Users for a given console
  def consoles(platform)
    Game.find_by(console: "platform")
  end


end
