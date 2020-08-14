class Power < ApplicationRecord
    belongs_to :report

    has_many :heros
    has_many :villains
end
