class Category < ApplicationRecord
    # Associations
    has_many :products, dependent: :destroy
    # Validations
    validates :name, presence: true, uniqueness: true
end
