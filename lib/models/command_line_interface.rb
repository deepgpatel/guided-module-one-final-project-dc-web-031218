
class CommandLineInterface

  def first_execution
    welcome
    main_commands_prompt
    input = get_user_input
    input = until_valid_main(input)
    main_case(input)
  end

  def iterative_execution
    sleep(4)
    main_menu_banner
    main_commands_prompt
    input = get_user_input
    input = until_valid_main(input)
    main_case(input)
  end

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

    puts "Please select a command number:"
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
    puts TerminalFormat.full_star_border
    puts "Current task: Display all users"
    puts TerminalFormat.full_star_border
    User.all.each_with_index do |user, i|
      if user.employed
        employment_status = "employed"
      else
        employment_status = "unemployed"
      end
      puts "#{i + 1}. #{user.name} (#{user.age} y.o., #{employment_status})"
    end
    puts TerminalFormat.full_star_border
    puts "Command 'Display all users' completed!"
    puts TerminalFormat.full_star_border

    iterative_execution
  end

  def main2
    # "Add user"
    puts TerminalFormat.full_star_border
    puts "Current task: Add user"
    puts TerminalFormat.full_star_border
    print "Enter a name for user:  "
    user_name = gets.chomp
    puts TerminalFormat.dash_border
    print "Enter age for user:  "
    user_age = gets.chomp.to_i
    puts TerminalFormat.dash_border
    print "Is user employed? y/n:  "
    user_employed = gets.chomp.downcase
    user_employed = until_y_n(user_employed)
    if user_employed == "y"
      user_employed = true
    elsif user_employed == "n"
      user_employed = false
    end
    x = User.create(name: user_name, age: user_age, employed: user_employed)
    puts TerminalFormat.full_star_border
    puts "Task 'Add user' completed!"
    puts TerminalFormat.full_star_border
    iterative_execution
  end

  def main3
    # "Remove user"
    puts TerminalFormat.full_star_border
    puts "Current task: Remove user"
    puts TerminalFormat.full_star_border
    print "Exact name of user to be removed:  "
    input = gets.chomp
    input = until_user_name(input)
    target = User.where(name: input)[0]
    User.delete(target.id)
    puts TerminalFormat.full_star_border
    puts "Task 'Remove user' completed!"
    puts TerminalFormat.full_star_border
    iterative_execution
  end

  def main4
    # "Explore user-specifc commands"
    puts TerminalFormat.full_star_border
    puts "Current task: Explore user-specific commands"
    puts TerminalFormat.full_star_border
    submain_user_commands_prompt
    input = get_user_input
    input = until_valid_submain_user(input)
    submain_user_case(input)
  end

  def main5
    # "Display all games"
    puts TerminalFormat.full_star_border
    puts "Current task: Display all games"
    puts TerminalFormat.full_star_border
    Game.all.each_with_index do |game, i|
      puts "#{i + 1}. #{game.title} (#{game.genre}, #{game.console})"
    end
    puts TerminalFormat.full_star_border
    puts "Task 'Display all games' completed!"
    puts TerminalFormat.full_star_border
    iterative_execution
  end

  def main6
    # "Add game"
    puts TerminalFormat.full_star_border
    puts "Current task: Add game"
    puts TerminalFormat.full_star_border
    print "Enter a title for game:  "
    game_title = gets.chomp
    puts TerminalFormat.dash_border
    print "Enter genre for game:  "
    game_genre = gets.chomp
    puts TerminalFormat.dash_border
    print "Enter platform for game:  "
    game_platform = gets.chomp
    game_platform = until_game_platform(game_platform)
    x = Game.create(title: game_title, genre: game_genre, console: game_platform)
    puts TerminalFormat.full_star_border
    puts "Task 'Add game' completed!"
    puts TerminalFormat.full_star_border
    iterative_execution
  end

  def main7
    # "Remove game"
    puts TerminalFormat.full_star_border
    puts "Current task: Remove game"
    puts TerminalFormat.full_star_border
    print "Exact title of game to be removed:  "
    input_title = gets.chomp
    input_title = until_game_title(input_title)
    print "Exact platform:  "
    input_platform = gets.chomp
    input_platform = until_game_platform_specific(input_platform, input_title)
    target = Game.where(title: input_title, console: input_platform)[0]
    Game.delete(target.id)
    puts TerminalFormat.full_star_border
    puts "Task 'Remove game' completed!"
    puts TerminalFormat.full_star_border
    iterative_execution
  end

  def main8
    # "Explore game-specific commands"
    puts TerminalFormat.full_star_border
    puts "Current task: Explore game-specific commands"
    puts TerminalFormat.full_star_border
    submain_game_commands_prompt

    input = get_user_input
    submain_game_case(input)
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
    until all_user_names.include?(input)
      puts "Invalid user name."
      puts TerminalFormat.half_star_border
      puts "All user names:"
      puts TerminalFormat.dash_border
      all_user_names.each_with_index do |name, i|
        if i == 0
          puts TerminalFormat.dash_border
        end
        puts "#{i+1} - #{name}"
      end
      puts TerminalFormat.dash_border
      print "Exact name of user:  "
      input = gets.chomp
    end
    input
  end

  def until_y_n(input)
    answers = ["y", "n"]
    until answers.include?(input)
      puts "Invalid selection."
      puts TerminalFormat.half_star_border
      puts "Possible selections:"
      answers.each_with_index do |answer, i|
        if i == 0
          puts TerminalFormat.dash_border
        end
        puts "#{i+1} - #{answer}"
      end
      puts TerminalFormat.dash_border
      input = gets.chomp
    end
    input
  end

  def all_game_titles
    Game.all.collect{|game| game.title}.sort.uniq
  end

  def until_game_title(input)
    until all_game_titles.include?(input)
      puts "Invalid game title."
      puts TerminalFormat.half_star_border
      puts "All game titles:"
      puts TerminalFormat.dash_border
      all_game_titles.each_with_index do |title, i|
        if i == 0
          puts TerminalFormat.dash_border
        end
        puts "#{i+1} - #{title}"
      end
      puts TerminalFormat.dash_border
      print "Exact title of game:  "
      input = gets.chomp
    end
    input
  end

  def until_game_platform(input)
    platforms = ["PC", "Playstation 4", "Xbox One", "Nintendo"]
    until platforms.include?(input)
      puts TerminalFormat.half_star_border
      puts "Invalid console/platform."
      puts TerminalFormat.half_star_border
      puts "All platforms:"
      platforms.each_with_index do |platform, i|
        if i == 0
          puts TerminalFormat.dash_border
        end
        puts "#{i+1} - #{platform}"
      end
      puts TerminalFormat.dash_border
      print "Exact title of platform:  "
      input = gets.chomp
    end
    input
  end

  def until_game_platform_specific(input, title)
    platforms = Game.where(title: title).collect {|game_instance| game_instance.console}
    until platforms.include?(input)
      puts "Invalid console/platform for this game."
      puts TerminalFormat.half_star_border
      puts "All platforms for this game:"
      puts TerminalFormat.dash_border
      platforms.each_with_index do |platform, i|
        if i == 0
          puts TerminalFormat.dash_border
        end
        puts "#{i+1} - #{platform}"
      end
      puts TerminalFormat.dash_border
      print "Exact title of platform:  "
      input = gets.chomp
    end
    input
  end

  def submain_user_commands_prompt
    user_specific_commands = ["Display games in common between two users", "Display users for a platform", "Return"]

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

  def submain_user_case(input)
    case input
    when "1"
      submain_user1
      # go back to main prompt start
    when "2"
      submain_user2
      # go back to main prompt start
    when "3"
      submain_user3
      # go back to main prompt start
    end
    #what then?
  end

  def submain_user1
    # Display games in common between two users
    #get info from user
    puts TerminalFormat.full_star_border
    puts "Current task: Display games in common between two users"
    puts TerminalFormat.full_star_border
    print "First user's name:  "
    user_input1 = gets.chomp
    user_input1 = until_user_name(user_input1)
    user_1 = User.where(name: user_input1)[0]
    puts TerminalFormat.dash_border
    print "Second user's name:  "
    user_input2 = gets.chomp
    user_input2 = until_user_name(user_input2)
    user_2 = User.where(name: user_input2)[0]

    #call method from user class
    mutual_games = user_1.same_games_as(user_2)
    puts TerminalFormat.dash_border
    puts "Mutual Games for #{user_input1} and #{user_input2}"
    puts TerminalFormat.dash_border
    if mutual_games == []
      puts "No games in common (console-specific)!"
    else
      mutual_games.each_with_index do |game, i|
        if i == 0
          puts TerminalFormat.dash_border
        end
        puts "#{i + 1} - #{game.title} (#{game.genre}, #{game.console})"
      end
    end
    puts TerminalFormat.full_star_border
    puts "Command 'Display games in common between two users' completed!"
    puts TerminalFormat.full_star_border
    iterative_execution
  end

  def submain_user2
    # Display users for a console
    puts TerminalFormat.full_star_border
    puts "Current task: Display users for a platform"
    puts TerminalFormat.full_star_border
    print "Enter console:  "
    platform = gets.chomp
    platform = until_game_platform(platform)
    platform_users = User.with_console_users(platform)
    puts TerminalFormat.half_star_border
    puts "Users for platform '#{platform}':"
    puts TerminalFormat.dash_border
    platform_users.each_with_index do |user, i|
      if i == 0
        puts TerminalFormat.dash_border
      end
      puts "#{i + 1} - #{user.name} (#{user.age} y.o)"
    end
    puts TerminalFormat.full_star_border
    puts "Command 'Display users for a platform' completed!"
    puts TerminalFormat.full_star_border
    iterative_execution
  end

  def submain_user3
    iterative_execution
  end

  def submain_game_case(input)
    case input
    when "1"
      submain_game1
      # go back to main prompt start
    when "2"
      submain_game2
      # go back to main prompt start
    when "3"
      submain_game3
      # go back to main prompt start
    when "4"
      submain_game4
    end

    # main_commands_prompt
  end

  def submain_game1
    # Game-community average age
    puts TerminalFormat.full_star_border
    puts "Current task: Display a game-community's average age"
    puts TerminalFormat.full_star_border
    print "Enter exact game title:  "
    game_title = gets.chomp
    game_title = until_game_title(game_title)
    #need to select game
    game = Game.where(title: game_title)[0]
    avg_age_hash = game.user_avg_age
    puts TerminalFormat.dash_border
    puts "Average Age Distribution (By Platform) for '#{game_title}':"
    puts TerminalFormat.dash_border
    avg_age_hash.each_pair do |platform, avg_age|
      if avg_age
        puts " - #{platform}: #{avg_age} y.o."
      else
        puts " - #{platform}: no user data"
      end
    end
    puts TerminalFormat.full_star_border
    puts "Command 'Display a game-community's average age' completed!"
    puts TerminalFormat.full_star_border
    iterative_execution
  end

  def submain_game2
    # Game-community gamer employment
    puts TerminalFormat.full_star_border
    puts "Current task: Display a game-community's gamer employment"
    puts TerminalFormat.full_star_border
    print "Enter exact game title:  "
    game_title = gets.chomp
    game_title = until_game_title(game_title)
    #need to select game
    game = Game.where(title: game_title)[0]
    employment_hash = game.user_employment
    ###
    puts TerminalFormat.dash_border
    puts "User Employment Percentage (By Platform) for '#{game_title}':"
    puts TerminalFormat.dash_border
    employment_hash.each_pair do |platform, employment_percentage|
      if employment_percentage
        puts " - #{platform}: #{employment_percentage}"
      else
        puts " - #{platform}: no user data"
      end
    end
    puts TerminalFormat.full_star_border
    puts "Command 'Display a game-community's gamer employment' completed!"
    puts TerminalFormat.full_star_border
    iterative_execution
  end

  def submain_game3
    # Game-community gamer unemployment
    puts TerminalFormat.full_star_border
    puts "Current task: Display a game-community's gamer unemployment"
    puts TerminalFormat.full_star_border
    print "Enter exact game title:  "
    game_title = gets.chomp
    game_title = until_game_title(game_title)
    #need to select game
    game = Game.where(title: game_title)[0]
    unemployment_hash = game.user_unemployment
    ###
    puts TerminalFormat.dash_border
    puts "User Unemployment Percentage (By Platform) for '#{game_title}':"
    puts TerminalFormat.dash_border
    unemployment_hash.each_pair do |platform, unemployment_percentage|
      if unemployment_percentage
        puts " - #{platform}: #{unemployment_percentage}"
      else
        puts " - #{platform}: no user data"
      end
    end
    puts TerminalFormat.full_star_border
    puts "Command 'Display a game-community's gamer unemployment' completed!"
    puts TerminalFormat.full_star_border
    iterative_execution
  end

  def submain_game4
    iterative_execution
  end

  def main_menu_banner
    puts TerminalFormat.full_star_border
    puts TerminalFormat.to_mid + "    Main Menu"
    puts TerminalFormat.full_star_border
  end

end

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
