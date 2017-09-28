line_break = '**************************'
require './prompts/back_story.rb'
puts line_break
setup = Welcome.new
setup.greeting
setup.user_data
setup.create_player
setup.successful_setup
puts line_break
require './prompts/level_one'
