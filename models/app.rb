
class App
  CHARS = %w[newt gibbon].freeze
  $line_break = '**************************'

  attr_accessor :messages, :answers

  @@store = {}

  def initialize(*)
    @messages = { wave: "✋",
                  name: "What is your name? \n \n",
                  character: "Would you like to be a #{CHARS[0]} or a #{CHARS[1]}? \n \n",
                  attack: "Do you want to attack? \n \n" }
    @answers = {}
  end

  def self.recall(key)
    @@store[key.to_sym]
  end

  class UserInput
    @@errors = { wrong_input: 'oops try again' }

    def self.clean(user_input)
      input = user_input.downcase.strip
      if /^[a-zA-Z0-9]/ =~ user_input
        input
      else
        puts @@errors[:wrong_input]
      end
    end

    def self.validate_input(user_input)
      if CHARS.include?(user_input)
        CHARS[CHARS.find_index(user_input)]
      else
        puts @@errors[:wrong_input]
      end
    end

    def self.ensure_boolean(user_input)
      input = user_input.downcase
      case input
      when 'yes', 'y'
        true
      when 'no', 'n'
        false
      else
        puts @@errors[:wrong_input]
      end
    end
  end

  class Output
    def self.delay(loop_num, output, delay_time)
      1.upto(loop_num) do |n|
        puts output
        sleep delay_time
      end
    end

    def self.type_output(message)
      words = message.split(/(\W)/)
      words.each do |n|
        print n
        sleep 0.1
      end
    end

    def self.format_action(action)
      puts $line_break
      print action.upcase + "\n"
      puts $line_break
    end
  end


end
