module Output
  def delay_output(loop_num, output, delay_time)
    1.upto(loop_num) do
      puts output
      sleep delay_time
    end
  end

  def type_it(message)
    words = message.split(/(\W)/)
    words.each do |w|
      print w
      sleep 0.1
    end
  end

  def format_action(action)
    type_it(action.upcase + "\n")
  end
end
