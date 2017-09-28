require './helpers/user_input'
class Welcome
  include App

  def greeting
    puts @messages[:wave]
  end

  def user_data
    until @answers[:name]
      puts @messages[:name]
      @answers[:name] = UserInput.clean(gets.chomp)
    end

    until CHARS.include?(@answers[:character])
      puts @messages[:character]
      @answers[:character] = UserInput.validate_input(gets.chomp)
    end
  end

  def create_player
    @@store[:player] = Player.new(@answers[:name], @answers[:character])
    @@store[:gems] = @@store[:player].type.gems
  end

  def successful_setup
    puts "Name: #{@answers[:name]}"
    puts "Species: #{@answers[:character]}"
    puts "Gems: #{@@store[:gems]}"
  end
end
