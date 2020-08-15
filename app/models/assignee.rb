class Assignee < ApplicationRecord
    before_save { self.email = email.downcase }

    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,  uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
    validates :password_digest, presence: true, length: { in: 6..20 }

    has_many :reports
    has_many :requesters, through: :reports
end
