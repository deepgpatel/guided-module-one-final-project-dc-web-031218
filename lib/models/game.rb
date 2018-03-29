class Game < ActiveRecord::Base

  has_many :game_users
  has_many :users, through: :game_users

  def self.games_without_users(n = 0) # for seeding diagnostic purposes
    Game.all.select{|game| game.users.size <= n }
  end

  def user_employment
    # percentage of users that own this game that are employed

    #use private method, to add in for all consoles
  end

  def user_unemployment
    # inverse of #user_employment
  end

  def user_avg_age
    # avg age of user that owns this game
    # search game instance by self.name in order to get
    #   for each console
    # {console => avg_age}
    output_hash = {}

    instances_array = collect_all_instances_with_this_title

    instances_array.each do |game_on_console|
      if game_on_console # if not nil
        game_on_console_not_nil(game_on_console, output_hash)
      end
    end

    output_hash
  end

  private
  def collect_all_instances_with_this_title
    title = self.title
    # collect all instances with this title:
    all_with_title = Game.all.select{|game| game.title == title}
    # divide into groups, by console:
    # consoles: "PC", "Playstation 4", "Xbox One", "Nintendo"

    pc_instance = all_with_title.find{|game| game.console == "PC"}
    ps4_instance = all_with_title.find{|game| game.console == "Playstation 4"}
    x1_instance = all_with_title.find{|game| game.console == "Xbox One"}
    nin_instance = all_with_title.find{|game| game.console == "Nintendo"}
    # if none selected then returns empty array, not nil
    instances_array = [pc_instance, ps4_instance, x1_instance, nin_instance]
    # each instance is of the game on a specific console, and has many users
  end

  def game_on_console_not_nil(game_on_console, hash)
    users = game_on_console.users
    sum_age = 0
    users.each {|user| sum_age += user.age}
    if users.size == 0
      hash[game_on_console.console] = nil
    else
      avg_age = sum_age / users.size
      hash[game_on_console.console] = avg_age
    end
  end

end
