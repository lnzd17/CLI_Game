class Challenge
  include Game

  attr_accessor :player, :messages, :actions, :answers, :level

  def initialize(level)
    @player = Game.player
    @story = Game.char_story(Game.player.char_type.class)
    @actions = Game.actions(Game.player.char_type.class)
    @answers = {}
    @level = Game.levels[level]
  end

  def task(key)
    options = [option_one(key), option_two(key)]
    index = 0

    until @answers[key] == option_one(key) || @answers[key] == option_two(key)
      index += 1
      type_it(message(key)) if index == 1
      @answers[key] = validate_input(gets.chomp, options, ALTS['responses'])
      print_again(message(key)) unless @answers[key] == option_one(key) || @answers[key] == option_two(key)
    end

    trigger_action(key)
  end

  private

  def trigger_action(key)
    option_one = @story[key]['options'][0]
    action = @actions[@answers[key]]
    count = option_one.include?(@answers[key]) ? count_one(key) : count_two(key)

    @player.char_type.move(count, action)
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
