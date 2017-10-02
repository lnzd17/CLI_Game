require 'colorize'

module Output
  LINE_BREAK = '**************************'.colorize(:cyan).freeze

  def self.warn(warning)
    puts " "
    print warning.colorize(:red)
    puts " "
  end

  def type_it(message)
    words = message.split(/(\W)/)
    words.each do |w|
      print w.colorize(:green).on_black
      sleep 0.1
    end
  end

  def format_action(action)
    puts " "
    print "* #{action} *\n".colorize(:yellow).on_black
    puts " "
  end
end
