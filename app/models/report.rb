class Report < ApplicationRecord
   validates :subject, presence: true, length: { minimum: 6, maximum: 100 }
   validates :description, presence: true, length: { minimum: 10, maximum: 300 }

   belongs_to :requester
   belongs_to :assignee

   has_many :villains	
   has_many :heros	
   has_many :powers

   accepts_nested_attributes_for :villains
   accepts_nested_attributes_for :heros
   accepts_nested_attributes_for :powers
end
