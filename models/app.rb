require './helpers/output'
require './helpers/user_input'

module App
  include Output
  include UserInput

  file = File.read('./alts.json')

  ALTS = JSON.parse(file).freeze
  CHARS = %w[newt gibbon].freeze
  LINE_BREAK = '**************************'.freeze
  @@store = { gems: 0 }

  def self.recall(key)
    @@store[key.to_sym]
  end
end
