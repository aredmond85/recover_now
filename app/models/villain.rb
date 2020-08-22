class Villain < ApplicationRecord
    validates :villain_name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :villain_name
    
    has_many :report_villains
    has_many :reports, through: :report_villains

    has_one :villain_bio
    
    scope :ordered_by_name, -> { order(villain_name: :asc) }
end 
