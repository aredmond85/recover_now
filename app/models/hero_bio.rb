class HeroBio < ApplicationRecord
    validates :hero_summary, presence: true, length: { minimum: 100, maximum: 500 }
    validates :hero_powers, presence: true, length: { minimum: 5, maximum: 500 }

    belongs_to :hero
end
