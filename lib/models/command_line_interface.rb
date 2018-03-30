# Instead, let's create a Command Line Interface model in our lib directory.
# This model won't have a corresponding table, it's just going to be a place
# for us to write methods relating to the interface of our app. Now, let's
# move the greet method definition into the Command Line Interface model.
require "pry"
# require_relative "../../bin/run.rb"
# require_relative "./user.rb"
# require_relative "./game.rb"
# require_relative "./game_user.rb"

class CommandLineInterface

  def welcome
    puts TerminalFormat.full_star_border
    puts TerminalFormat.to_mid + "Waddup User. Welcome"
    puts TerminalFormat.to_mid + "to Deep and Bruno's"
    puts TerminalFormat.to_mid + "Module 1 Project:"
    puts TerminalFormat.to_mid + "User | GameUser | Game"
    puts TerminalFormat.full_star_border
  end

  def main_commands_prompt
    user_commands = ["Display all users", "Add user", "Remove user", "Explore user-specifc commands"]
    game_commands = ["Display all games", "Add game", "Remove game", "Explore game-specific commands"]
    final_command = "Exit program"

    puts "Pleace select a command number:"
    puts TerminalFormat.dash_border
    puts "User commands:"
    puts TerminalFormat.under_command
    user_commands.each_with_index do |comm, i|
      puts "#{i+1} - #{comm}"
    end
    puts TerminalFormat.under_command
    puts "Game commands:"
    puts TerminalFormat.under_command
    game_commands.each_with_index do |comm, i|
      user_length_constant = user_commands.length
      puts "#{i + user_length_constant + 1} - #{comm}"
    end
    puts TerminalFormat.under_command
    puts "General commands:"
    puts TerminalFormat.under_command
    puts "#{1 + user_commands.length + game_commands.length} - #{final_command}"
    puts TerminalFormat.dash_border
  end

  def get_user_input
    print "Command number choice:  "
    input = gets.chomp
  end

  def until_valid_main(input)
    possible_main_commands = (1..9).to_a.collect{|n| "#{n}"}
    until possible_main_commands.include?(input)
      puts TerminalFormat.half_star_border
      puts ">>> '#{input}' is an invalid choice of command. <<<"
      puts TerminalFormat.half_star_border
      main_commands_prompt
      input = get_user_input
    end
    input
  end

  def main1
    # "Display all users"
    User.all.each_with_index do |user, i|
      if user.employed
        employment_status = "employed"
      else
        employment_status = "unemployed"
      end
      puts "#{i + 1}. #{user.name} (#{user.age} y.o., #{employment_status})"
    end
  end

  def main2
    # "Add user"
    puts TerminalFormat.half_star_border
    puts "Current task: Add user"
    puts TerminalFormat.half_star_border
    print "Enter a name for user:  "
    user_name = gets.chomp
    puts TerminalFormat.dash_border
    print "Enter age for user:  "
    user_age = gets.chomp.to_i
    puts TerminalFormat.dash_border
    print "Is user employed? y/n:  "
    user_employed = gets.chomp.downcase
    if user_employed == "y"
      user_employed = true
    elsif user_employed == "n"
      user_employed = false
    end
    x = User.create(name: user_name, age: user_age, employed: user_employed)
    puts TerminalFormat.half_star_border
    puts "Task 'Add user' completed!"
    puts TerminalFormat.half_star_border
    x
  end

  def main3
    # "Remove user"
    print "Exact name of user to be removed:  "
    input = gets.chomp
    input = until_user_name(input)
    target = User.where(name: input)
    User.delete(target.id)
    puts TerminalFormat.half_star_border
    puts "Task 'Remove user' completed!"
    puts TerminalFormat.half_star_border
  end

  def main4
    # "Explore user-specifc commands"
    self.submain_user_commands_prompt

    input = get_user_input
    # use until private function
  end

  def main5
    # "Display all games"
    Game.all.each_with_index do |game, i|
      puts "#{i + 1}. #{game.title} (#{game.genre}, #{game.console})"
    end
  end

  def main6
    # "Add game"
    puts TerminalFormat.half_star_border
    puts "Current task: Add game"
    puts TerminalFormat.half_star_border
    print "Enter a title for game:  "
    game_title = gets.chomp
    puts TerminalFormat.dash_border
    print "Enter genre for game:  "
    game_genre = gets.chomp
    puts TerminalFormat.dash_border
    print "Enter platform for game:  "
    game_platform = gets.chomp
    x = Game.create(title: game_title, genre: game_genre, console: game_platform)
    puts TerminalFormat.half_star_border
    puts "Task 'Add game' completed!"
    puts TerminalFormat.half_star_border
    x
  end

  def main7
    # "Remove game"
    print "Exact title of game to be removed:  "
    input_title = gets.chomp
    input_title = until_game_title(input_title)
    print "Exact name of game-platform:  "
    input_platform = gets.chomp
    input_platform = until_game_platform(input_platform)
    target = Game.where(title: input_title, console: input_platform)
    Game.delete(target.id)
    puts TerminalFormat.half_star_border
    puts "Task 'Remove game' completed!"
    puts TerminalFormat.half_star_border
  end

  def main8
    # "Explore game-specific commands"
    self.submain_game_commands_prompt

    input = get_user_input
      # use until private function
  end

  def main9
    # "Exit program"
    puts TerminalFormat.full_star_border
    puts TerminalFormat.to_mid + "Thank you!"
    puts TerminalFormat.to_mid + "┈┈┈┈┈┈▕▔╲"
    puts TerminalFormat.to_mid + "┈┈┈┈┈┈┈▏▕"
    puts TerminalFormat.to_mid + "┈┈┈┈┈┈┈▏▕▂▂▂"
    puts TerminalFormat.to_mid + "▂▂▂▂▂▂╱┈▕▂▂▂▏"
    puts TerminalFormat.to_mid + "▉▉▉▉▉┈┈┈▕▂▂▂▏"
    puts TerminalFormat.to_mid + "▉▉▉▉▉┈┈┈▕▂▂▂▏"
    puts TerminalFormat.to_mid + "▔▔▔▔▔▔╲▂▕▂▂▂I"
    puts TerminalFormat.full_star_border

    Kernel.exit(true)
  end

  def main_case(input)
    case input
    when "1"
      self.main1
      # go back to main prompt start
    when "2"
      self.main2
      # go back to main prompt start
    when "3"
      self.main3
      # go back to main prompt start
    when "4"
      self.main4
      # go back to main prompt start
    when "5"
      self.main5
      # go back to main prompt start
    when "6"
      self.main6
      # go back to main prompt start
    when "7"
      self.main7
      # go back to main prompt start
    when "8"
      self.main8
      # go back to main prompt start
    when "9"
      self.main9
    end

    main_commands_prompt
  end

  private
  def all_user_names
    User.all.collect{|user| user.name }.sort
  end

  def until_user_name(input)
    until self.all_user_names.include?(input)
      puts "Invalid user name."
      puts "All user names:"
      puts TerminalFormat.dash_border
      self.all_user_names.each{|name| puts name}
      puts TerminalFormat.dash_border
      print "Exact name of user to be removed:  "
      input = gets.chomp
    end
    input
  end

  def all_game_titles
    Game.all.collect{|game| game.title}.sort.uniq
  end

  def until_game_title(input)
    until self.all_game_titles.include?(input)
      puts "Invalid game title."
      puts "All game titles:"
      puts TerminalFormat.dash_border
      self.all_game_titles.each{|title| puts title}
      puts TerminalFormat.dash_border
      print "Exact title of game to be removed:  "
      input = gets.chomp
    end
    input
  end

  def until_game_platform(input)
    platforms = ["PC", "Playstation 4", "Xbox One", "Nintendo"]
    until platforms.include?(input)
      puts "Invalid console/platform."
      puts "All platforms:"
      puts TerminalFormat.dash_border
      splatforms.each{|platform| puts platform}
      puts TerminalFormat.dash_border
      print "Exact title of platform to be removed:  "
      input = gets.chomp
    end
    input
  end

  def submain_user_commands_prompt
    user_specific_commands = ["Display games in common between two users", "Display users for a console", "Return"]

    puts "Pleace select a command number:"
    puts TerminalFormat.dash_border
    puts "User-specific commands:"
    user_specific_commands.each_with_index do |comm, i|
      puts "#{i+1} - #{comm}"
    end
    puts TerminalFormat.dash_border
  end

  def submain_game_commands_prompt
    game_specific_commands = ["Game-community average age", "Game-community gamer employment", "Game-community gamer unemployment", "Return"]

    puts "Pleace select a command number:"
    puts TerminalFormat.dash_border
    puts "Game-specific commands:"
    game_specific_commands.each_with_index do |comm, i|
      puts "#{i+1} - #{comm}"
    end
    puts TerminalFormat.dash_border
  end

  def until_valid_submain_user(input)
    possible_user_specific_commands = (1..3).to_a.collect{|n| "#{n}"}

    until possible_user_specific_commands.include?(input)
      puts TerminalFormat.half_star_border
      puts ">>> '#{input}' is an invalid choice of command. <<<"
      puts TerminalFormat.half_star_border
      submain_user_commands_prompt
      input = get_user_input
    end
    input
  end

  def until_valid_submain_game(input)
      possible_game_specific_commands = (1..4).to_a.collect{|n| "#{n}"}

      until possible_game_specific_commands.include?(input)
        puts TerminalFormat.half_star_border
        puts ">>> '#{input}' is an invalid choice of command. <<<"
        puts TerminalFormat.half_star_border
        submain_game_commands_prompt
        input = get_user_input
      end
      input
    end

end
#
# =========================================

class TerminalFormat
  def self.full_star_border
    "********************************************"
  end

  def self.half_star_border
    "**********************"
  end

  def self.dash_border
    "----------------------"
  end

  def self.to_mid
    "           "
  end

  def self.under_command
    "--------------"
  end

end

test = CommandLineInterface.new
Pry.start
