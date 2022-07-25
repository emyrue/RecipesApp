class User < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :recipes, dependent: :destroyf
end