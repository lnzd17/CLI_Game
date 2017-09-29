class Welcome
  include App
  attr_accessor :messages, :answers

  def initialize(messages)
    @messages = messages
    @answers = {}
  end

  def greeting
    puts @messages['greeting']
  end

  def user_data
    until @answers['name']
      type_output(@messages['name'])
      @answers['name'] = ensure_input(gets.chomp)
    end

    until CHARS.include?(@answers['character'])
      type_output(@messages['character'])
      @answers['character'] = validate_input(gets.chomp, CHARS)
    end
  end

  def create_player
    @@store[:player] = Player.new(@answers['name'], @answers['character'])
  end
end
