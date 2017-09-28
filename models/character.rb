class Character
  include App

  attr_accessor :gems

  def initialize(gems = 10, actions = nil)
    @gems = gems
    @actions = {
      newt_attack: 'Stealth Bite',
      gibbon_attack: 'Battle Cry',
      hide: 'slinks away'
    }
    super
  end

  def hide
    @gems -= 5
    puts @actions[:hide]
  end
end
