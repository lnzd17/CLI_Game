class Player
  include Game

  attr_accessor :name, :char_type

  def initialize(name, char_type)
    @name = name
    @char_type = Character.create(char_type)
  end

  def profile
    puts LINE_BREAK
    type_it("#{Game.profile[0]} #{@name.capitalize} \n")
    type_it("#{Game.profile[1]} #{@char_type.class} \n")
    type_it("#{Game.profile[2]} #{Game.jewels} \n")
    puts LINE_BREAK
  end

  def jewel_count
    puts LINE_BREAK
    type_it("#{Game.profile[2]} #{Game.jewels} \n")
    puts LINE_BREAK
  end
end
