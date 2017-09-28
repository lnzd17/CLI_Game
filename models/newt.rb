class Newt < Character

  def attack
    @gems += 2
    Output.format_action(@actions[:newt_attack])
  end
end
