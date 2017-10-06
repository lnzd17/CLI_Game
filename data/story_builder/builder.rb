require 'json'
class Builder
  attr_accessor :template

  def initialize
    @template = JSON.parse(File.read('./data/story_builder/template.json'))
  end

  def value_str(name, *keys)
    text_file(name).each do |line|
      bury(@template, line.chomp, *keys)
    end

    fetch_value(@template, *keys)
  end

  def value_block(name, *keys)
    str = text_file(name).read
    bury(@template, str.chomp, *keys)
    fetch_value(@template, *keys)
  end

  def bury(hash, value, *keys)
    keys[0...-1].inject(hash) do |acc, h|
      acc.public_send(:[], h)
    end.public_send(:[]=, keys.last, value)
  end

  def fetch_value(hash, *keys)
    keys.reduce(hash) do |memo, key|
      memo[key] if memo
    end
  end

  def create_story
    File.open("./data/story.json", "w+") {|f| f.write(@template.to_json) }
  end

  def text_file(name)
    File.open(name)
  end

end

build = Builder.new
build.value_str('./data/story_builder/plain_text/profile.txt', 'Profile')
build.value_str('./data/story_builder/plain_text/characters.txt', 'Characters')
build.value_str('./data/story_builder/plain_text/warnings.txt', 'Warnings', 'challenge_one')
build.value_str('./data/story_builder/plain_text/benchmarks.txt', 'Benchmarks', 'challenge_one')

build.value_block('./data/story_builder/plain_text/welcome_greeting.txt', 'Welcome', 'greeting')
build.value_block('./data/story_builder/plain_text/welcome_name.txt', 'Welcome', 'name')
build.value_block('./data/story_builder/plain_text/welcome_character.txt', 'Welcome', 'character')

build.value_block('./data/story_builder/plain_text/indara_actions_accept.txt', 'Indara', 'actions', 'accept')
build.value_block('./data/story_builder/plain_text/indara_actions_decline.txt', 'Indara', 'actions', 'decline')

build.value_str('./data/story_builder/plain_text/indara_actions_flinger.txt', 'Indara', 'actions', 'flinger')
build.value_str('./data/story_builder/plain_text/indara_actions_token.txt', 'Indara', 'actions', 'token')

build.value_block('./data/story_builder/plain_text/mazei_actions_accept.txt', 'Mazei', 'actions', 'accept')
build.value_block('./data/story_builder/plain_text/mazei_actions_decline.txt', 'Mazei', 'actions', 'decline')

build.value_str('./data/story_builder/plain_text/mazei_actions_gaser.txt', 'Mazei', 'actions', 'gaser')
build.value_str('./data/story_builder/plain_text/mazei_actions_scroll.txt', 'Mazei', 'actions', 'scroll')

build.value_block('./data/story_builder/plain_text/indara_story_task_one_message.txt', 'Indara', 'story', 'task_one', 'message')
build.value_block('./data/story_builder/plain_text/indara_story_task_two_message.txt', 'Indara', 'story', 'task_two', 'message')

build.value_block('./data/story_builder/plain_text/mazei_story_task_one_message.txt', 'Mazei', 'story', 'task_one', 'message')
build.value_block('./data/story_builder/plain_text/mazei_story_task_two_message.txt', 'Mazei', 'story', 'task_two', 'message')

build.value_str('./data/story_builder/plain_text/indara_story_task_one_options.txt', 'Indara', 'story', 'task_one', 'options')
build.value_str('./data/story_builder/plain_text/indara_story_task_two_options.txt', 'Indara', 'story', 'task_two', 'options')

build.value_str('./data/story_builder/plain_text/mazei_story_task_one_options.txt', 'Mazei', 'story', 'task_one', 'options')
build.value_str('./data/story_builder/plain_text/mazei_story_task_two_options.txt', 'Mazei', 'story', 'task_two', 'options')

build.create_story
