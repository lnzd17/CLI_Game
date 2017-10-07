class Setup
  include Game

  attr_accessor :greetings, :answers, :chars

  def initialize
    @greetings = Game.welcome
    @answers = {}
    @chars = Game.character_list
  end

  def greeting
    type_it(@greetings['greeting'])
  end

  def character_choice
    index = 0
    until @chars.include?(@answers['character'])
      index += 1
      type_it(@greetings['character']) if index == 1
      @answers['character'] = validate_input(gets.chomp, @chars, Game.alt_chars)
      print_again(@greetings['character']) unless @chars.include?(@answers['character'])
    end
  end

  def player_name
    until @answers['name']
      type_it(@greetings['name'])
      @answers['name'] = ensure_input(gets.chomp)
    end
  end

  def create_player
    if @answers['name'].nil? || @answers['name'].nil?
      nil
    else
      Game.update_player(Player.new(@answers['name'], @answers['character']))
    end
  end
end
