class Session < ApplicationRecord

    belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

    before_create do 
        self.key = SecureRandom.urlsafe_base64
    end

end
