class Character
  include App

  def move(response, count, action)
    App.update_gems(count)
    format_action(action)
    App.player.gem_count
  end
end
