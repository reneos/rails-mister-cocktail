class Cocktail < ApplicationRecord
  has_one_attached :photo, dependent: :destroy
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :photo, presence: true
end
