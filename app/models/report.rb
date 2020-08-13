class Report < ApplicationRecord
    belongs_to	:assignee	has_many
    belongs_to	:requester	has_many
    has_many	:villains	
    has_many 	:heroes	
    has_many	:powers	
end
