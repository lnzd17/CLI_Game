require 'json'
class Builder
  attr_accessor :template, :dir

  def initialize
    @template = Hash.new{ |h,k| h[k] = Hash.new(&h.default_proc) }
    @dir = Dir['./data/story_builder/plain_text/*']
  end

  def create_story
    File.open('./data/story.json', 'w+') { |f| f.write(@template.to_json) }
  end

  def bury(hash, value, *keys)
    keys[0...-1].reduce(hash) do |acc, h|
      acc.public_send(:[], h)
    end.public_send(:[]=, keys.last, value)
  end

  def generator
    @dir.entries.map do |f|
      str = File.open(f).read
      keys = f.split('/').last.chomp('.txt').split('_')
      bury(@template, str.chomp, *keys)
    end
  end
end

build = Builder.new
build.generator
build.create_story
