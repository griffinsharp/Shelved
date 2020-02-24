class User < ApplicationRecord
    has_secure_password
    validates :first_name, presence: true
    has_many :posts, dependent: :destroy

    has_many :sessions,
    foreign_key: :user_id,
    class_name: :Session
    

end
