require './helpers/output'
require './helpers/user_input'
require 'json'

module App
  include Output
  include UserInput

  file = File.read('./data/story.json')
  story = JSON.parse(file)

  file2 = File.read('./data/alts.json')
  ALTS = JSON.parse(file2).freeze

  LINE_BREAK = '**************************'.colorize(:cyan).freeze
  @@store = { gems: 0,
              story: story}

  def self.recall(key)
    @@store[key.to_sym]
  end
end
