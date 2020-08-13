class Requester < ApplicationRecord
    has_many :reports

    validates :username, presence: true, length: { minimum: 6 }
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true, length: { in: 6..20 }

    
    # has_many :assignees ,through: :reports
    
end
