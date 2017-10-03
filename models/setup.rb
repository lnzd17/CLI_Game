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
    index = 0

    until @chars.include?(@answers['character'])
      index += 1
      type_it(@greetings['character']) if index == 1
      @answers['character'] = validate_input(gets.chomp, @chars, ALTS['chars'])
      print_again(@greetings['character']) if !@chars.include?(@answers['character'])
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
