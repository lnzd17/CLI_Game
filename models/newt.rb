class Newt < Character
  include App

  def attack
    @gems += 2
    format_action(@actions[:newt_attack])
  end
end
