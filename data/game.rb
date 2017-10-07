require './helpers/game_output'
require './helpers/user_input'
require 'json'

module Game
  include GameOutput
  include UserInput

  file = File.read('./data/story.json')
  world = JSON.parse(file)

  @@store = { jewels: 0,
              world: world,
              player: '',
              levels: { 1 => 'challengeOne' } }

  def self.actions(world_key)
    world[world_key.to_s]['actions']
  end

  def self.alt_chars
    world['Alts']['chars']
  end

  def self.alt_resps
    world['Alts']['responses']
  end

  def self.benchmark(challenge)
    world['Benchmarks'][challenge].to_i
  end

  def self.character(world_key)
    world[world_key.to_s]
  end

  def self.character_list
    world['Characters'].split(',')
  end

  def self.char_story(world_key)
    world[world_key.to_s]['story']
  end

  def self.jewels
    @@store[:jewels]
  end

  def self.levels
    @@store[:levels]
  end

  def self.player
    @@store[:player]
  end

  def self.profile
    world['Profile'].split(',')
  end

  def self.update_jewels(count)
    @@store[:jewels] += count
  end

  def self.update_player(player)
    @@store[:player] = player
  end

  def self.warning(challenge)
    world['Warnings'][challenge]
  end

  def self.welcome
    world['Welcome']
  end

  def self.world
    @@store[:world]
  end
end
