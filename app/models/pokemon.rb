class Pokemon < ActiveRecord::Base
    belongs_to :trainer
    belongs_to :type

    validates :name, presence: true
end