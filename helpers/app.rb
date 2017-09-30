require './helpers/output'
require './helpers/user_input'
require 'json'

module App
  include Output
  include UserInput

  file = File.read('./data/story.json')
  world = JSON.parse(file)

  file2 = File.read('./data/alts.json')
  ALTS = JSON.parse(file2).freeze

  @@store = { gems: 0,
              world: world,
              player: ''}


  def self.gems
    @@store[:gems]
  end

  def self.update_gems(count)
    @@store[:gems] += count
  end

  def self.player
    @@store[:player]
  end

  def self.update_player(player)
    @@store[:player] = player
  end

  def self.world
    @@store[:world]
  end

  def self.character(world_key)
    self.world[world_key.to_s]
  end

  def self.char_story(world_key)
    self.world[world_key.to_s]['story']
  end

  def self.actions(world_key)
    self.world[world_key.to_s]['actions']
  end

  def self.character_list
    self.world['Characters']
  end

  def self.welcome
    self.world['Welcome']
  end

  def self.profile
    self.world['Profile']
  end
end
