class Game

  @@all = []

  def initialize(title, genre, id=nil)
    @title = title
    @genre = genre
    @id = id
  end

  def self.all
    @@all
  end


end
