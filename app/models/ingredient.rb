class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :name, :quantity, presence: true
end
