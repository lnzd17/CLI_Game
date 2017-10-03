class Character
  include App

  def self.create(name)
    klass = Object.const_set(name.capitalize, Class.new(Character))
    klass.new
  end

  def move(count, action)
    App.update_jewels(count)
    format_action(action)
    App.player.jewel_count
  end
end
