module Output
  def delay(loop_num, output, delay_time)
    1.upto(loop_num) do |n|
      puts output
      sleep delay_time
    end
  end

  def type_output(message)
    words = message.split(/(\W)/)
    words.each do |n|
      print n
      sleep 0.1
    end
  end

  def format_action(action)
    puts $line_break
    print action.upcase + "\n"
    puts $line_break
  end
end
