class Setup
  include App
  attr_accessor :greetings, :answers, :chars

  def initialize
    @greetings = App.welcome
    @answers = {}
    @chars = App.character_list
  end

  def greeting
    type_it(@greetings['greeting'])
  end

  def player_data
    until @chars.include?(@answers['character'])
      type_it(@greetings['character'])
      @answers['character'] = validate_input(gets.chomp, @chars, ALTS['chars'])
    end

    until @answers['name']
      type_it(@greetings['name'])
      @answers['name'] = ensure_input(gets.chomp)
    end
  end

  def create_player
    App.update_player(Player.new(@answers['name'], @answers['character']))
  end
end