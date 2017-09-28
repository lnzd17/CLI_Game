# gets project root
# project_root = File.dirname(File.absolute_path(__FILE__))

# include models
# Dir.glob(project_root + '/models/*') { |file| require file }
require './models/app.rb'
require './models/welcome.rb'
require './models/player.rb'
require './models/character.rb'
require './models/gibbon.rb'
require './models/newt.rb'


# include first prompt
require './prompts/setup_game'
