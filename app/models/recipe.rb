class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
  validates :public, inclusion: { in: [true, false] }
end
