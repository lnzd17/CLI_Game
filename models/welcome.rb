class Welcome
  include App
  attr_accessor :greetings, :answers, :chars

  def initialize
    @greetings = App.welcome
    @answers = {}
    @chars = App.character_list
  end

  def greeting
    puts @greetings['greeting']
  end

  def user_data
    until @answers['name']
      type_it(@greetings['name'])
      @answers['name'] = ensure_input(gets.chomp)
    end

    until @chars.include?(@answers['character'])
      type_it(@greetings['character'])
      @answers['character'] = validate_input(gets.chomp, @chars, ALTS['chars'])
    end
  end

  def create_player
    App.update_player(Player.new(@answers['name'], @answers['character']))
  end
end
