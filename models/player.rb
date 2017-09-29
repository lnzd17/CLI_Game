class Player
  include App

  attr_accessor :name, :type

  def initialize(name, type)
    @name = name
    @type = type == CHARS[0] ? Newt.new : Gibbon.new
  end

  def profile
    puts $line_break
    type_output("NAME: #{@name} \n")
    type_output("SPECIES: #{@type.class} \n")
    type_output("GEMS: #{@@store[:gems]} \n")
    puts $line_break
  end

end
