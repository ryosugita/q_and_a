class User < ApplicationRecord
    before_save { self.email.downcase! }
    has_secure_password
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    validates :age, presence: true, numericality: {greater_than_or_equal_to: 18}       
    
    has_many :questions
    has_many :answers
    has_many :respondings, through: :answers, source: :question

end
