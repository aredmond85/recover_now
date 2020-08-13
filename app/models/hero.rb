class Hero < ApplicationRecord
    belongs_to :reports
    has_many :powers
end
