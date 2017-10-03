module PromptHelper
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
    if Game.jewels >= Game.benchmark(current_level)
      require './prompts/challenge_two.rb'
    else
      warn(Game.warning(current_level))
      Game.update_jewels(-Game.jewels)
      Game.player.profile
      load('./prompts/challenge_one.rb')
    end
  end
end
