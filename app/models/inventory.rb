class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
end
