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
    type_it(@greetings['character'])
    until @chars.include?(@answers['character'])
      @answers['character'] = validate_input(gets.chomp, @chars, ALTS['chars'])
      print_again(@greetings['character'])
    end

    type_it(@greetings['name'])
    until @answers['name']
      @answers['name'] = ensure_input(gets.chomp)
      print_again(@greetings['name'])
    end
  end

  def create_player
    App.update_player(Player.new(@answers['name'], @answers['character']))
  end
end
