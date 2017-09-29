file = File.read('./story.json')
data = JSON.parse(file)

player = App.recall('player')
type = player.type.class
c_data = DataParser.new(data[type.to_s])

challenge_one = ChallengeOne.new(player, c_data.messages, c_data.actions)
challenge_one.task('task_one')
