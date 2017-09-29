file = File.read('./data.json')
data = JSON.parse(file)

require './prompts/back_story.rb'

setup = Welcome.new(data['Welcome'])
setup.greeting
setup.user_data
setup.create_player
App.recall('player').profile

require './prompts/level_one'
