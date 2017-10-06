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
    action = @actions[@answers[key]]
    count = options_counts(key)[0].include?(@answers[key]) ? count_one(key) : count_two(key)

    @player.char_type.move(count, action)
  end

  def options_counts(key)
    new_arr = []
    arr = @story[key]['options'].split(',')
    new_arr << [arr[0], arr[1].to_i]
    new_arr << [arr[2], arr[3].to_i]
    new_arr
  end

  def message(key)
    @story[key]['message']
  end

  def option_one(key)
    options_counts(key)[0][0]
  end

  def option_two(key)
    options_counts(key)[1][0]
  end

  def count_one(key)
    options_counts(key)[0][1]
  end

  def count_two(key)
    options_counts(key)[1][1]
  end
end
