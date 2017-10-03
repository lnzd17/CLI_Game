module UserInput
  ERRORS = { wrong_input: 'oops try again' }.freeze

  def ensure_input(user_input)
    if /^[a-zA-Z0-9]/ =~ user_input
      clean(user_input)
    else
      puts ''
      puts ERRORS[:wrong_input].colorize(:yellow)
      puts ''
      false
    end
  end

  def validate_input(user_input, arr, alts)
    return unless ensure_input(user_input)
    input = convert(clean(user_input), alts)

    if arr.include?(input)
      arr[arr.find_index(input)]
    else
      puts ''
      puts ERRORS[:wrong_input].colorize(:yellow)
      puts ''
      false
    end
  end

  private

  def convert(user_input, alts)
    valid = user_input
    alts.each_key.to_a.map do |key|
      valid = key if alts[key].include?(user_input)
    end
    valid
  end

  def clean(user_input)
    input = user_input.downcase.strip
    input.length > 20 ? input[0..21] : input
  end
end
