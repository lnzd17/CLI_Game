class Character
  include Game

  def self.create(name)
    klass = Object.const_set(name.capitalize, Class.new(Character))
    klass.new
  end

  def move(count, action)
    Game.update_jewels(count)
    format_action(action)
    Game.player.jewel_count
  end
end
