class Character
  include App

  def move(response, count, action)
    @@store[:gems] += count
    format_action(action)
    App.recall('player').gem_count
  end
end
