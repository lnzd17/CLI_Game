require './prompts/back_story.rb'

setup = Welcome.new
setup.greeting
setup.user_data
setup.create_player
setup.profile

require './prompts/level_one'
