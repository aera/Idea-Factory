class Review < ApplicationRecord
  validates :body, {presence: true, length: {minimum: 5, maximum: 1000}}
  belongs_to :user, optional: true 
  belongs_to :idea, optional: true
end
