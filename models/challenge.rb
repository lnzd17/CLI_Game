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
    message = @story[key]['message']
    option_one = @story[key]['options'][0][0]
    option_two = @story[key]['options'][1][0]
    options = [option_one, option_two]

    until @answers[key] == option_one || @answers[key] == option_two
      type_it(message)
      @answers[key] = validate_input(gets.chomp, options, ALTS['responses'])
    end

    trigger_action(key)
  end

  private

  def trigger_action(key)
    option_one = @story[key]['options'][0]
    count_one = @story[key]['options'][0][1]
    count_two = @story[key]['options'][1][1]
    action = @actions[@answers[key]]
    count = option_one.include?(@answers[key]) ? count_one : count_two

    @player.char_type.move(@answers[key], count, action)
  end
end
