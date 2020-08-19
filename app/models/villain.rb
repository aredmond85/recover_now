class Villain < ApplicationRecord
    validates :villain_name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :villain_name
    
    has_and_belongs_to_many :reports, :join_table => 'report_villains'
end
