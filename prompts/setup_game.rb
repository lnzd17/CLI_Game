require './prompts/back_story.rb'

setup = Welcome.new
setup.greeting
setup.user_data
setup.create_player
App.player.profile

require './prompts/challenge_one'
