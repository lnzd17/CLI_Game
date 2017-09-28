
module UserInput
  include App

  @@errors = { wrong_input: 'oops try again' }

  def self.clean(user_input)
    input = user_input.downcase.strip
    if /^[a-zA-Z0-9]/ =~ user_input
      input
    else
      puts @@errors[:wrong_input]
    end
  end

  def self.validate_input(user_input)
    if CHARS.include?(user_input)
      CHARS[CHARS.find_index(user_input)]
    else
      puts @@errors[:wrong_input]
    end
  end

  def self.ensure_boolean(user_input)
    input = user_input.downcase
    case input
    when 'yes', 'y'
      true
    when 'no', 'n'
      false
    else
      puts @@errors[:wrong_input]
    end
  end
end
