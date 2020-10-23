class Trainer < ActiveRecord::Base
    has_secure_password   
    has_many :pokemon
    #has_many :types, through: :pokemon
    validates :username, :email, :password, presence: true

    def slug
        self.username.downcase.gsub(" ","-")        
    end

    def self.find_by_slug(slug)
        self.all.find do |i|
            i.slug
        end
    end
end