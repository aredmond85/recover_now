class Report < ApplicationRecord
   validates :subject, presence: true, length: { minimum: 6, maximum: 100 }
   validates :description, presence: true, length: { minimum: 10, maximum: 300 }

   belongs_to :requester
   belongs_to :assignee

   has_many :report_heros
   has_many :heros, through: :report_heros

   # has_many :report_villains
   # has_many :villains, through: :report_villains
end
