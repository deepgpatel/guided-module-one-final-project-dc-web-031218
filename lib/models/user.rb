class User

  @@all = []

  def initialize(name, age, employed, id=nil)
    @name = name
  end

  def self.all
    @@all
  end




end
