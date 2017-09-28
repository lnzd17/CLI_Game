require './helpers/user_input'
class Player
  include App

  attr_accessor :name, :type

  def initialize(name, type)
    @name = name
    @type = type == CHARS[0] ? Newt.new : Gibbon.new
    super
  end

  def move(move_type = 'attack')
    move = move_type.to_sym
    confirm_input(move)

    @answers[move] == true ? @type.send(move) : @type.hide
    @@store[:gems] = @type.gems
  end

  private

  def confirm_input(move)
    until @answers[move] == false || @answers[move] == true
      puts @messages[move]
      @answers[move] = UserInput.ensure_boolean(gets.chomp)
    end
  end
end
