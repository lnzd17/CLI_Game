require './helpers/output'
require './helpers/user_input'

module App
  include Output
  include UserInput

  CHARS = %w[newt gibbon].freeze
  $line_break = '**************************'
  @@store = {gems: 0}

  def self.recall(key)
    @@store[key.to_sym]
  end
end
