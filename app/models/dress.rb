class Dress < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :size, presence: true
  validates :color, presence: true
  validates :price, presence: true
  validates :material, presence: true
  validates :stock, presence: true
end
