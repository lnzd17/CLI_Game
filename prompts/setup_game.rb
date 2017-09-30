require './prompts/back_story.rb'

data = App.recall('story')
setup = Welcome.new(data['Welcome'], data['Characters'])
setup.greeting
setup.user_data
setup.create_player
App.recall('player').profile

require './prompts/level_one'
