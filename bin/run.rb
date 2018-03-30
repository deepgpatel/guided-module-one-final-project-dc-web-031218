require_relative '../config/environment'


runner = CommandLineInterface.new

runner.welcome
# runner.main_commands_prompt
# input = runner.get_user_input
# input = runner.until_valid_main(input)
# puts input
# puts "end of program"
# binding.pry
puts "Start prying: ... "
Pry.start
