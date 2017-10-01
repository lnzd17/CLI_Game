class Player
  include App

  attr_accessor :name, :char_type

  def initialize(name, char_type)
    @name = name
    @char_type = Character.create(char_type)
  end

  def profile
    puts LINE_BREAK
    type_it("#{App.profile[0]} #{@name.capitalize} \n")
    type_it("#{App.profile[1]} #{@char_type.class} \n")
    type_it("#{App.profile[2]} #{App.gems} \n")
    puts LINE_BREAK
  end

  def gem_count
    puts LINE_BREAK
    type_it("#{App.profile[2]} #{App.gems} \n")
    puts LINE_BREAK
  end
end
