challenge_one = Challenge.new('challenge_one')
challenge_one.task('task_one')
challenge_one.task('task_two')


if App.gems >= App.benchmark(challenge_one.level)
  require './prompts/challenge_two.rb'
else
  Output.warn(App.warning(challenge_one.level))
  App.update_gems(-App.gems)
  App.player.profile
  load('./prompts/challenge_one.rb')
end
