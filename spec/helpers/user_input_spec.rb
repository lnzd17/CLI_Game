require './helpers/user_input'

RSpec.configure do |c|
  c.include UserInput
end

RSpec.describe 'UserInput' do
  describe 'ensure_input' do
    it 'ensures user_input not blank' do
      expect(ensure_input('hello')).to eq(clean('hello'))
    end

    it 'returns false if user_input is blank' do
      expect(ensure_input(' ')).to eq(false)
    end
  end

  describe 'validate_input' do
    user_input = 'y'
    arr = %w[yes no]
    alts = { 'responses' =>
              { 'yes' => %w[yes y] } }

    it 'validates input is correct' do
      expect(validate_input(user_input, arr, alts['responses'])).to eq('yes')
    end

    it 'returns false if input not valid' do
      expect(validate_input('dog', arr, alts['responses'])).to eq(false)
    end
  end
end
