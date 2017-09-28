class Newt < Character
  include App

  def attack
    puts @actions[:newt_attack]
    @gems += 2
  end
end
