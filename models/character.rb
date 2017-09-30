class Character
  include App

  def self.create(name)
    klass = Object.const_set(name.capitalize, Class.new(Character))
    klass.new
  end

  def move(count, action)
    App.update_gems(count)
    format_action(action)
    App.player.gem_count
  end
end
