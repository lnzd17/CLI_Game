challenge_one = Challenge.new(1)
challenge_one.task('task_one')
challenge_one.task('task_two')

PromptHelper.benchmark_check(challenge_one.level)
