class Gibbon < Character
  include App

  def attack
    @gems += 3
    format_action(@actions[:gibbon_attack])
  end

end
