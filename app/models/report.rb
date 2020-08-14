class Report < ApplicationRecord
   belongs_to :requester
   belongs_to :assignee

   has_many :villains	
   has_many :heros	
   has_many :powers	

   accepts_nested_attributes_for :villains
   accepts_nested_attributes_for :heros
   accepts_nested_attributes_for :powers
end
