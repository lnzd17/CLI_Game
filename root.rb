# gets project root
project_root = File.dirname(File.absolute_path(__FILE__))

# include models
Dir.glob(project_root + '/models/*') { |file| require file }

# include first prompt
require './prompts/setup_game'
