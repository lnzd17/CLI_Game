class Gibbon < Character

  def attack
    @gems += 3
    Output.format_action(@actions[:gibbon_attack])
  end
end
