# gets project root
project_root = File.dirname(File.absolute_path(__FILE__))

# include models
Dir.glob(project_root + '/models/*') { |file| require file }
# include prompts
require './prompts/setup_game'
# includes
Dir.glob(project_root + '/helpers/*') { |file| require file }
