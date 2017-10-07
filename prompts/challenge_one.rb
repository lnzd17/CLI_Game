challenge_one = Challenge.new(1)
challenge_one.task('taskOne')
challenge_one.task('taskTwo')

PromptHelper.benchmark_check(challenge_one.level)
