class ChallengeOne
  include App

  attr_accessor :player, :messages, :actions, :answers

  def initialize(player, messages, actions )
    @player = player
    @messages = messages
    @actions = actions
    @answers = {}
  end

  def task(key)
    until @answers[key] == @messages[key][1][0] || @answers[key] == @messages[key][2][0]
      type_output(@messages[key][0])
      @answers[key] = validate_input(gets.chomp, [ @messages[key][1][0], @messages[key][2][0] ])
    end

    gems = @messages[key][1].include?(@answers[key]) ? @messages[key][1][1] : @messages[key][2][1]
    @player.type.send(@answers[key].to_sym, gems, @actions[@answers[key]] )
  end

end
