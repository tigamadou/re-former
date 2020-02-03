class User < ApplicationRecord
    validates :username, :password, :email, presence: true
    validates :email, presence: true, uniqueness:true
end
