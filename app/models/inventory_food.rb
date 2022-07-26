class InventoryFood < ApplicationRecord
  belongs_to :food
  belongs_to :inventory
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
