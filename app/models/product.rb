class Product < ApplicationRecord
  # Associations
  belongs_to :category
  # Validations
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :discount, numericality: true, inclusion: { in: 0..100 }
end
