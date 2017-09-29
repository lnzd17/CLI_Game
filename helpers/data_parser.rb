class DataParser
  attr_accessor :messages, :actions
  
  def initialize(data_for_character)
    self.messages = data_for_character['messages']
    self.actions = data_for_character['actions']
  end
end
