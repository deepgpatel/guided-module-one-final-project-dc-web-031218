class User

has_many :gameuser
has_many :games, through: :gameuser


end
