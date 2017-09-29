class Character
  include App

  def accept(gems, action)
    @@store[:gems] += gems
    format_action(action)
    App.recall('player').profile
  end

  def decline(gems, action)
    @@store[:gems] += gems
    format_action(action)
    App.recall('player').profile
  end
end
