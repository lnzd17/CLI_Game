class Challenge
  include App

  attr_accessor :player, :messages, :actions, :answers

  def initialize
    @player = App.player
    @story = App.char_story(App.player.char_type.class)
    @actions = App.actions(App.player.char_type.class)
    @answers = {}
  end

  def task(key)
    options = [option_one(key), option_two(key)]

    until @answers[key] == option_one(key) || @answers[key] == option_two(key)
      type_it(message(key))
      @answers[key] = validate_input(gets.chomp, options, ALTS['responses'])
    end

    trigger_action(key)
  end



  private

  def trigger_action(key)
    option_one = @story[key]['options'][0]
    action = @actions[@answers[key]]
    count = option_one.include?(@answers[key]) ? count_one(key) : count_two(key)

    @player.char_type.move(@answers[key], count, action)
  end

  def message(key)
    @story[key]['message']
  end

  def option_one(key)
    @story[key]['options'][0][0]
  end

  def option_two(key)
    @story[key]['options'][1][0]
  end

  def count_one(key)
    @story[key]['options'][0][1]
  end

  def count_two(key)
    @story[key]['options'][1][1]
  end
end
