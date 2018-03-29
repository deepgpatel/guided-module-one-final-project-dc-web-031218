require_relative '../config/environment'


bruno = User.first
# binding.pry
puts User.with_console_users("PC")
