class ReportHero < ApplicationRecord
    belongs_to :report
    belongs_to :villain
  end 