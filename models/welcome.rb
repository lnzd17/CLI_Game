class Welcome < App
  def greeting
    puts @messages[:wave]
  end

  def user_data
    until @answers[:name]
      Output.type_output(@messages[:name])
      @answers[:name] = UserInput.clean(gets.chomp)
    end

    until CHARS.include?(@answers[:character])
      Output.type_output(@messages[:character])
      @answers[:character] = UserInput.validate_input(gets.chomp)
    end
  end

  def create_player
    @@store[:player] = Player.new(@answers[:name], @answers[:character])
    @@store[:gems] = @@store[:player].type.gems
  end

  def profile
    puts " "
    puts $line_break
    puts "NAME: #{@answers[:name]}"
    puts "SPECIES: #{@answers[:character]}"
    puts "GEMS: #{@@store[:gems]}"
    puts $line_break
    puts " "
  end
end
