class VillainBio < ApplicationRecord
    validates :villain_summary, presence: true, length: { minimum: 100, maximum: 500 }
    validates :villain_powers, presence: true, length: { minimum: 5, maximum: 500 }
    
    belongs_to :villain
end
