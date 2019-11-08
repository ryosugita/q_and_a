class Question < ApplicationRecord
  belongs_to :user
  
  validates :content, presence:true, length: {maximum: 255}
  
  has_many :answers, dependent: :destroy
  has_many :users, through: :answers
end
