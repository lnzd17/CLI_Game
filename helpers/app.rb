require './helpers/output'
require './helpers/user_input'
require 'json'

module App
  include Output
  include UserInput

  file = File.read('./data/story.json')
  story = JSON.parse(file)

  file2 = File.read('./data/alts.json')
  ALTS = JSON.parse(file2).freeze

  LINE_BREAK = '**************************'.colorize(:cyan).freeze
  
  @@store = { gems: 0,
              story: story,
              player: ''}

  def self.recall(key)
    @@store[key.to_sym]
  end

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

  def self.story
    @@store[:story]
  end

  def self.char_story(story_key)
    self.story[story_key.to_s]
  end

  def self.messages(story_key)
    self.story[story_key.to_s]['messages']
  end

  def self.actions(story_key)
    self.story[story_key.to_s]['actions']
  end

  def self.characters
    self.story['Characters']
  end

  def self.welcome
    self.story['Welcome']
  end

  def self.profile
    self.story['Profile']
  end
end
