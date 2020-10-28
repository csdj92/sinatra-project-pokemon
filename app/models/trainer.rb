class Trainer < ActiveRecord::Base
    has_secure_password   
    has_many :pokemon
    #has_many :types, through: :pokemon
    validates :trainer_name, :email, :password, presence: true
    validates :password, length: { minimum: 5 }, confirmation: true, 
      unless: Proc.new { |t| t.password.blank? }

    
end