player = App.player
char_type = player.char_type.class

challenge_one = Challenge.new(player, App.messages(char_type), App.actions(char_type))
challenge_one.task('task_one')
challenge_one.task('task_two')
