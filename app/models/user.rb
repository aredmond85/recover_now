class User < ApplicationRecord
    validates :username, presence: true, length: { minimum: 6 }
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true, length: { in: 6..20 }
end
