class Hero < ApplicationRecord
    has_many :report_heros
    has_many :reports, through: :report_heros
end
