class Game < ActiveRecord::Base

  has_many :game_users
  has_many :users, through: :game_users

  def self.games_without_users(n = 0) # for seeding diagnostic purposes
    puts Game.all.select{|game| game.users.size <= n }.size
    Game.all.select{|game| game.users.size <= n }
  end

  def user_employment
    # percentage of users that own this game that are employed
    output_hash = {}
    # use private method, to add in for all consoles
    instances_array = collect_all_instances_with_this_title

    instances_array.each do |game_on_console|
      if game_on_console # if not nil
        game_on_console_not_nil_2_user_employment_1(game_on_console, output_hash)
      end
    end
    output_hash
  end

  def user_unemployment
    # inverse of #user_employment
    output_hash = {}
    # use private method, to add in for all consoles
    instances_array = collect_all_instances_with_this_title

    instances_array.each do |game_on_console|
      if game_on_console # if not nil
        game_on_console_not_nil_2_user_employment_2(game_on_console, output_hash)
      end
    end
    output_hash
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
        game_on_console_not_nil_1_user_avg_age(game_on_console, output_hash)
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

  def game_on_console_not_nil_1_user_avg_age(game_on_console, hash)
    # get averages, push to hash
    users = game_on_console.users
    sum_age = 0
    users.each {|user| sum_age += user.age}
    if users.size == 0
      hash[game_on_console.console] = nil
    else
      avg_age = sum_age.to_f / users.size
      hash[game_on_console.console] = avg_age
    end
  end

  def game_on_console_not_nil_2_user_employment_1(game_on_console, hash)
    # get employment percentages, push to hash
    users = game_on_console.users

    employed_count = 0
    users.each do |user|
      if user.employed
        employed_count += 1
      end
    end
    if users.size == 0
      hash[game_on_console.console] = nil
    else
      employment_ratio = employed_count.to_f / users.size
      employment_percentage = employment_ratio * 100
      hash[game_on_console.console] = "#{employment_percentage} %"
    end

  end

  def game_on_console_not_nil_2_user_employment_2(game_on_console, hash)
    # get employment percentages, push to hash
    users = game_on_console.users

    employed_count = 0
    users.each do |user|
      if user.employed
        employed_count += 1
      end
    end
    if users.size == 0
      hash[game_on_console.console] = nil
    else
      employment_ratio = employed_count.to_f / users.size
      employment_percentage = employment_ratio * 100
      unemployment_percentage = 100.0 - employment_percentage
      hash[game_on_console.console] = "#{unemployment_percentage} %"
    end

  end
end
