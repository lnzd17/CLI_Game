require './models/setup'
require './models/character'
require './models/player'
RSpec.describe Setup do
  let(:setup) { Setup.new }
  describe 'greeting' do
    it 'returns a greeting' do
      expect(setup.greeting).to eq(type_it(setup.greetings['greeting']))
    end
  end

  describe 'player_name' do
    it 'asks for and retrieves player_name'
  end

  describe 'create_player' do
    it "returns nil if player data isn't present" do
      expect(setup.create_player).to eq(nil)
    end

    it 'creates a player ' do
      setup.answers['name'] = 'Lisa'
      setup.answers['character'] = setup.chars[0]
      player = setup.create_player
      expect(player).to eq(Game.player)
    end
  end
end
