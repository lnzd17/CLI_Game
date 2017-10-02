require 'colorize'

module Output
  LINE_BREAK = '**************************'.colorize(:cyan).freeze

  def self.warn(warning)
    puts "\n"
    print warning.colorize(:red)
    puts "\n"
  end

  def type_it(message)
    words = message.split(/(\W)/)
    words.each do |w|
      print w.colorize(:green)
      sleep 0.1
    end
  end

  def format_action(action)
    puts "\n"
    print "*  #{action}  *\n".colorize(:yellow)
    puts "\n"
  end
end
