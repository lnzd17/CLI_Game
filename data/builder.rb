require 'json'
class Builder
  attr_accessor :template

  def initialize
    @template = JSON.parse(File.read('./data/template.json'))
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
    File.open("./data/new.json", "w+") {|f| f.write(@template.to_json) }
  end

  def text_file(name)
    File.open(name)
  end

end

build = Builder.new
build.value_str('./data/plain_text/profile.txt', 'Profile')
build.value_str('./data/plain_text/characters.txt', 'Characters')
build.value_str('./data/plain_text/warnings.txt', 'Warnings', 'challenge_one')
build.value_str('./data/plain_text/benchmarks.txt', 'Benchmarks', 'challenge_one')
build.value_block('./data/plain_text/welcome_greeting.txt', 'Welcome', 'greeting')
build.value_block('./data/plain_text/welcome_name.txt', 'Welcome', 'name')
build.value_block('./data/plain_text/welcome_character.txt', 'Welcome', 'character')
build.create_story
