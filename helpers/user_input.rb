module UserInput
  ERRORS = { wrong_input: 'oops try again' }.freeze

  def ensure_input(user_input)
    if /^[a-zA-Z0-9]/ =~ user_input
      clean(user_input)
      true
    else
      puts ERRORS[:wrong_input]
      false
    end
  end

  def validate_input(user_input, arr, alts)
    return unless ensure_input(user_input)
    input = convert(clean(user_input), alts)

    if arr.include?(input)
      arr[arr.find_index(input)]
    else
      puts ERRORS[:wrong_input]
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
    user_input.downcase.strip
  end
end
