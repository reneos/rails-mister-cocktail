class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: (0..5).to_a }, numericality: true
end
