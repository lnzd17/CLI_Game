# gets project root
project_root = File.dirname(File.absolute_path(__FILE__))

# include models
Dir.glob(project_root + '/models/*') { |file| require file }

# includes helpers
require './helpers/user_input.rb'

# include prompts
require './prompts/setup_game'
