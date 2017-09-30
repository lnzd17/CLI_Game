class Player
  include App

  attr_accessor :name, :type

  def initialize(name, type, chars)
    @name = name
    @type = type == chars[0] ? Newt.new : Gibbon.new
  end

  def profile
    puts LINE_BREAK
    type_it("#{App.profile[0]} #{@name} \n")
    type_it("#{App.profile[1]} #{@type.class} \n")
    type_it("#{App.profile[2]} #{App.gems} \n")
    puts LINE_BREAK
  end

  def gem_count
    puts LINE_BREAK
    type_it("#{App.profile[2]} #{App.gems} \n")
    puts LINE_BREAK
  end
end
