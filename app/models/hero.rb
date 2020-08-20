class Hero < ApplicationRecord
    validates :hero_name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :hero_name
    
    has_many :report_heros
    has_many :reports, through: :report_heros, dependent: :destroy

    has_one :hero_bio
end
