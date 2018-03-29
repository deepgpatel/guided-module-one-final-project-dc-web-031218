class Game

  has_many :gameuser
  has_many :users, through: :gameuser


end
