class Report < ApplicationRecord
   validates :subject, presence: true, length: { minimum: 6, maximum: 100 }
   validates :description, presence: true, length: { minimum: 10, maximum: 300 }

   belongs_to :user
   has_and_belongs_to_many :heros, :join_table => 'report_heros'

   belongs_to :user
   has_and_belongs_to_many :villain, :join_table => 'report_villains'
end
