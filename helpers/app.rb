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
              player: '',
              levels: {1 => 'challenge_one'}
            }
  def self.gems
    @@store[:gems]
  end

  def self.levels
    @@store[:levels]
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

  def self.benchmark(challenge)
    world['Benchmarks'][challenge]
  end

  def self.warning(challenge)
    world['Warnings'][challenge]
  end

  def self.character(world_key)
    world[world_key.to_s]
  end

  def self.char_story(world_key)
    world[world_key.to_s]['story']
  end

  def self.actions(world_key)
    world[world_key.to_s]['actions']
  end

  def self.character_list
    world['Characters']
  end

  def self.welcome
    world['Welcome']
  end

  def self.profile
    world['Profile']
  end

  def self.game_start
    puts 'Enter game? (y/n)'.colorize(:red)
    answer = gets.chomp.downcase.strip

    case answer
    when 'yes', 'y'
      require './prompts/setup_game.rb'
    when 'no', 'n', 'exit'
      exit
    else
      exit
    end
  end

  def self.benchmark_check(current_level)
    if App.gems >= App.benchmark(current_level)
      require './prompts/challenge_two.rb'
    else
      Output.warn(App.warning(current_level))
      App.update_gems(-App.gems)
      App.player.profile
      load('./prompts/challenge_one.rb')
    end
  end
end
