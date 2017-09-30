player = App.player
type = player.type.class

challenge_one = Challenge.new(player, App.messages(type), App.actions(type))
challenge_one.task('task_one')
challenge_one.task('task_two')
