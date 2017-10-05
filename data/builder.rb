require 'json'
class Builder
  attr_accessor :template, :plain_text_dir

  def initialize
    @template = JSON.parse(File.read('./data/template.json'))
    @plain_text_dir = Dir["./data/plain_text/*"]
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

  def dir_files
    @plain_text_dir.entries
  end

  def text_file(name)
    File.open(dir_files[dir_files.find_index(name)])
  end

end

  # file = File.read('./data/template.json')
  # template = JSON.parse(file)
  #
  # chars = File.open('./data/characters.txt')
  #   chars.each do |line|
  #     template['Characters'] << line.chomp
  #   end
  #
  # File.open("./data/new.json", "w+") {|f| f.write(template.to_json) }
build = Builder.new
build.value_str('./data/plain_text/profile.txt', 'Profile')
build.value_str('./data/plain_text/characters.txt', 'Characters')
build.value_str('./data/plain_text/warnings.txt', 'Warnings', 'challenge_one')
build.value_str('./data/plain_text/benchmarks.txt', 'Benchmarks', 'challenge_one')
build.value_block('./data/plain_text/welcome_greeting.txt', 'Welcome', 'greeting')
build.value_block('./data/plain_text/welcome_name.txt', 'Welcome', 'name')
build.value_block('./data/plain_text/welcome_character.txt', 'Welcome', 'character')
build.create_story
