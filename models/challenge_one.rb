class ChallengeOne
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
    gems_one = @messages[key][1][1]
    gems_two = @messages[key][2][1]
    actions = @actions[@answers[key]]
    gems = pair_one.include?(@answers[key]) ? gems_one : gems_two

    @player.type.send(@answers[key].to_sym, gems, actions)
  end
end
