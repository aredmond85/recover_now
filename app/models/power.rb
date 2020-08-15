class Power < ApplicationRecord
    validates :power_type, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :power_type
    
    belongs_to :report

    has_many :heros
    has_many :villains
end
