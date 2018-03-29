class GameUser

@@all = []

  def initialize(id=nil, user=nil, game=nil )
    @id = id
    @user = user
    @game = game
    @@all << self
  end

  def self.all
    @@all
  end

end
