class User < ApplicationRecord
    has_secure_password
    has_many :ideas, dependent: :nullify
    has_many :reviews, dependent: :nullify
end
