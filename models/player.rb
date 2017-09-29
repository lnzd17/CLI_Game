class Player
  include App

  attr_accessor :name, :type

  def initialize(name, type)
    @name = name
    @type = type == CHARS[0] ? Newt.new : Gibbon.new
  end

  def profile
    puts " "
    puts $line_break
    puts "NAME: #{@name}"
    puts "SPECIES: #{@type.class}"
    puts "GEMS: #{@@store[:gems]}"
    puts $line_break
    puts " "
  end

end
