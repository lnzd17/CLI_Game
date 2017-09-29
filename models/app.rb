module App
  CHARS = %w[newt gibbon].freeze
  $line_break = '**************************'
  @@store = {gems: 0}

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

    def self.validate_input(user_input, arr)
      if arr.include?(user_input)
        arr[arr.find_index(user_input)]
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
