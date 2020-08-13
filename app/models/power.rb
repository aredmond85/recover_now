class Power < ApplicationRecord
    belongs_to :reports
    belongs_to :heroes
    belongs_to :villains
end
