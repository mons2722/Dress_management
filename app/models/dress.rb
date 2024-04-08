class Dress < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :sizes  

   has_one_attached :image
  
  validates :name, presence: true, format: { with: /\A[\w\s]+\z/, message: "only allows letters, numbers, and spaces" }

  validates :color, presence: true
  validates :price, presence: true, numericality: { only_float: true }
  validates :material, presence: true
  validates :stock, presence: true, numericality: { only_integer: true }


  validate :valid_stock_format

  private
  def valid_stock_format
    unless stock.is_a?(Integer)
      errors.add(:stock, "must be an integer")
    end
  end
end
