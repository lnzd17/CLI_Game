require 'colorize'

module GameOutput
  LINE_BREAK = '**************************'.colorize(:cyan).freeze

  def self.warn(warning)
    puts "\n"
    print warning.colorize(:red)
    puts "\n"
  end

  def print_again(message)
    n_message = message + "\n"
    print n_message.colorize(:red)
  end

  def type_it(message)
    n_message = message + "\n"
    words = n_message.split(/(\W)/)
    words.each do |w|
      print w.colorize(:green)
      sleep 0.01
    end
  end

  def format_action(action)
    puts "\n"
    print "*  #{action}  *\n".colorize(:yellow)
    puts "\n"
  end
end
