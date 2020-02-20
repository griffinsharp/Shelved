class User < ApplicationRecord
    
    validates :first_name, presence: true

    has_many :posts, dependent: :destroy

end
