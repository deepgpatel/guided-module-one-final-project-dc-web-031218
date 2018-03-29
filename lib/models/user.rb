class User < ActiveRecord::Base

has_many :gameuser
has_many :games, through: :gameuser


end
