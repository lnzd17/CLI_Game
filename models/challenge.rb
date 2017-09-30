class Challenge
  include App

  attr_accessor :player, :messages, :actions, :answers

  def initialize(player, messages, actions)
    @player = player
    @messages = messages
    @actions = actions
    @answers = {}
  end

  def task(key)
    message = @messages[key][0]
    response_one = @messages[key][1][0]
    response_two = @messages[key][2][0]
    responses = [response_one, response_two]

    until @answers[key] == response_one || @answers[key] == response_two
      type_it(message)
      @answers[key] = validate_input(gets.chomp, responses, ALTS['responses'])
    end

    trigger_action(key)
  end

  private

  def trigger_action(key)
    pair_one = @messages[key][1]
    count_one = @messages[key][1][1]
    count_two = @messages[key][2][1]
    action = @actions[@answers[key]]
    count = pair_one.include?(@answers[key]) ? count_one : count_two

    @player.type.move(@answers[key], count, action)
  end
end
