class Hero < ApplicationRecord
    belongs_to :report

    has_many :powers
end
