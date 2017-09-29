class Welcome
  include App
  attr_accessor :messages, :answers

  def initialize(*)
    @messages = { greeting: 'hello',
                  name: "What is your character called? \n \n",
                  character: "Will you journey as a #{CHARS[0]} or #{CHARS[1]}? \n \n"
                }
    @answers = {}
  end

  def greeting
    puts @messages[:greeting]
  end

  def user_data
    until @answers[:name]
      Output.type_output(@messages[:name])
      @answers[:name] = UserInput.clean(gets.chomp)
    end

    until CHARS.include?(@answers[:character])
      Output.type_output(@messages[:character])
      @answers[:character] = UserInput.validate_input(gets.chomp, CHARS)
    end
  end

  def create_player
    @@store[:player] = Player.new(@answers[:name], @answers[:character])
  end


end
