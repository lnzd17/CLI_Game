require './helpers/user_input'

RSpec.configure do |c|
  c.include UserInput
end

RSpec.describe UserInput do
  let(:responses) { { 'yes' => %w[yes y] } }
  describe 'ensure_input' do
    it 'ensures user_input not blank' do
      expect(ensure_input('hello')).to eq(clean('hello'))
    end

    it 'returns false if user_input is blank' do
      expect(ensure_input(' ')).to eq(false)
    end
  end

  describe 'validate_input' do
    arr = %w[yes no]
    it 'validates input is correct' do
      expect(validate_input('y', arr, responses)).to eq('yes')
    end

    it 'returns false if input not valid' do
      expect(validate_input('dog', arr, responses)).to eq(false)
    end
  end

  describe 'convert' do
    it 'converts abbrev input to true answer' do
      expect(convert('y', responses)).to eq('yes')
    end
  end

  describe 'clean' do
    it 'for long capitalized strings it downcases, strips, and returns only 20 chars of input' do
      input = ' ABCDEFGHIJKLMNOPQRSTUVWXYZ '
      expect(clean(input)).to eq('abcdefghijklmnopqrstu')
    end

    it 'returns input' do
      expect(clean('hello')).to eq('hello')
    end
  end
end
