class Type < ActiveRecord::Base
    has_many :pokemon
    has_many :trainers, through: :pokemon
end