class Game < ActiveRecord::Base

  has_many :gameuser
  has_many :users, through: :gameuser


end
