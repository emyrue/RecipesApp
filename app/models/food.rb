class Food < ApplicationRecord
  has_many :inventory_foods, dependent: :destroy
  has_many :recipe_foods, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
