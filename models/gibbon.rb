class Gibbon < Character
  include App

  def attack
    puts @actions[:gibbon_attack]
    @gems += 3
  end

end
