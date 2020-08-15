class Hero < ApplicationRecord
    validates :hero_name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :hero_name

    belongs_to :report

    has_many :powers
end
