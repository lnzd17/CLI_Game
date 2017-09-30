require 'colorize'

module Output
  LINE_BREAK = '**************************'.colorize(:cyan).freeze

  def delay_output(loop_num, output, delay_time)
    1.upto(loop_num) do
      puts output
      sleep delay_time
    end
  end

  def type_it(message)
    words = message.split(/(\W)/)
    words.each do |w|
      print w.colorize(:green).on_black
      sleep 0.1
    end
  end

  def format_action(action)
    print "* #{action} *\n".colorize(:yellow).on_black
  end
end
