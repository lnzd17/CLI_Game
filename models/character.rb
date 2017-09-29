class Character
  include App

  def accept(payment, action)
    @@store[:gems] += payment
    puts Output.format_action(action)
    App.recall('player').profile
  end

  def decline(payment, action)
    @@store[:gems] += payment
    puts Output.format_action(action)
    App.recall('player').profile
  end
end
