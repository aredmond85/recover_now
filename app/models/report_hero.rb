class ReportHero < ApplicationRecord
    belongs_to :report
    belongs_to :hero
  end 