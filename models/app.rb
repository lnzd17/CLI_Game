module App
  CHARS = %w[newt gibbon].freeze

  attr_accessor :messages, :answers

  @@store = {}

  def initialize(*)
    @messages = { wave: '✋',
                  name: 'What is your name?',
                  character: "Would you like to be a #{CHARS[0]} or a #{CHARS[1]}",
                  attack: 'Do you want to attack?' }
    @answers = {}
  end

  def self.recall(key)
    @@store[key.to_sym]
  end
end
