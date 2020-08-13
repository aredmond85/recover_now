class Report < ApplicationRecord
   belongs_to :requester
   belongs_to :assignee

    # has_many :villains	
    # has_many :heroes	
    # has_many :powers	
end
