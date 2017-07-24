class Idea < ApplicationRecord
  validates :title, presence: true, uniqueness: true 
  validates :description, length: {minimum: 5, maximum: 1000} 
  belongs_to :user, optional: true
  has_many :reviews, dependent: :destroy
end
