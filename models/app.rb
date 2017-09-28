require './helpers/output'
module App
  include Output

  CHARS = %w[newt gibbon].freeze
  $line_break = '**************************'

  attr_accessor :messages, :answers

  @@store = {}

  def initialize(*)
    @messages = { wave: "✋",
                  name: "What is your name? \n \n",
                  character: "Would you like to be a #{CHARS[0]} or a #{CHARS[1]}? \n \n",
                  attack: "Do you want to attack? \n \n" }
    @answers = {}
  end

  def self.recall(key)
    @@store[key.to_sym]
  end
end
