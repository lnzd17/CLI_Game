class Character < App

  attr_accessor :gems

  def initialize(*)
    @gems = 10
    @actions = {
      newt_attack: "Stealth Bite",
      gibbon_attack: 'Battle Cry',
      hide: 'slinks away'
    }
  end

  def hide
    @gems -= 5
    Output.format_action(@actions[:hide])
  end
end
