class Character
  include App
  
  def hide
    @gems -= 5
    Output.format_action(@actions[:hide])
  end
end
