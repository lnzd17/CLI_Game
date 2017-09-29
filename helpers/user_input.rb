module UserInput
  ERRORS = { wrong_input: 'oops try again' }.freeze

  def ensure_input(user_input)
    input = user_input.downcase.strip
    if /^[a-zA-Z0-9]/ =~ user_input
      input
    else
      puts ERRORS[:wrong_input]
    end
  end

  def validate_input(user_input, arr)
    input = user_input.downcase.strip
    if arr.include?(input)
      arr[arr.find_index(input)]
    else
      puts ERRORS[:wrong_input]
    end
  end
end
